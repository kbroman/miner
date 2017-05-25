# player.getRotation()
# player.getPitch()
# player.getDirection()  [vector of three values separated by commas]


#' Get player rotation
#'
#' Get player rotation from current position
#'
#' @param con Socket connection to minecraft server
#' @return double of length 1 with rotatio
#'
#'
#' @examples
#' \dontrun{
#' mc <- mc_connect()
#' getPlayerRotation(mc)
#' }
#'
#' @seealso [getPlayerDirection]
#'
#' @export

getPlayerRotation <- function(con)
{
  p <- mc_sendreceive("player.getRotation()", con)
  as.numeric(p)
}


#' Get player pitch
#'
#' Return player pitch
#'
#' @param con Socket connection to minecraft server 
#'
#' @return a vector double of length one with pitch
#' @export
#'
#' @examples
#' \dontrun{
#' mc <- mc_connect()
#' getPitch(mc)
#' }
getPitch <- function(con) {
  
  p <- mc_sendreceive("player.getPitch()", con)
  as.numeric(p)
  
}


#' Get direction vector
#'
#' Get direction vector
#'
#' @param con Socket connection to minecraft server
#'
#' @return A vector of length 3 with coordinates of current direction 
#' @export
#'
#' @examples
#' \dontrun{
#' mc <- mc_connect()
#' getDirection(mc)
#' }
getDirection <- function(con) {
  
  z <- mc_sendreceive("player.getDirection()", con)
  as.numeric(strsplit(z, ",")[[1]])
  
  
}
