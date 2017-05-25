#' Get player rotation
#'
#' Get the current rotation of the player. This can be run for a different 
#' player by using the \code{player_id} argument. 
#' 
#' @inheritParams getPlayerPos
#'
#' @return A double vector of length 1 with a value between 
#' -360 and 360 giving the angle of rotation of the player.  
#'
#'
#' @examples
#' \dontrun{
#' getPlayerRotation()
#' 
#' example_playerId <- getPlayerIds()[1]
#' getPlayerRotation(example_playerId)
#' }
#'
#' @seealso \code{\link{getPlayerDirection}}
#'
#' @export

getPlayerRotation <- function(player_id = NULL)
{
  if(is.null(id)){
    p <- mc_sendreceive("player.getRotation()")    
  } else {
    p <- mc_sendreceive(merge_data("entity.getRotation", player_id))
  }

  as.numeric(p)
}


#' Get player pitch
#'
#' Return the player's pitch (angle in the up / down direction).
#' This can be run for a different player by using the \code{player_id}
#' argument. 
#' 
#' @inheritParams getPlayerPos
#'
#' @return A double vector of length one with a value between 
#' -90 and 90 giving the pitch of the player.
#'
#' @examples
#' \dontrun{
#' getPlayerPitch()
#' 
#' example_playerId <- getPlayerIds()[1]
#' getPlayerPitch(example_playerId)
#' }
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
#' The default is to get the direction for the current player, but the directions
#' of other players can be gotten using the \code{player_id} argument.  
#'
#' @return A numeric vector of length 3 with coordinates of the player's current 
#'    direction as a unit vector. 
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
#' @export
getPlayerDirection <- function(player_id = NULL) {
  
  if(is.null(player_id)){
    z <- mc_sendreceive("player.getDirection()")
  } else {
    z <- mc_sendreceive(merge_data("entity.getDirection", player_id))    
  }
  
  as.numeric(strsplit(z, ",")[[1]])
  
}
