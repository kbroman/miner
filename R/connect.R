con <- NULL

#' Return cached connection
#' @return connection
#' @keywords internal
mc_connection <- function() {

    if (is.null(con)) {
        stop('First init a connection to the Minecraft Server via the mc_connect function')
    }

    return(con)

}


#' Create connection to minecraft server
#'
#' @param address The url for the minecraft server
#' @param port The port to use for the connection
#' @return Nothing returned, the connection is cached within the package namespace.
#' @importFrom utils assignInMyNamespace
#' @export
mc_connect <- function(address = "localhost", port = 4711)
{
    utils::assignInMyNamespace('con',
                        socketConnection(
                            host = address, port, open = "r+b",
                            encoding = "CP437", blocking = TRUE, timeout = 1))
}


#' Close cached connection to Minecraft Server
#' @export
mc_close <- function() {
    close(con)
}


mc_send <- function(text)
{
    writeLines(text, con=mc_connection(), useBytes=TRUE)
}


mc_receive <- function()
{
    res <- readLines(mc_connection(), n = 1L, encoding = "CP437")
    if (length(res) == 1 && res == 'Fail') {
        stop('The server returned an unknown error')
    }
    res
}


# trick seems to be waiting long enough for the response, but not too long
mc_sendreceive <- function(text)
{
    mc_send(text)
    mc_receive()
}

merge_data <- function(text, ...)
{
    dots <- list(...)

    paste0(text, "(",
           paste(unlist(dots), collapse=","), ")")
}
