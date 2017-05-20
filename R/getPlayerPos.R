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
#' Get player position
#'
#' @param con Socket connection to minecraft server
#'
#' @return vector (x,y,z)
#'
#' @examples
#' \dontrun{
#' mc <- mc_connect()
#' getPlayerPos(mc)
#' }
#'
#' @seealso [getPlayerPos]
#'
#' @export

getPlayerPos <- function(con)
{
    z <- mc_sendreceive("player.getPos()", con)
    as.numeric( strsplit(z, ",")[[1]] )
}
