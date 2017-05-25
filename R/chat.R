#' Post to chat
#' @param text string
#' @export
#' @examples \dontrun{
#' chatPost('foobar')
#'
#' ## Post the first few digits of pi to chat
#' for (p in strsplit(as.character(round(pi, 4)), '')[[1]]) {
#'     chatPost(p)
#' }
#' }
chatPost <- function(text) {
    mc_send(sprintf('chat.post(%s)', shQuote(text)))
}
