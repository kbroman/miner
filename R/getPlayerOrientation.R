# player.getRotation()
# player.getPitch()
# player.getDirection()  [vector of three values separated by commas]


#' Get player rotation
#'
#' Get player rotation from current position
#'
#' @return double of length 1 with rotatio
#'
#'
#' @examples
#' \dontrun{
#' getPlayerRotation()
#' }
#'
#' @seealso [getPlayerDirection]
#'
#' @export

getPlayerRotation <- function()
{
  p <- mc_sendreceive("player.getRotation()")
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
getPitch <- function() {
  
  p <- mc_sendreceive("player.getPitch()")
  as.numeric(p)
  
}


#' Get direction vector
#'
#' Get direction vector
#'
#' @return A vector of length 3 with coordinates of current direction 
#' @export
#'
#' @examples
#' \dontrun{
#' getDirection()
#' }
getDirection <- function() {
  
  z <- mc_sendreceive("player.getDirection()")
  as.numeric(strsplit(z, ",")[[1]])
  
  
}
