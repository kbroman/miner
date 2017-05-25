#' Change player position
#'
#' Move player to position (x,y,z)
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
#' p <- getPlayerPos(mc)
#' setPlayerPos(mc, 0, p + 5, 0)
#' }
#'
#' @export
#'
setPlayerPos <- function(con, x,y,z)
{


  mc_send(merge_data("player.setPos", x, y, z), con)

}

#' Change player position to a tile
#'
#' Move player to tile position (x,y,z)
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
#' p <- getPlayerPost(mc)
#' setPlayerPos(mc, 0, p + 5, 0)
#' }
#'
#' @export
#'
setPlayerTilePos <- function(con, x,y,z)
{
  x <- round(x)
  y <- round(y)
  z <- round(z)

  mc_send(merge_data("player.setTile", x, y, z), con)

}
