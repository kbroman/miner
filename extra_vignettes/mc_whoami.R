# listen for the message "who am I"
# response with player id

mc_whoami <- function(delay=1)
{
    while(TRUE) {

        posts <- getChatPosts()
        if(nrow(posts)==0) next

        whoami <- grepl("who am i", posts$message, ignore.case=TRUE)
        if(any(whoami)) {
            players <- posts$player[whoami]
            for(player in players) {
                chatPost(paste0("You are ", player, "."))
                cat("You are ", player, ".\n", sep="")
                Sys.sleep(delay)
            }
        }

        Sys.sleep(delay)
    }

}
