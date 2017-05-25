#' Read most recent block hits
#'
#' Note, that only right clicks with an Iron sword are logged.
#' @export
#' @examples \dontrun{
#' library(futile.logger)
#' while (TRUE) {
#'     flog.info(getEventsBlockHits())
#'     Sys.sleep(1)
#' }
#' }
#' @seealso getEventsChatPosts
getEventsBlockHits <- function() {
    mc_sendreceive('events.block.hits()')
}


#' Read most recent chat messages
#' @export
#' @seealso getEventsBlockHits
getEventsChatPosts <- function() {
    mc_sendreceive('events.chat.posts()')
}
