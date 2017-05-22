library(rvest)

mc_id_list <- read_html("http://minecraft-ids.grahamedgecombe.com")

ids <- mc_id_list %>%
    html_nodes("td.id") %>% html_text

block_names <- mc_id_list %>%
    html_nodes("td.row-desc span.name") %>% html_text

ids_spl <- strsplit(ids, ":")
block_ids <- vapply(ids_spl, function(a) as.integer(a[[1]]), 1L)
# style = 0 when missing
block_styles <- vapply(ids_spl, function(a) ifelse(length(a) < 2, 0L, as.integer(a[[2]])), 1L)

mc_items <- data.frame(name=block_names,
                       id=block_ids,
                       style=block_styles,
                       stringsAsFactors=FALSE)

save(mc_items, file="../../data/mc_items.RData")
