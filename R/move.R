heading <- list()

#' Set player heading
#'
#' Set the direction in which moveForward will move the player.
#' The heading is measured in degrees.
#' A heading of 180 or -180 degreees is towards North or negative z
#' A heading of 0 degreees is towards South or positive z
#' A heading of 270 or -90 degreees is towards East or positive x
#' A heading of 90 degrees is towards West or negative x
#' 
#' @param player_id An integer with the player id
#' @param new_heading A numeric with the direction to head forward
#'
#' @examples \dontrun{
#' setHeading(myid, 0)
#' }
#'
#' @export
setHeading <- function(player_id, new_heading) {
  heading_local <- heading
  heading_local[[as.character(player_id)]] <- new_heading
  utils::assignInMyNamespace('heading', heading_local)
}

#' Set player heading to match the direction the player is facing
#' 
#' @param player_id An integer with the player id
#'
#' @examples \dontrun{
#' initHeading(myid)
#' }
#'
#' @export
initHeading <- function(player_id) {
  setHeading(player_id, getPlayerRotation(player_id))
}

#' Get player heading
#' 
#' @param player_id An integer with the player id
#' @return Player heading in degrees
#'
#' @examples \dontrun{
#' getHeading(myid)
#' }
#'
#' @export
getHeading <- function(player_id) {
  heading[[as.character(player_id)]]
}

#' Move the player in the direction of the player heading
#' 
#' @param player_id An integer with the player id
#' @param distance The distance to move the player
#'
#' @examples \dontrun{
#' initHeading(myid)
#' moveForward(myid, 0.5)
#' }
#'
#' @export
moveForward <- function(player_id, distance = 1) {
  pos <- getPlayerPos(player_id)
  player_heading_degrees <- getHeading(player_id)
  player_heading_radians <- player_heading_degrees * pi / 180
  unit_vector <- c(-sin(player_heading_radians), 0, cos(player_heading_radians))
  new_pos <- pos + unit_vector * distance
  setPlayerPos(new_pos[1], new_pos[2], new_pos[3], player_id)
}

#' Rotate the player heading to the left
#' 
#' Use a positive angle value to rotate to the left.
#' Use a negative angle to rotate to the right.
#' The player does not turn in the game; rather, the heading
#' for subsequent movement commands is rotated.
#' 
#' @param player_id An integer with the player id
#' @param angle The number of degrees to rotate left
#'
#' @examples \dontrun{
#' turnLeft(myid)
#' }
#'
#' @export
turnLeft <- function(player_id, angle = 90) {
  current_heading <- getHeading(player_id)
  new_heading <- current_heading - angle
  if (new_heading > 180) {
    new_heading <- new_heading - 360
  } else if (new_heading < -180) {
    new_heading <- new_heading + 360
  }
  setHeading(player_id, new_heading)
}

#' Check the block type (if any) ahead of the player
#' 
#' Check the block type (if any) ahead of the player.
#' Look in the direction of the player heading
#' at the specified distance.
#' 
#' @param player_id An integer with the player id
#' @param distance The distance to look
#'
#' @examples \dontrun{
#' lookForward(myid)
#' }
#'
#' @export
lookForward <- function(player_id, distance = 1) {
  pos <- getPlayerPos(player_id)
  player_heading_degrees <- getHeading(player_id)
  player_heading_radians <- player_heading_degrees * pi / 180
  unit_vector <- c(-sin(player_heading_radians), 0, cos(player_heading_radians))
  new_pos <- pos + unit_vector * distance
  getBlock(new_pos[1], new_pos[2], new_pos[3])
}
