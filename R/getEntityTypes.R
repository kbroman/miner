#' Get entity types
#'
#' Get a table of available entity types and their IDs.
#'
#' @md
#'
#' @return a data frame with two rows, id and type.
#'
#' @examples
#' \dontrun{
#' mc_connect()
#' getEntityTypes()
#' }
#'
#' @seealso [mc_items()], [spawnEntity()], [find_entity()]
#'
#' @export
#'

getEntityTypes <- function()
{

    result <- mc_sendreceive("world.getEntityTypes()")
    lines <- strsplit(result, "\\|")[[1]]
    lines_split <- strsplit(lines, ",")
    data.frame(id=as.numeric(vapply(lines_split, "[", "1", 1)),
               name=vapply(lines_split, "[", "witch", 2))
}
