#' Get player IDs
#'
#' Get the IDs of all player currently in the world.
#'
#' @return A numeric vector with the IDs of each player currently
#'   in the MineCraft world. Player ids are listed in the order they joined the game world.
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
