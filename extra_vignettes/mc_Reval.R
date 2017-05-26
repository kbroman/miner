# Look for chat messages that start with "R " and then eval the rest

mc_Reval <- function(player_id=NULL, delay=1)
{
    # toss what's there
    junk <- getChatPosts()

    while(TRUE) {

        posts <- getChatPosts()
        if(nrow(posts)==0) next

        posts <- posts[grepl("^R\\s+", posts$message),,drop=FALSE]
        if(nrow(posts)==0) next

        if(!is.null(player_id)) {
            posts <- posts[posts$player==player_id,,drop=FALSE]
            if(nrow(posts)==0) next
        }

        code <- sub("^R\\s+", "", posts$message)
        for(line in code) {
            output <- eval(parse(text=line), envir=.GlobalEnv)
            if(!is.null(output)) {
                printed_output <- paste(capture.output( output ), collapse="\n")
                print(printed_output)
                if(length(printed_output) > 0) {
                    for(line in printed_output) {
                        chatPost(line)
                        Sys.sleep(delay)
                    }
                }
            }
        }

        Sys.sleep(delay)

    }
}
