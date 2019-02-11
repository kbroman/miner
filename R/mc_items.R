#' Minecraft item information
#'
#' Dataset with the name, ID, and style of possible Minecraft items.
#'
#' @md
#'
#' @docType data
#'
#' @usage data(mc_items)
#'
#' @format Data frame with columns `name`, `id`, and `style`.
#'
#' @keywords datasets
#'
#' @source <http://minecraft-ids.grahamedgecombe.com>
#'
#' @seealso [find_item()], [find_entity()]
#'
#' @examples
#' data(mc_items)
#' mc_items[grep("Dirt", mc_items$name),]
"mc_items"
