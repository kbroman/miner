#' Get player rotation
#'
#' Get the current rotation of a player. The default is to get the rotation for
#' the first player spawned in the Minecraft world, but this can be run for a different
#' player by using the `player_id` argument.
#'
#' @md
#'
#' @inheritParams getPlayerPos
#'
#' @return A numeric value between 0 and +360 indicating the direction
#'     that the player is facing, with 0 being south (positive z), 90
#'     being west (negative x), 180 being north (negative z), 270
#'     being east (positive x), and 360 being back at the south again.
#'
#' @examples
#' \dontrun{
#' getPlayerRotation()
#'
#' example_playerId <- getPlayerIds()[1]
#' getPlayerRotation(example_playerId)
#' }
#'
#' @seealso [getPlayerDirection()], [getPlayerPitch()], [getPlayerPos()]
#'
#' @export

getPlayerRotation <- function(player_id = NULL)
{
  if(is.null(player_id)){
    p <- mc_sendreceive("player.getRotation()")
  } else {
    p <- mc_sendreceive(merge_data("entity.getRotation", player_id))
  }

  as.numeric(p)
}


#' Get player pitch
#'
#' Return the player's pitch (angle in the up / down direction).
#' The default is to get the rotation for the first player spawned in the Minecraft
#' world, but this can be run for a different player by using the `player_id`
#' argument.
#'
#' @md
#'
#' @inheritParams getPlayerPos
#'
#' @return A numeric value between -90 and +90, giving the pitch of
#'     the player's viewpoint, with -90 indicating the player is
#'     looking straight down and +90 indicating that the player is
#'     looking straight up.
#'
#' @examples
#' \dontrun{
#' getPlayerPitch()
#'
#' example_playerId <- getPlayerIds()[1]
#' getPlayerPitch(example_playerId)
#' }
#'
#' @seealso [getPlayerDirection()], [getPlayerRotation()], [getPlayerPos()]
#'
#' @export
getPlayerPitch <- function(player_id = NULL) {

  if(is.null(player_id)){
    p <- mc_sendreceive("player.getPitch()")
  } else {
    p <- mc_sendreceive(merge_data("entity.getPitch", player_id))
  }

  as.numeric(p)

}


#' Get player direction as unit vector
#'
#' Returns a unit vector describing the current direction a player is facing.
#' The default is to get the direction for the first player spawned in the Minecraft,
#' world, but the directions of other players can be gotten using the `player_id`
#' argument.
#'
#' @md
#'
#' @return A numeric vector of length 3 with coordinates of the player's current
#'    direction (gaze) as a unit vector, (x,y,z).
#'
#' @details x is east/west with east being the positive direction. y
#'     is up/down with up being the positive direction, and z is
#'     north/south with south being the positive direction.
#'
#' @inheritParams getPlayerPos
#'
#' @examples
#' \dontrun{
#' getPlayerDirection()
#'
#' example_playerId <- getPlayerIds()[1]
#' getPlayerDirection(example_playerId)
#' }
#'
#' @seealso [getPlayerRotation()], [getPlayerPitch()], [getPlayerPos()]
#'
#' @export
getPlayerDirection <- function(player_id = NULL) {

  if(is.null(player_id)){
    z <- mc_sendreceive("player.getDirection()")
  } else {
    z <- mc_sendreceive(merge_data("entity.getDirection", player_id))
  }

  as.numeric(strsplit(z, ",")[[1]])

}
