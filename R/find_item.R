#' Find item by name or ID/style
#'
#' Find a Minecraft item by name or ID. If querying an item by ID, the search
#' can also specify item style.
#'
#' @md
#'
#' @param name Character string with the name of a Minecraft item (specify
#'    either `name` or `id`, not both)
#' @param id A numeric or character string with the ID of a Minecraft item
#'    (specify either `name` or `id`, not both)
#' @param style A numeric or character string with the style of a Minecraft
#'    item (use this argument only if querying by `id` is provided)
#'
#' @return Data frame with a row or set of rows from [`mc_items`] that
#'    match the queried name, ID, and / or style.
#'
#' @details If `name` is provided, we first look to see whether there
#'     is an exact match to the `name` column in [`mc_items`]. If there
#'     is, we return that row. If not, we use [grep()]
#'     with `ignore.case=TRUE` and return matching rows.
#'
#'     If instead `id` is provided, we return the row with that id.
#'     The default is to return the row with that ID and `style==0`,
#'     or whatever style was provided. If `style` is NULL, we return
#'     all rows with that ID.
#'
#' @examples
#' find_item(name = "Oak")
#' find_item(id = 5)
#' find_item(id = 5, style = 5)
#'
#' @importFrom utils data globalVariables
#' @export
find_item <-
    function(name=NULL, id=NULL, style=0)
{
    # load the data
    library(miner) # force loading package
#    utils::data("mc_items", envir=environment())

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
