#' Place a block
#'
#' Place a block at position (x,y,z) by type id
#'
#' @inheritParams find_item
#' @inheritParams getBlock
#'
#' @return None.
#'
#' @examples
#' \dontrun{
#' mc_connect()
#' h <- getHeight(0, 0)
#' setBlock(0, h, 0, 46)
#' }
#'
#' @export

setBlock <- function(x, y, z, id, style=0)
{
    x <- round(x)
    y <- round(y)
    z <- round(z)
    id <- round(id)
    style <- round(style)

    if(is.null(style) || is.na(style)) style <- 0

    mc_send(merge_data("world.setBlock", x, y, z, id, style))

}


#' Place blocks in a cuboid
#'
#' Place blocks of a single type (specified by \code{id}) in the cuboid
#' with opposite corners at the positions (x0, y0, z0) and (x1, y1, z1).
#'
#' @inheritParams getBlocks
#' @inheritParams find_item
#'
#' @return None.
#'
#' @examples
#' \dontrun{
#' mc_connect()
#' 
#' ice <- find_item(name = "Ice")
#' 
#' h <- getHeight(0,0)
#' setBlocks(0, h, 0, 1, h + 3, 2, id = ice$id)
#' }
#'
#' @export

setBlocks <- function(x0,y0,z0, x1,y1,z1,  id)
{
    x0 <- round(x0)
    y0 <- round(y0)
    z0 <- round(z0)
    x1 <- round(x1)
    y1 <- round(y1)
    z1 <- round(z1)
    id <- round(id)

    mc_send(merge_data("world.setBlocks", x0, y0, z0, x1, y1, z1, id))

}
