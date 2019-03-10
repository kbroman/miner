#' Get player name
#'
#' Get the name of a player with a given ID
#'
#' @param player_id Integer giving the ID of a player. You can find IDs of all
#'   current players using [getPlayerIds()].
#'
#' @return A character string with the name of the identified player.
#'
#' @examples
#' \dontrun{
#' mc_connect()
#' getPlayerIds()
#' getPlayerName(322)
#' }
#'
#' @seealso [getPlayerIds()], [getPlayerId()]
#'
#' @export
#'

getPlayerName <- function(player_id)
{

    mc_sendreceive(merge_data("entity.getName", player_id))

}
