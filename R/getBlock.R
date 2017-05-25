#' Determine block type and style at some position
#'
#' Determine the type of the block at position x (north / south),
#' y (height), z (east / west). By default, the block's style is 
#' also given, although the style can be excluded from the output 
#' using the \code{include_style} parameter. 
#'
#' @param x A numeric string with north/south position
#' @param y A numeric string with height
#' @param z A numeric string with east/west position
#' @param include_style A logical value of whether the block's
#'    style should also be included in the output (defaults to TRUE). 
#'
#' @return A numeric vector of length one or two with the type ID 
#'    and style, if \code{include_style} is \code{TRUE}, of the block 
#'    at position (x, y, z). You can use \code{\link{find_item}} to 
#'    find the name of the block type based on this returned ID.
#'
#' @examples
#' \dontrun{
#' mc_connect()
#' h <- getHeight(0,0)
#' b_type <- getBlock(0,h,0)
#' b_type
#' 
#' find_item(id = b_type[1])
#' find_item(id = b_type[1], style = b_type[2])
#' 
#' getBlock(0,h,0, include_style = FALSE)
#' }
#'
#' @importFrom stats setNames
#' @export

getBlock <- function(x,y,z, include_style = TRUE)
{
    x <- round(x)
    y <- round(y)
    z <- round(z)
    result <- mc_sendreceive(merge_data("world.getBlockWithData", x, y, z))

    # convert to vector of length 2
    out <- stats::setNames(as.numeric(strsplit(result, ",")[[1]]), c("typeID", "style"))
    if(include_style){
      return(out)
    } else {
      return(out[1])
    }

}


#' Determine block types in a cuboid
#'
#' Determine block types in a cuboid defined by (x0,y0,z0) to (x1,y1,z1)
#'
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
#' mc_connect()
#' h <- getHeight(0,0)
#' getBlocks(0,h,0, 0, h+5, 0)
#' }
#'
#' @export

getBlocks <- function(x0,y0,z0, x1,y1,z1)
{
    x0 <- round(x0)
    y0 <- round(y0)
    z0 <- round(z0)
    x1 <- round(x1)
    y1 <- round(y1)
    z1 <- round(z1)
    result <- mc_sendreceive(merge_data("world.getBlocks", x0, y0, z0, x1, y1, z1))
    result <- as.numeric(strsplit(result, ",")[[1]])
    result <- array(result, dim=c(z1-z0+1, x1-x0+1, y1-y0+1))
    result <- aperm(result, c(2,3,1))
    dimnames(result) <- list(x0:x1, y0:y1, z0:z1)
    result
}
