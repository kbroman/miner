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
#' mc <- mc_connect()
#' p <- getPlayerPost(mc)
#' setPlayerPos(mc, 0, p + 5, 0)
#' }
#'
#' @export
#'
getPlayerIds <- function(con)
{


    result <- mc_sendreceive("world.getPlayerIds()", con)
    as.numeric(strsplit(result, "\\|")[[1]])

}
