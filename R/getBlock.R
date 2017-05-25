#' Determine block type at some position
#'
#' Determine block type at position (x,y,z)
#'
#' @param con Socket connection to minecraft server
#' @param x north/south position
#' @param y height
#' @param z east/west position
#'
#' @return None.
#'
#' @examples
#' \dontrun{
#' mc <- mc_connect()
#' h <- getHeight(mc, 0,0)
#' getBlock(mc,  0,h,0)
#' }
#'
#' @export

getBlock <- function(con, x,y,z)
{
    x <- round(x)
    y <- round(y)
    z <- round(z)
    mc_sendreceive(merge_data("world.getBlock", x, y, z), con)

}


#' Determine block type and style at some position
#'
#' Determine block type and style at position (x,y,z)
#'
#' @param con Socket connection to minecraft server
#' @param x north/south position
#' @param y height
#' @param z east/west position
#'
#' @return None.
#'
#' @examples
#' \dontrun{
#' mc <- mc_connect()
#' h <- getHeight(mc, 0,0)
#' getBlockWithStyle(mc,  0,h,0)
#' }
#'
#' @export

getBlockWithData <- function(con, x,y,z)
{
    x <- round(x)
    y <- round(y)
    z <- round(z)
    result <- mc_sendreceive(merge_data("world.getBlockWithData", x, y, z), con)

    # convert to vector of length 2
    setNames(as.numeric(strsplit(result, ",")[[1]]), c("typeID", "style"))

}


#' Determine block types in a cuboid
#'
#' Determine block types in a cuboid defined by (x0,y0,z0) to (x1,y1,z1)
#'
#' @param con Socket connection to minecraft server
#' @param x0 north/south position
#' @param y0 height
#' @param z0 east/west position
#' @param x1 north/south position
#' @param y1 height
#' @param z1 east/west position
#'
#' @return An array of integers of block IDs
#'
#' @examples
#' \dontrun{
#' mc <- mc_connect()
#' h <- getHeight(mc, 0,0)
#' getBlocks(mc,  0,h,0, 0, h+5, 0)
#' }
#'
#' @export

getBlocks <- function(con, x0,y0,z0, x1,y1,z1)
{
    x0 <- round(x0)
    y0 <- round(y0)
    z0 <- round(z0)
    x1 <- round(x1)
    y1 <- round(y1)
    z1 <- round(z1)
    result <- mc_sendreceive(merge_data("world.getBlocks", x0, y0, z0, x1, y1, z1), con)
    result <- as.numeric(strsplit(result, ",")[[1]])
    result <- array(result, dim=c(z1-z0+1, x1-x0+1, y1-y0+1))
    result <- aperm(result, c(2,3,1))
    dimnames(result) <- list(x0:x1, y0:y1, z0:z1)
    result
}
