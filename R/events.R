#' Helper function to split string into data.frame
#' @keywords internal
mcsplit <- function(string, colnames) {

    if (string == '') {
        return(as.data.frame(sapply(colnames, function(x) character(0)), stringsAsFactor = FALSE))
    }

    setNames(data.frame(
        do.call(rbind,
                sapply(
                    X = strsplit(string, '|', fixed = TRUE)[[1]],
                    FUN = strsplit,
                    split = ',',
                    USE.NAMES = FALSE))),
        colnames)

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
    mcsplit(mc_sendreceive('events.block.hits()'),
            c('x', 'y', 'z', 'block', 'player'))
}


#' Read most recent chat messages
#' @export
#' @return \code{data.frame} player id and message
#' @seealso getEventsBlockHits
getEventsChatPosts <- function() {
    mcsplit(mc_sendreceive('events.chat.posts()'),
            c('player', 'message'))
}
