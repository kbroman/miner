#' Get player rotation
#'
#' Get the current rotation of the player.
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
  if(is.null(player_id)){
    p <- mc_sendreceive("player.getRotation()")    
  } else {
    p <- mc_sendreceive(merge_data("entity.getRotation", player_id))
  }

  as.numeric(p)
}


#' Get player pitch
#'
#' Return player pitch
#'
#' @return a vector double of length one with pitch
#' @export
#'
#' @examples
#' \dontrun{
#' getPitch()
#' }
getPlayerPitch <- function() {
  
  p <- mc_sendreceive("player.getPitch()")
  as.numeric(p)
  
}


#' Get direction vector
#'
#' Get a vector describing the current direction a player is facing. 
#'
#' @return A numeric vector of length 3 with coordinates of current direction 
#' @export
#'
#' @examples
#' \dontrun{
#' getDirection()
#' }
getPlayerDirection <- function() {
  
  z <- mc_sendreceive("player.getDirection()")
  as.numeric(strsplit(z, ",")[[1]])
  
  
}
