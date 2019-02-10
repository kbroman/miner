#' Change player position
#'
#' Move player to position (x,y,z). The default is to move the first player who
#' was spawned in the Minecraft world, but other players can also be moved using
#' the `player_id` argument. If the `tile` argument is set to `TRUE`,
#' the player will be moved to the position specified by truncating the specified
#' x, y, and z to integers.
#'
#' @md
#'
#' @inheritParams getBlock
#' @inheritParams getPlayerPos
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
#' getPlayerPos(example_entity)
#' setPlayerPos(0, p, 0, example_entity)
#' getPlayerPos(example_entity)
#' }
#'
#' @export
#'
setPlayerPos <- function(x,y,z, player_id = NULL, tile = FALSE)
{
    x <- as.numeric(x)
    y <- as.numeric(y)
    z <- as.numeric(z)


  if(tile){
    x <- floor(x)
    y <- floor(y)
    z <- floor(z)
  }


  if(is.null(player_id)){
    mc_send(merge_data("player.setPos", x, y, z))
  } else{
    player_id <- as.numeric(player_id)
    mc_send(merge_data("entity.setPos", player_id, x, y, z))
  }

}
