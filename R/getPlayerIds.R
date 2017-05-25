#' Get player IDs
#'
#' Get the IDs of all player currently in the world. 
#'
<<<<<<< HEAD
#' @return set of integers with one unique id per player.
#' player ids are listed in the order they joined the game world.
=======
#' @return A numeric vector with the IDs of each player currently 
#'    in the Minecraft world. 
>>>>>>> fb168144fc99b2b5cfae2792310333e53b847799
#'
#' @examples
#' \dontrun{
#' mc_connect()
#' getPlayerIds()
#' }
#'
#' @export
#'

getPlayerIds <- function()
{


    result <- mc_sendreceive("world.getPlayerIds()")
    as.numeric(strsplit(result, "\\|")[[1]])

}
