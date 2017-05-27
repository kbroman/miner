## miner

[![Travis-CI Build Status](https://travis-ci.org/kbroman/miner.svg?branch=master)](https://travis-ci.org/kbroman/miner>)

Following the python module
[py3minepi](https://github.com/py3minepi/py3minepi), this is an R package that allows
connection to the
[Minecraft API](http://www.stuffaboutcode.com/p/minecraft-api-reference.html)
using [RaspberryJuice](https://dev.bukkit.org/projects/raspberryjuice)
and either [Spigot](https://www.spigotmc.org/) or
[Minecraft:Pi](https://minecraft.net/en-us/edition/pi/).

The mineR package provides a few simple functions to manipulate the Minecraft world from R. See
the [vignette](vignettes/mineR.Rmd) for details on setting up a Minecraft server and using
this package.

The
intent of this package is to encourage new R users to learn R by writing scripts to do fun things
in Minecraft. (See the [extra_vignettes](extra_vignettes) folder for details.)
For example, with these functions you could:

### Write words on a hillside:

![](extra_vignettes/figure/rOpenSci_sign.png)

### Render a photograph as a wall of blocks:

![](extra_vignettes/figure/karthik_minecraft.png)

Or the [R](https://www.r-project.org) logo:

![](extra_vignettes/figure/Rlogo_minecraft.png)

### Generate a random maze in R, and create it in the world for players to explore:

![](extra_vignettes/figure/maze.gif) 

![](extra_vignettes/figure/maze-minecraft.png)

### Give the player the powers of Elsa: 

[Freeze water as you run over it](https://youtu.be/6gcRyuj0smg)

[![](extra_vignettes/figure/elsa-animated.gif)](https://www.youtube.com/watch?v=6gcRyuj0smg)

or create towers of ice with a gesture:

![](extra_vignettes/figure/ice_towers.png)

### Write a bot to play a game with players over chat:

![](extra_vignettes/figure/guessnum.png).


### And, of course, make `ggplot` plots in Minecraft: 

[![](extra_vignettes/figure/ggplot.gif)](https://www.youtube.com/watch?v=zggCAYAfjXE)

### About this package

This package was created as part of the [ROpenSci unconference](http://unconf17.ropensci.org/)
in May, 2017 by:

* Brooke Anderson
* Karl Broman
* Gergely Daróczi
* Mario Inchiosa
* David Smith
* Ali Zaidi
