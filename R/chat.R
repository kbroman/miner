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
    mc_send(sprintf('chat.post(%s)', text))
}
