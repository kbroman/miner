#' Get player position
#'
#' Get entity position. The default is to get the player position, but other
#' positions can be gotten using the \code{id} argument.
#'
#' @param player_id  Integer giving the ID of a player. You can find IDs of all 
#'   current players using \code{\link{getPlayerIds}}.
#' @param tile Logical value specifying whether to truncate the output position to 
#'   an integer (i.e., the location of the tile on which the player is 
#'   positioned).
#'   
#' @return A numeric vector of length three giving the position (x, y, and z) of the 
#'   requested player. 
#'
#' @examples
#' \dontrun{
#' mc_connect()
#' getPlayerPos()
#' getPlayerPos(tile = TRUE)
#'
#' example_entity <- getPlayerIds()[1]
#' getPlayerPos(example_entity)
#' }
#'
#' @export
getPlayerPos <- function(player_id = NULL, tile = FALSE)
{
  if(is.null(player_id)){
    z <- mc_sendreceive("player.getPos()")
  } else {
    z <- mc_sendreceive(merge_data("entity.getPos", player_id))
  }
    out <- as.numeric( strsplit(z, ",")[[1]] )
    
    if(tile == TRUE){
      out <- floor(out)
    }
    
    out
}
