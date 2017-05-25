#' Change player position
#'
#' Move player to position (x,y,z). The default is to move your player, but
#' other entities can also be moved using the \code{id} argument.
#'
#' @param con Socket connection to minecraft server
#' @param x north/south position
#' @param y height
#' @param z east/west position
#' @param id Entity id
#'
#' @return None.
#'
#' @examples
#' \dontrun{
#' mc <- mc_connect()
#' p <- getPlayerPos(mc)
#' setPlayerPos(mc, 0, p + 5, 0)
#' 
#' example_entity <- getPlayerIds(mc)[1]
#' getPlayerPos(mc, id = example_entity)
#' setPlayerPos(mc, 0, p, 0, id = example_entity)
#' getPlayerPos(mc, id = example_entity)
#' }
#'
#' @export
#'
setPlayerPos <- function(con, x,y,z, id = NULL)
{
  if(is.null(id)){
    mc_send(merge_data("player.setPos", x, y, z), con)    
  } else{
    mc_send(merge_data("entity.setPos", id, x, y, z), con)
  }


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
