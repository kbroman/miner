#' Set a player's rotation
#'
#' Set a player's rotation
#'
#' @md
#'
#' @param angle Angle of rotation (0-360)
#' @param id Player or entity ID
#'
#' @examples
#' \dontrun{
#' mc_connect()
#' getPlayerIds()
#' current <- getPlayerRotation(355)
#' setPlayerRotation(current + 90, 355)
#' }
#'
#' @seealso [getPlayerRotation()], [setPlayerPitch()], [setPlayerDirection()],
#'     [setPlayerPos()]
#'
#' @export
#'

setPlayerRotation <- function(angle, id)
{

    mc_sendreceive(merge_data("entity.setRotation", angle, id))

}


#' Set a player's pitch
#'
#' Set a player's pitch
#'
#' @md
#'
#' @param angle Angle of pitch (-90 is straight up and +90 is straight down)
#' @param id Player or entity ID
#'
#' @examples
#' \dontrun{
#' mc_connect()
#' getPlayerIds()
#' setPlayerPitch(45, 355)
#' }
#'
#' @seealso [getPlayerPitch()], [setPlayerRotation()], [setPlayerDirection()],
#'     [setPlayerPos()]
#'
#' @export
#'

setPlayerPitch <- function(angle, id)
{

    mc_send(merge_data("player.setPitch", angle, id))

}




#' Set a player's direction
#'
#' Set a player's direction
#'
#' @md
#'
#' @param x east/west direction
#' @param y up/down direction
#' @param z north/south direction
#' @param id Player or entity ID
#'
#' @details (`x`, `y`, `z`) define a unit vector to which the player will now point.
#'
#' @examples
#' \dontrun{
#' mc_connect()
#' getPlayerIds()
#' setPlayerDirection(45, 355)
#' }
#'
#' @seealso [getPlayerDirection()], [setPlayerRotation()], [setPlayerPitch()],
#'     [setPlayerPos()]
#'
#' @export
#'

setPlayerDirection <- function(x, y, z, id)
{

    mc_send(merge_data("player.setDirection", x, y, z, id))

}
