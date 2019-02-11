#' Spawn an entity
#'
#' Spawn an entity of a given type at a given position.
#'
#' @md
#'
#' @param x east/west position (east is positive)
#' @param y up/down position (up is positive)
#' @param z north/south position (south is positive)
#' @param typeid Integer giving the type of entity. See the
#'     output of `[etEntityTypes()] or use `find_entity()` to search.
#'
#' @return A number giving the spawned entity's ID.
#'
#' @examples
#' \dontrun{
#' mc_connect()
#' witch_typeid <- find_entity("witch")$id
#' witch_id <- spawnEntity(0, 20, 0, witch_typeid)
#' getPlayerName(witch_id)
#' }
#'
#' @seealso [getEntityTypes()], [find_entity()]
#'
#' @export
#'

spawnEntity <- function(x, y, z, typeid)
{

    result <- mc_sendreceive(merge_data("world.spawnEntity", x, y, z, typeid))
    as.numeric(result)

}
