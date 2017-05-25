#' Helper function to split string into data.frame
#' @keywords internal
mcsplit <- function(string) {
    data.frame(
        do.call(rbind,
                sapply(
                    X = strsplit(string, '|', fixed = TRUE)[[1]],
                    FUN = strsplit,
                    split = ',',
                    USE.NAMES = FALSE)))
}

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
#' @return \code{data.frame} of coordinates, block type and player id
getEventsBlockHits <- function() {
    res <- mc_sendreceive('events.block.hits()')
    if (res != '') {
        res <- mcsplit(res)
        names(res) <- c('x', 'y', 'z', 'block', 'player')
    }
    res
}


#' Read most recent chat messages
#' @export
#' @return \code{data.frame} player id and message
#' @seealso getEventsBlockHits
getEventsChatPosts <- function() {
    res <- mc_sendreceive('events.chat.posts()')
    if (res != '') {
        res <- mcsplit(res)
        names(res) <- c('player', 'message')
    }
    res
}
