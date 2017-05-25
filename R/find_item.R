#' Find item IDs by name
#'
#' Find item ID by name
#'
#' @param name Name of an item
#'
#' @return Data frame defined by a row or set of rows from \code{\link{mc_items}}.
#'
#' @details If an exact match, just return that row. If no exact match, use grep and return all matching rows.
#'
#' @export
find_item <-
    function(name)
{
    if(name %in% mc_items$name) {
        return(mc_items[mc_items$name==name,,drop=FALSE])
    } else {
        result <- grep(name, mc_items$name, ignore.case=TRUE)
        if(length(result)==0) {
            message("no matching item found")
            return(NULL)
        }
        return(mc_items[result,,drop=FALSE])
    }
}
