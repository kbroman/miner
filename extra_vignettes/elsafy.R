# elsa-fy for minecraft
# using the miner R package, https://github.com/ROpenSciLabs/iner
#
# when she walks on water, it turns to ice
elsafy <- function(player_id=NULL, water=c(8, 9), ice=174, delay=0.02)
{
    on.exit( { # clean up a bit
        for(i in 1:20) miner:::mc_receive()
        } )

    while(TRUE) {
        pos <- miner::getPlayerPos(player_id)
        block <- miner::getBlocks(pos[1]-1, pos[2]-1, pos[3]-1,
                                  pos[1]+1, pos[2]-1, pos[3]+1)
        for(i in -1:1) {
            for(j in -1:1) {
                if(block[i+2,1,j+2] %in% water)
                    miner::setBlock(pos[1]+i, pos[2]-1, pos[3]+j, ice)
            }
        }

        Sys.sleep(delay)
    }
}

# I needed a de-elsa-fy to clean up afterwards (turning the ice back to water)
de_elsafy <- function(player_id=NULL, water=8, ice=174, delay=0.05)
{
    d <- list(-1:1, -5:0, -1:1)

    on.exit( { # clean up a bit
        for(i in 1:20) miner:::mc_receive()
        } )

    while(TRUE) {
        pos <- miner::getPlayerPos(player_id)
        block <- miner::getBlocks(pos[1]+min(d[[1]]), min(pos[2]+d[[2]]), min(pos[3]+d[[3]]),
                                  pos[1]+max(d[[1]]), max(pos[2]+d[[2]]), max(pos[3]+d[[3]]))
        for(i in seq_along(d[[1]])) {
            for(j in seq_along(d[[2]])) {
                for(k in seq_along(d[[3]])) {
                    if(block[i,j,k] == ice)
                        miner::setBlock(pos[1]+d[[1]][i],
                                        pos[2]+d[[2]][j],
                                        pos[3]+d[[3]][k],
                                        water)
                }
            }
        }
    }
}
