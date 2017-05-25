#' Get height of the world at a given position
#'
#' Get height of the world at a given position
#'
#' @param x north/south position
#' @param z east/west position
#'
#' @return Integer with height of block just above the last bit of non-air.
#'
#' @examples
#' \dontrun{
#' mc <- mc_connect()
#' getHeight(0,0)
#' }
#'
#' @export

getHeight <- function(x,z)
{
    as.integer(
        mc_sendreceive(merge_data("world.getHeight", x, z))
    )
}
