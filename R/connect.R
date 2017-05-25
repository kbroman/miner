con <- NULL

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
#' @return A socket connection to the minecraft server, hopefully.
#' @export
mc_connect <- function(address = "localhost", port = 4711)
{
    assignInMyNamespace('con',
                        socketConnection(
                            host = address, port, open = "r+b",
                            encoding = "CP437", blocking = TRUE))
}


mc_send <- function(text)
{
    writeLines(text, con=mc_connection(), useBytes=TRUE)
}


mc_receive <- function()
{
    readLines(mc_connection(), n=1L, encoding="CP437")
}

# trick seems to be waiting long enough for the response, but not too long
mc_sendreceive <- function(text, delay=0.02)
{
    mc_send(text)

    if(delay > 0) Sys.sleep(delay)

    mc_receive()
}

merge_data <- function(text, ...)
{
    dots <- list(...)

    paste0(text, "(",
           paste(unlist(dots), collapse=","), ")")
}
