# Add a legend showing all of the blocks
# The legend it creates is ~really~ long.

library(miner)
source("minerplot.R") # get font info, char_bitmap, and render_bitmap

cur <- c(-4, 38, -23)
for(i in 1:nrow(mc_items)) {
    # the message to print
    msg <- paste0(mc_items[i,"id"], ":", mc_items[i,"style"], " ", mc_items[i,"name"])

    # message as a bitmap
    msg <- char_bitmap(msg, chars_4x6, char_png_4x6)
    msg <- do.call("cbind", msg)

    # render the message in black wool
    render_bitmap(msg, cur, 35, 15, "east", "up")

    # move position
    cur <- cur + c(ncol(msg)+1, 0, 0)

    # Make a little platform in bedrock covered with a platform of dirt
    setBlocks(cur[1]-1, cur[2]-1, cur[3]-1, cur[1]+4, cur[2]-1, cur[3]+1, 3)
    setBlocks(cur[1]-1, cur[2]-2, cur[3]-1, cur[1]+4, cur[2]-2, cur[3]+1, 7)

    for(j in 0:3) {
        for(k in 0:5) {
            setBlock(cur[1]+j, cur[2]+k, cur[3], mc_items[i,"id"], mc_items[i,"style"])
        }
    }
    cur <- cur + c(6, 0, 0)
    cat(i, "of", nrow(mc_items), "\n")
    Sys.sleep(1)
}
