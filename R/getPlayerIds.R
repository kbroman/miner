#' Get player IDs
#'
#' Get the IDs of all player currently in the world. 
#'
#' @return A numeric vector with the IDs of each player currently 
#'    in the Minecraft world. 
#'
#' @examples
#' \dontrun{
#' mc_connect()
#' getPlayerIds()
#' }
#'
#' @export
#'

getPlayerIds <- function()
{


    result <- mc_sendreceive("world.getPlayerIds()")
    as.numeric(strsplit(result, "\\|")[[1]])

}
