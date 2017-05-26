#' Get height of the world at a given position
#'
#' Get height of the world at a given position, where the world's
#' height is defined as the height of the highest non-air point at
#' that location.
#'
#' @inheritParams getBlock
#'
#' @return Integer with height of block just above the last bit of
#'    non-air at the specified x / z position.
#'
#' @examples
#' \dontrun{
#' mc_connect()
#' getHeight(0,0)
#' }
#'
#' @export

getHeight <- function(x,z)
{
    x <- round(as.numeric(x))
    z <- round(as.numeric(z))

    as.integer(
        mc_sendreceive(merge_data("world.getHeight", x, z))
    )
}
