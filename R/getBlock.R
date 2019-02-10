#' Determine block type and style at some position
#'
#' Determine the type of the block at position x (north / south),
#' y (height), z (east / west). By default, the block's style is
#' also given, although the style can be excluded from the output
#' using the `include_style` parameter.
#'
#' @md
#'
#' @param x A numeric string with north/south position
#' @param y A numeric string with height
#' @param z A numeric string with east/west position
#' @param include_style A logical value of whether the block's
#'    style should also be included in the output (defaults to TRUE).
#'
#' @return A numeric vector of length one or two with the type ID
#'    and style, if `include_style` is `TRUE`, of the block
#'    at position (x, y, z). You can use [find_item()] to
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
    x <- floor(as.numeric(x))
    y <- floor(as.numeric(y))
    z <- floor(as.numeric(z))
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
#' Determine block types in a cuboid for which one corner is at
#' the position (x0, y0, z0) and the opposite corner is at the position
#' (x1, y1, z1).
#'
#' @param x0 A numeric value giving the starting north / south position
#'    of the cuboid.
#' @param y0 A numeric value giving the starting height
#'    of the cuboid.
#' @param z0 A numeric value giving the starting east / west position
#'    of the cuboid.
#' @param x1 A numeric value giving the north / south position of
#'    the opposite corner of the cuboid.
#' @param y1 A numeric value giving the ending height of
#'    the opposite corner of the cuboid.
#' @param z1 A numeric value giving the ending east / west position of
#'    the opposite corner of the cuboid.
#'
#' @return An 3-D array of integers where each integer gives the ID of the
#'    type of a block in the cuboid.
#'
#' @examples
#' \dontrun{
#' mc_connect()
#' h <- getHeight(0,0)
#' block_types <- getBlocks(0, h, 0, 1, h + 3, 2)
#' block_types
#'
#' find_item(id = block_types[1, 1, 1])
#' }
#'
#' @export

getBlocks <- function(x0,y0,z0, x1,y1,z1)
{
    x0 <- floor(as.numeric(x0))
    y0 <- floor(as.numeric(y0))
    z0 <- floor(as.numeric(z0))

    x1 <- floor(as.numeric(x1))
    y1 <- floor(as.numeric(y1))
    z1 <- floor(as.numeric(z1))

    result <- mc_sendreceive(merge_data("world.getBlocks", x0, y0, z0, x1, y1, z1))

    # blocks come back as a vector with values separated by commas
    result <- as.numeric(strsplit(result, ",")[[1]])
    # the order of things is a bit tricky
    result <- array(result, dim=c(abs(z1-z0)+1, abs(x1-x0)+1, abs(y1-y0)+1))
    result <- aperm(result, c(2,3,1))

    dimnames(result) <- list(x0:x1, y0:y1, z0:z1)
    result
}
