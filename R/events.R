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

#' Get most recent block hits
#'
#' Return the most recent block hits made in the Minecraft
#' world by an iron sword.
#'
#' @note Only right clicks with an iron sword are logged.
#'
#' @return A dataframe with columns for the coordinates, block type,
#'     and player id of recent block hits.
#'
#' @examples \dontrun{
#' getBlockHits()
#'
#' library(futile.logger)
#' while (TRUE) {
#'     flog.info(getEventsBlockHits())
#'     Sys.sleep(1)
#' }
#' }
#'
#' @seealso \code{\link{getChatPosts}}
#'
#' @export
getBlockHits <- function() {
    mcsplit(mc_sendreceive('events.block.hits()'),
            c('x', 'y', 'z', 'block', 'player'))
}
