#' Get player tile position
#'
#' Get player tile position
#'
#' @param con Socket connection to minecraft server
#'
#' @return vector (x,y,z)
#'
#' @examples
#' \dontrun{
#' mc <- mc_connect()
#' getPlayerTilePos(mc)
#' }
#'
#' @seealso [getPlayerPos]
#'
#' @export

getPlayerTilePos <- function(con)
{
    z <- mc_sendreceive("player.getTile()", con)
    as.numeric( strsplit(z, ",")[[1]] )
}


#' Get player position
#'
#' Get entity position. The default is to get the player position, but other
#' positions can be gotten using the \code{id} argument.
#'
#' @param con Socket connection to minecraft server
#' @param id  Entity id
#'
#' @return vector (x,y,z)
#'
#' @examples
#' \dontrun{
#' mc <- mc_connect()
#' getPlayerPos(mc)
#' 
#' example_entity <- getPlayerIds(mc)[1]
#' getPlayerPos(mc, id = example_entity)
#' }
#'
#' @seealso [getPlayerPos]
#'
#' @export

getPlayerPos <- function(con, id = NULL)
{
  if(is.null(id)){
    z <- mc_sendreceive("player.getPos()", con)    
  } else {
    z <- mc_sendreceive(merge_data("entity.getPos", id), con)
  }
    as.numeric( strsplit(z, ",")[[1]] )
}
