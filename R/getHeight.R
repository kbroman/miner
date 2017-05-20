#' Get height of the world at a given position
#'
#' Get height of the world at a given position
#'
#' @param con Socket connection to minecraft server
#' @param x north/south position
#' @param z east/west position
#'
#' @return Integer with height of block just above the last bit of non-air.
#'
#' @export

getHeight <- function(con, x,z)
{
    as.integer(
        mc_sendreceive(paste0("world.getHeight(", as.integer(x), ",", as.integer(z), ")"), con)
    )
}
