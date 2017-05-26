Number-guess chat bot in Minecraft
================
Gergely Daroczi

This example illustrates how to build a chat bot, interacting with players in the chat window.

### Background

This is a simple number guessing game:

-   the server picks a random number between 1 and 100
-   the player tries to guess that number
-   the server provides feedback after every single guess:

    -   the game ends if the player's guess matches the number
    -   let the player know if the number is greater or smaller

Init
----

First, let's pick a random number between 1 and 100:

``` r
num <- ceiling(runif(1) * 100)
```

Then we connect to the Minecraft server and write a message in the chat window so that players get notified:

``` r
chatPost('Hi, I thought a number between 1 and 100. Can you guess it? Type numbers in the chat window!')
```

Loop
----

Then we can run an infinite loop to provide feedback to the user:

``` r
while (TRUE) {

    ## poll for most recent chat messages
    msg <- getChatPosts()

    ## do nothing if there are no messages since last poll
    if (nrow(msg) > 0) {

        ## iterate through all messages
        for (msgi in seq_len(nrow(msg))) {

            ## check if the message is a number
            numi <- suppressWarnings(as.numeric(as.character(msg[msgi, 'message'])))
            if (!is.na(numi)) {

                ## compare numbers
                if (num == numi) {
                    chatPost('Wow, you won!!!')
                } else {
                    chatPost(sprintf("Nope, it's %s than %s",
                                     ifelse(numi > num, 'smaller', 'greater'),
                                     numi))
                }
                
            }
        }
    }
}
```

Let's Play!
-----------

The result looks like this:

![](figure/guessnum.png)
