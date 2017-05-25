#' Get player IDs
#'
#' Get player IDs
#'
#' @return set of integers with one unique id per player.
#' player ids are listed in the order they joined the game world.
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
