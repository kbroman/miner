#' Find entity by name
#'
#' Find a Minecraft entity by name.
#'
#' @md
#'
#' @param name Character string with a Minecraft entity name (can be a partial match)
#'
#' @return Data frame with a row or set of rows from the output of
#'     [getEntityTypes()] that match the queried name.
#'
#' @details We first look to see whether there is an exact match to
#'     the `namex` column in the output of [getEntityTypes()]. If there
#'     is, we return that row. If not, we use [grep()] with
#'     `ignore.case=TRUE` and return matching rows.
#'
#' @examples
#' find_entity(name = "witch")
#'
#' @seealso [getEntityTypes()], [find_item()]
#'
#' @export
find_entity <-
    function(name)
{
    entities <- getEntityTypes()

    if(any(entities$name == name)) {
        return(entities[entities$name==name,,drop=FALSE])
    }

    result <- grepl(name, entities$name, ignore.case=TRUE)
    if(sum(result)==0) {
        message("no matching item found")
        return(NULL)
    }
    entities[result,,drop=FALSE]
}
