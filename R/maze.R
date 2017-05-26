#' Generates a maze in front of a player
#' @param n size of the maze
#' @param player_id optional player id
#' @export
mc_maze <- function(n = 5, player_id = NULL) {

    ## get player position
    pos <- getPlayerPos(player_id, tile = TRUE)
    x <- pos[1]
    y <- pos[2]
    z <- pos[3]

    ## generate a random maze
    requireNamespace(Rmaze)
    maze <- makeGraph(n, n)
    set.seed(42)
    maze <- makeMaze_dfs(maze)
    ## plotMaze(maze, n, n)
    plotMaze(maze, n, n)

    df <- matrix(NA, nrow = n*4, ncol = n*4)

    ## bottom left is the entrance, top right is exit
    df[c(1, nrow(df)), ] <- 1
    df[, c(1, nrow(df))] <- 1
    df[1, ncol(df) - 1:2] <- NA
    df[nrow(df), 2:3] <- NA

    nr <- nrow(df)
    nc <- ncol(df)

    ## draw edges
    requireNamespace(igraph)
    requireNamespace(data.table)
    mazedf <- data.table(as_data_frame(maze))
    for (v in c('from', 'to')) {
        mazedf[, (paste0(v, 'x')) := as.numeric(sub('A_([0-9]*)_[0-9]*', '\\1', get(v)))]
        mazedf[, (paste0(v, 'y')) := as.numeric(sub('A_[0-9]*_([0-9]*)', '\\1', get(v)))]
    }
    mazedf[fromx < tox, direction := 'top']
    mazedf[fromy < toy, direction := 'right']

    ## fill in walls
    mazedf[, x := nrow(df) - fromx * 4 + 3 - as.numeric(direction == 'top') * 2]
    mazedf[, y := fromy * 4 - 1 + as.numeric(direction == 'right') * 2]
    for (i in seq_len(nrow(mazedf))) {
        cell <- mazedf[i]
        if (cell$wall == 'ON') {
            df[cell$x + -1:0, cell$y + -1:0] <- 1
        }
        if (cell$direction == 'top' & cell$wall == 'ON') {
            df[cell$x - 0:1, cell$y - 2:3] <- 2
        }
        if (cell$direction == 'right' & cell$wall == 'ON') {
            df[cell$x - 2:3, cell$y - 0:1] <- 3
        }
    }

    ## clean up some space (replace with air)
    setBlocks(x, y, z, x + nr, y + 4, z + nc, 0)
    ## add diamond floor
    setBlocks(x, y, z, x + nr, y, z + nc, 57)
    ## add torch
    setBlocks(x + nr - 4, y + 1, z + 2, x + nr, y + 2, z + 4, 50)
    ## add glass ceiling
    setBlocks(x, y + 4, z, x + nr, y + 4, z + nc, 95)
    ## add gold walls
    for (i in 1:nrow(df)) {
        for (j in 1:ncol(df)) {
            if (!is.na(df[i, j])) {
                setBlocks(x + i, y + 1, z + j, x + i, y + 3, z + j, 41)
            }
        }
    }

}
