#' Get player IDs
#'
#' Get player IDs
#'
#' @param con Socket connection to minecraft server
#'
#' @return set of integers
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
