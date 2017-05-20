#' Create connection to minecraft server
#'
#' Create connection to minecraft server
#'
#' @param address The url for the minecraft server
#' @param port The port to use for the connection
#'
#' @return A socket connection to the minecraft server, hopefully.
#'
#' @export

mc_connect <- function(address="localhost", port=4711)
{
    socketConnection(host=address, port, open="r+b", encoding="CP437", blocking=TRUE)
}


mc_send <- function(text, con)
{
    writeLines(text, con=con, useBytes=TRUE)
}


mc_receive <- function(con)
{
    readLines(con, n=1L, encoding="CP437")
}

# trick seems to be waiting long enough for the response, but not too long
mc_sendreceive <- function(text, con, delay=0.02)
{
    mc_send(text, con)

    if(delay > 0) Sys.sleep(delay)

    mc_receive(con)
}

merge_data <- function(text, ...)
{
    paste0(text, "(",
           paste(unlist(...), collapse=","), ")")
}
