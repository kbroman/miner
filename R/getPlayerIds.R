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
#' getPlayerIds(mc)
#' }
#'
#' @export
#'
getPlayerIds <- function(con)
{


    result <- mc_sendreceive("world.getPlayerIds()", con)
    as.numeric(strsplit(result, "\\|")[[1]])

}
