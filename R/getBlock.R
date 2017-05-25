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
