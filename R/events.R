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
#' @return \code{data.frame} of coordinates, block type and user id
getEventsBlockHits <- function() {
    res <- mc_sendreceive('events.block.hits()')
    if (res != '') {
        res <- strsplit(res, '|', fixed = TRUE)[[1]]
        res <- do.call(rbind, sapply(res, strsplit, split = ',', USE.NAMES = FALSE))
        res <- data.frame(res)
        names(res) <- c('x', 'y', 'z', 'block', 'player')
    }
    res
}


#' Read most recent chat messages
#' @export
#' @seealso getEventsBlockHits
getEventsChatPosts <- function() {
    mc_sendreceive('events.chat.posts()')
}
