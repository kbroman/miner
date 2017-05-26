#' Post to chat
#'
#' Post a message to Minecraft chat.
#'
#' @param text A character string with the message you would like
#'    to post.
#'

#' @examples \dontrun{
#' chatPost('foobar')
#'
#' ## Post the first few digits of pi to chat
#' for (p in strsplit(as.character(round(pi, 4)), '')[[1]]) {
#'     chatPost(p)
#'   }
#' }
#'
#' @export
chatPost <- function(text) {
    if(is.null(text)) text <- ""
    mc_send(sprintf('chat.post(%s)', text))
}

#' Helper function to split string into data.frame, for the chat
#' @keywords internal
mcsplit_message <- function(string, colnames) {

    if (string == '') {
        return(as.data.frame(sapply(colnames, function(x) character(0)), stringsAsFactor = FALSE))
    }


    setNames(data.frame(
        do.call(rbind,
                sapply(
                    X = sub(",", "|", strsplit(string, '|', fixed = TRUE)[[1]], fixed=TRUE),
                    FUN = strsplit,
                    split = '|', fixed=TRUE,
                    USE.NAMES = FALSE)),
        stringsAsFactors=FALSE),
        colnames)

}





#' Pull the most recent chat message
#'
#' Returns the chat posts that have been posted recently and since the
#' last time the function was run. It is possible that this does not
#' return chat posts that were posted using \code{\link{chatPost}}.
#'
#' @return A dataframe of recent chat posts with columns for the player
#'    id of the poster and the message posted
#'
#' @seealso \code{\link{getBlockHits}}
#'
#' @examples \dontrun{
#' mc_connect()
#' getChatPosts()
#' }
#'
#' @export
getChatPosts <- function() {
  mcsplit_message(mc_sendreceive('events.chat.posts()'),
          c('player', 'message'))
}
