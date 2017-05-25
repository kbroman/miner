#' Get player tile position
#'
#' Get player tile position
#'
#' @return vector (x,y,z)
#'
#' @examples
#' \dontrun{
#' mc <- mc_connect()
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
#' Get player position
#'
#' @return vector (x,y,z)
#'
#' @examples
#' \dontrun{
#' mc <- mc_connect()
#' getPlayerPos()
#' }
#'
#' @seealso [getPlayerPos]
#'
#' @export

getPlayerPos <- function()
{
    z <- mc_sendreceive("player.getPos()")
    as.numeric( strsplit(z, ",")[[1]] )
}
