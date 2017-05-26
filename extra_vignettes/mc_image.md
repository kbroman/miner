Rendering an image in Minecraft
================
Karl Broman

The [miner](https://github.com/ropenscilabs/miner) package makes it possible to manipulate minecraft. Here I will illustrate one use of this: reading in an image file and rendering it within minecraft as blocks.

### Load and prepare an image file

First, let's download an image file from the web

``` r
url <- paste0("https://bids.berkeley.edu/sites/default/files/styles",
              "/300x300/public/karthik_ram.jpeg?itok=loiSP_tm")
file <- "karthik.jpg"
download.file(url, file)
```

Next, let's use the [imager](https://cran.r-project.org/package=imager) package to read it into R.

``` r
library(imager)
img <- load.image(file)
```

Print to see the size of the image.

``` r
img
```

    ## Image. Width: 300 pix Height: 300 pix Depth: 1 Colour channels: 3

The image is stored as a 4-dimensional array: horizontal and vertical position, time, and color.

``` r
dim(img)
```

    ## [1] 300 300   1   3

Let's convert it to grayscale, and make it 100x100.

``` r
img <- grayscale(img)
img <- resize(img, 100, 100)
```

The level of gray is a number between 0 and 1. I'd like to coarsen that to having 7 levels, which I can turn into different kinds of minecraft blocks. I can use the R function `cut`.

``` r
img[] <- cut(img, seq(0, 1, length.out=8))
```

Now let's load the [miner](https://github.com/ROpenSciLabs/miner) package and create a vector of different block types, from black to white. We can use `find_item` to find the item IDs for these block times. "Clay" has two possible item IDs; we'll take the first one.

``` r
library(miner)
grayscale_blocks <- c("Black Wool", "Gray Wool", "Bedrock",
                     "Coal Ore", "Clay", "White Wool", "Iron Block")
grayscale_blocks <- do.call("rbind", lapply(grayscale_blocks,
                         function(a) find_item(a)[1,,drop=FALSE]))
```

Here's the result:

``` r
grayscale_blocks
```

    ##           name id style
    ## 81  Black Wool 35    15
    ## 73   Gray Wool 35     7
    ## 26     Bedrock  7     0
    ## 36    Coal Ore 16     0
    ## 149       Clay 82     0
    ## 66  White Wool 35     0
    ## 95  Iron Block 42     0

Now, let's render that in Minecraft. We use `mc_connect()` to connect to a minecraft server.

``` r
mc_connect()
```

Let's find the "host" player position, and put the image 20 blocks above his/her head. Actually, I'll hard-code it in here, so if I re-run this it ends up in the same place.

``` r
host_pos <- getPlayerPos()
host_pos[2] <- host_pos[2] + 20
```

Now, we render the image, with a nested `for` loop.

``` r
for(i in 1:100) {
    for(j in 1:100) {
        setBlock(host_pos[1]+i, host_pos[2]+j, host_pos[3],
                 grayscale_blocks[img[i,j,1,1], 2],
                 grayscale_blocks[img[i,j,1,1], 3])
    }
}
```

Oops. that gives the image upside down and backwards. Let's fix that.

``` r
for(i in 1:100) {
    for(j in 1:100) {
        setBlock(host_pos[1]+(101-i), host_pos[2]+(101-j), host_pos[3],
                 grayscale_blocks[img[i,j,1,1], 2],
                 grayscale_blocks[img[i,j,1,1], 3])
    }
}
```

The result looks like this:

![](figure/karthik_minecraft.png)
