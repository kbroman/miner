#' Change player position
#'
#' Move player to position (x,y,z). The default is to move your player, but
#' other entities can also be moved using the \code{id} argument.
#'
#' @param x north/south position
#' @param y height
#' @param z east/west position
#' @param id Entity id
#'
#' @return None.
#'
#' @examples
#' \dontrun{
#' mc_connect()
#' p <- getPlayerPos()
#' setPlayerPos(mc, 0, p + 5, 0)
#' 
#' example_entity <- getPlayerIds()[1]
#' getPlayerPos(id = example_entity)
#' setPlayerPos(0, p, 0, id = example_entity)
#' getPlayerPos(id = example_entity)
#' }
#'
#' @export
#'
setPlayerPos <- function(x,y,z, id = NULL)
{
  if(is.null(id)){
    mc_send(merge_data("player.setPos", x, y, z))    
  } else{
    mc_send(merge_data("entity.setPos", id, x, y, z))
  }


}

#' Change player position to a tile
#'
#' Move player to tile position (x,y,z)
#'
#' @param x north/south position
#' @param y height
#' @param z east/west position
#'
#' @return None.
#'
#' @examples
#' \dontrun{
#' mc_connect()
#' p <- getPlayerTilePos()
#' setPlayerTilePos(0, p + 5, 0)
#' 
#' example_entity <- getPlayerIds()[1]
#' setPlayerTilePos(0, p, 0, id = example_entity)
#' }
#'
#' @export
#'
setPlayerTilePos <- function(x,y,z, id = NULL)
{
  x <- round(x)
  y <- round(y)
  z <- round(z)

  if(is.null(id)){
    mc_send(merge_data("player.setTile", x, y, z))    
  } else {
    mc_send(merge_data("entity.setTile", x, y, z, id))        
  }

}
