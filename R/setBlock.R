#' Place a block
#'
#' Place a block at position (x,y,z) by type id
#'
#' @param con Socket connection to minecraft server
#' @param x north/south position
#' @param y height
#' @param z east/west position
#' @param block_id block id
#' @param block_style block_style
#'
#' @return None.
#'
#' @examples
#' \dontrun{
#' mc <- mc_connect()
#' h <- getHeight(mc, 0,0)
#' setBlock(mc,  0,h,0,  46)
#' }
#'
#' @export

setBlock <- function(con, x,y,z, block_id, block_style=0)
{
    x <- round(x)
    y <- round(y)
    z <- round(z)
    block_id <- round(block_id)
    block_style <- round(block_style)

    if(is.null(block_style) || is.na(block_style)) block_style <- 0

    mc_send(merge_data("world.setBlock", x, y, z, block_id, block_style), con)

}
