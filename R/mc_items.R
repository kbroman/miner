#' Minecraft item information
#'
#' Minecraft item information
#'
#' @docType data
#'
#' @usage data(mc_items)
#'
#' @format Data frame with columns `name`, `id`, and `style`.
#'
#' @keywords datasets
#'
#' @source \url{http://minecraft-ids.grahamedgecombe.com}
#'
#' @examples
#' data(mc_items)
#' mc_items[grep("Dirt", mc_items$name),]
"mc_items"
