#' Get player tile position
#'
#' Get player tile position
#'
#' @return vector (x,y,z)
#'
#' @examples
#' \dontrun{
#' mc_connect()
#' getPlayerTilePos()
#' }
#'
#' @seealso [getPlayerPos]
#'
#' @export

getPlayerTilePos <- function()
{
    z <- mc_sendreceive("player.getTile()")
    as.numeric( strsplit(z, ",")[[1]] )
}


#' Get player position
#'
#' Get entity position. The default is to get the player position, but other
#' positions can be gotten using the \code{id} argument.
#'
#' @param id  Entity id
#' @return vector (x,y,z)
#'
#' @examples
#' \dontrun{
#' mc_connect()
#' getPlayerPos()
#'
#' example_entity <- getPlayerIds()[1]
#' getPlayerPos(id = example_entity)
#' }
#'
#' @seealso [getPlayerPos]
#'
#' @export
getPlayerPos <- function(id = NULL)
{
  if(is.null(id)){
    z <- mc_sendreceive("player.getPos()")
  } else {
    z <- mc_sendreceive(merge_data("entity.getPos", id))
  }
    as.numeric( strsplit(z, ",")[[1]] )
}
