#' Get player ID
#'
#' Get the ID for a player with a given name.
#'
#' @param player_name Character string with name of a player.
#'
#' @return A number representing the ID of the player.
#'
#' @examples
#' \dontrun{
#' mc_connect()
#' getPlayerIds()
#' getPlayerId("wyldstyle")
#' }
#'
#' @seealso [getPlayerIds()], [getPlayerName()]
#'
#' @export
#'

getPlayerId <- function(player_name)
{

    result <- mc_sendreceive(merge_data("world.getPlayerId", player_name))
    as.numeric(result)

}
