#' Find item by name or ID/style
#'
#' Find item by name or ID/style
#'
#' @param name Name of an item
#' @param id ID of an item (provide either `name` or `id`, not both)
#' @param style Style of an item (used only if `id` is provided)
#'
#' @return Data frame with a row or set of rows from \code{\link{mc_items}}.
#'
#' @details If `name` is provided, we first look to see whether there
#'     is an exact match to the `name` column in `mc_items`. If there
#'     is, we return that row. If not, we use \code{\link[base]{grep}}
#'     with `ignore.case=TRUE` and return matching rows.
#'
#'     If instead `id` is provided, we return the row with that id.
#'     The default is to return the row with that ID and `style==0`,
#'     or whatever style was provided. If `style` is NULL, we return
#'     all rows with that ID.
#'
#' @importFrom utils data globalVariables
#' @export
find_item <-
    function(name=NULL, id=NULL, style=0)
{
    # load the data
    utils::data("mc_items", envir=environment())

    if(is.null(name) && is.null(id))
        stop("Provide either name or id")

    if(!is.null(name)) {
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
    if(!is.null(id)) {
        if(!is.null(style)) {
            result <- (mc_items$id==id & mc_items$style==style)
            if(sum(result)==0) {
                message("no matching item found")
                return(NULL)
            }
            return(mc_items[result,])
        }
        else {
            result <- (mc_items$id==id)
            if(sum(result)==0) {
                message("no matching item found")
                return(NULL)
            }
            return(mc_items[result,])
        }
    }
}

utils::globalVariables("mc_items", "miner") # avoid Note in R CMD check
