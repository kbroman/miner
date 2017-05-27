# minerplot: render plot() in minecraft

# digits 0, 1, ..., 9 + dot using lcd-type format
# see http://uzebox.org/wiki/index.php?title=Font_Bitmaps
library(imager)

# 4x6 character set
url <- "http://uzebox.org/wiki/images/0/06/Charset_4x6_128x18.png"
char_png_4x6 <- load.image(url)
char_png_4x6 <- grayscale(char_png_4x6)
chars_4x6 <- c(" !\"#$%&'()^+,-./0123456789:;<=>?",
               "@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_",
               "`abcdefghijklmnopqrstuvwxyz{|}' ")

# 16x16 character set
url <- "http://uzebox.org/wiki/images/2/20/16x16.png"
char_png_16x16 <- load.image(url)
char_png_16x16 <- grayscale(char_png_16x16)
chars_16x16 <- c(" !\"#$%&'()*+,-./",
                 "0123456789:;<=>?",
                 "@ABCDEFGHIJKLMNO",
                 "PQRSTUVWXYZ[©]^_")

# 6x12 character set
url <- "http://uzebox.org/wiki/images/5/50/Dangen_charset_6x12.png"
char_png_6x12 <- load.image(url)
char_png_6x12 <- grayscale(char_png_6x12)
chars_6x12 <- c(" !\"#$%&'()*+,-./",
                "0123456789:;<=>?",
                "@ABCDEFGHIJKLMNO",
                "PQRSTUVWXYZ[©]^_",
                "`abcdefghijklmno",
                "pqrstuvwxyz{|}\" ")




# get bitmaps for chars
char_bitmap <- function(char, chars, png=char_png)
{
    if(length(char) > 1) {
        return(lapply(char, function(a,ch,p) char_bitmap(a, ch, p), chars, png))
    }
    if(nchar(char) > 1) {
        return(lapply(strsplit(char, "")[[1]], function(a,ch, p) char_bitmap(a, ch, p), chars, png))
    }

    chars <- matrix(unlist(strsplit(chars, "")), ncol=length(chars))

    require(imager)
    d <- dim(png)
    rows <- seq(1, d[1]+1, by=d[1]/nrow(chars))
    cols <- seq(1, d[2]+1, by=d[2]/ncol(chars))

    # row column coordinates
    wh <- which(chars==char, arr.ind=TRUE)
    if(length(wh) > 2) wh <- wh[1,]

    rows <- rows[wh[1]]:(rows[wh[1]+1]-1)
    cols <- cols[wh[2]]:(cols[wh[2]+1]-1)

    round(t(1-png[rows,cols,1,1]))
}

# merge letters into a word
#     space = number of extra pixels between letters (but not that 1 space is built into the font)
merge_letters <- function(char_bitmaps, space=0)
{
    rows <- vapply(char_bitmaps, nrow, 1)
    if(length(unique(rows)) != 1)
        stop("The characters don't all have the same height")

    if(space) {
        space <- matrix(0, nrow=rows[1], ncol=space)

        res <- vector("list", length(char_bitmaps)*2-1)
        for(i in seq(along=char_bitmaps)) {
            if(i > 1) res[[(i-1)*2]] <- space
            res[[i*2-1]] <- char_bitmaps[[i]]
        }
        char_bitmaps <- res
    }

    do.call("cbind", char_bitmaps)
}

# round a number -> char string
round_char <- function (x, digits = 1)
{
    if (digits < 1)
        stop("This is intended for the case digits >= 1.")
    if (length(digits) > 1) {
        digits <- digits[1]
        warning("Using only digits[1]")
    }
    tmp <- sprintf(paste("%.", digits, "f", sep = ""), x)
    zero <- paste0("0.", paste(rep("0", digits), collapse = ""))
    tmp[tmp == paste0("-", zero)] <- zero
    tmp
}


# render a bitmap in minecraft
#
# bitmap is matrix of 0's and 1's
# topleft is a vector of length 3 giving (x=north/south, y=up/down, z=east/west)
# id, style are single integers for block type
# fixed_dim indicates which dimension is fixed
render_bitmap <- function(bitmap, bottomleft, id, style=0,
                          fixed_dim = c("z", "y", "x"),
                          reverse=FALSE)
{
    fixed_dim <- match.arg(fixed_dim)
    x0 <- bottomleft[1]
    y0 <- bottomleft[2]
    z0 <- bottomleft[3]

    require(miner)

    if(reverse) {
        bitmap <- bitmap[,ncol(bitmap):1]
        if(fixeddim=="z") bottomleft <- bottomleft + c(ncol(bitmap), 0, 0)
        if(fixeddim=="x") bottomleft <- bottomleft + c(0, 0, ncol(bitmap))
        if(fixeddim=="y") bottomleft <- bottomleft + c(0, 0, ncol(bitmap))

        dir <- -1
    }
    else {
        dir <- +1
    }

    for(i in 1:nrow(bitmap)) {
        for(j in 1:ncol(bitmap)) {
            if(bitmap[i,j]) {
                if(fixed_dim=="z")
                    setBlock(x0+j,y0+nrow(bitmap)-i,z0,id,style)
                else if(fixed_dim=="y")
                    setBlock(x0+j,y0,z0+i,id,style)
                else # x
                    setBlock(x0,y0+nrow(bitmap)-i,z0+j,id,style)
            }
        }
    }
}


# create a function that scales numbers in in_lim to integers in out_lim
#
# for example:
#   f <- intscale(c(0,1), c(1, 200))
#   f(0.3)  # returns 61
intscale <- function(in_lim, out_lim)
{
    return(  function(x) round((x-in_lim[1])*diff(out_lim)/diff(in_lim) + out_lim[1])   )
}


mc_plot <-
    function(x=iris$Sepal.Length, y=iris$Sepal.Width, lowerleft=v, width=200, height=150,
             group=as.numeric(iris$Species), xlab="Sepal.Length", ylab="Sepal.Width")
{
    gray <- c(35, 8)
    white <- c(35, 0)
    black <- c(35, 15)
    colors <- cbind(35, c(9, 14, 5))

    lowmarg <- 14 + 3
    lefmarg <- 10 + 3

    xlim <- range(x) + diff(range(x)) * c(-0.05, 0.05)
    ylim <- range(y) + diff(range(y)) * c(-0.05, 0.05)
    xscale <- intscale(xlim, c(1+lefmarg, width) + lowerleft[1])
    yscale <- intscale(ylim, c(1+lowmarg, height) + lowerleft[2])

    xtick <- pretty(xlim, 5)
    ytick <- pretty(ylim, 5)
    xtick <- xtick[xtick >= xlim[1] & xtick <= xlim[2]]
    ytick <- ytick[ytick >= ylim[1] & ytick <= ylim[2]]
    xtick_sc <- xscale(xtick)
    ytick_sc <- yscale(ytick)

    xtick_ch <- as.character(xtick)
    ytick_ch <- as.character(ytick)

    xval <- lowerleft[1] + (lefmarg+1):width
    yval <- lowerleft[2] + (lowmarg+1):height

    # gray rectangle
    for(i in xval) {
        for(j in yval) {
            setBlock(i, j, lowerleft[3], gray[1], gray[2])
        }
    }

    # grid lines
    for(i in xtick_sc) {
        for(j in yval) {
            setBlock(i, j, lowerleft[3], white[1], white[2])
        }
    }
    for(i in xval) {
        for(j in ytick_sc) {
            setBlock(i, j, lowerleft[3], white[1], white[2])
        }
    }

    # points
    for(i in seq_along(x)) {
        setBlock(xscale(x[i]), yscale(y[i]), lowerleft[3],
                 colors[group[i],1], colors[group[i], 2])
    }

    # ticks
    for(i in xtick_sc) {
        for(j in lowerleft[2]+lowmarg - (0:1)) {
            setBlock(i, j, lowerleft[3], black[1], black[2])
        }
    }
    for(i in lowerleft[1]+lefmarg - (0:1)) {
        for(j in ytick_sc) {
            setBlock(i, j, lowerleft[3], black[1], black[2])
        }
    }

    for(i in seq_along(xtick_sc)) {
        bmp <- char_bitmap(xtick_ch[i], chars_4x6, char_png_4x6)
        render_bitmap(bmp, c(xtick_sc[i]-ncol(bmp)/2,
                             lowerleft[2] + lowmarg - 8,
                             lowerleft[3]), black[1], black[2])
    }

    for(i in seq_along(ytick_sc)) {
        bmp <- char_bitmap(ytick_ch[i], chars_4x6, char_png_4x6)
        if(is.list(bmp)) bmp <- do.call("cbind", bmp)
        render_bitmap(bmp, c(lowerleft[1] + lefmarg - ncol(bmp)-3,
                             ytick_sc[i] - nrow(bmp)/2,
                             lowerleft[3]), black[1], black[2])
    }

    # x axis labe
    bmp <- char_bitmap(xlab, chars_4x6, char_png_4x6)
    if(is.list(bmp)) bmp <- do.call("cbind", bmp)
    render_bitmap(bmp, c(mean(xscale(xlim)) - ncol(bmp)/2,
                         lowerleft[2] + lowmarg - 15,
                         lowerleft[3]), black[1], black[2])

    bmp <- char_bitmap(ylab, chars_4x6, char_png_4x6)
    if(is.list(bmp)) bmp <- do.call("cbind", bmp)
    render_bitmap(bmp, c(lowerleft[1] - ncol(bmp)-1,
                         mean(yscale(ylim)),
                         lowerleft[3]), black[1], black[2])

}

# plot gray background
# plot grid lines
# plot ticks
# plot digits on x and y axis
# plot x and y axis labels
# plot points, with colors
