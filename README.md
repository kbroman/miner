## miner

[![Travis-CI Build Status](https://travis-ci.org/ropenscilabs/miner.svg?branch=master)](https://travis-ci.org/ropenscilabs/miner)

Following the python module
[py3minepi](https://github.com/py3minepi/py3minepi), this is an R package that allows
connection to the
[Minecraft API](http://www.stuffaboutcode.com/p/minecraft-api-reference.html)
using [RaspberryJuice](https://dev.bukkit.org/projects/raspberryjuice)
and either [Spigot](https://www.spigotmc.org/) or
[Minecraft:Pi](https://minecraft.net/en-us/edition/pi/).

The miner package provides a few simple functions to manipulate the
Minecraft world from R. The intent of this package is to encourage new
R users to learn R by writing scripts to do fun things in Minecraft.

See the online book, [R Programming with
Minecraft](https://ROpenSciLabs.github.io/miner_book/), for details on
setting up a Minecraft server and using this package, and for a
variety of detailed examples. The package also contains a short
[vignette](vignettes/miner.Rmd) on its basic use.

Here are a few of the things you can do with
[miner](https://github.com/ropenscilabs/miner):

### Write words on a hillside:

![](figure/rOpenSci_sign.png)

### Render a photograph as a wall of blocks:

![](figure/karthik_minecraft.png)

Or the [R](https://www.r-project.org) logo:

![](figure/Rlogo_minecraft.png)

### Generate a random maze in R, and create it in the world for players to explore:

![](figure/maze.gif)

![](figure/maze-minecraft.png)

This player is operated by a bot trying to find its way out of the maze via a rule-based algorithm:

![](figure/maze_bot.gif)

### Give the player the powers of Elsa:

[Freeze water as you run over it](https://youtu.be/6gcRyuj0smg)

[![](figure/elsa-animated.gif)](https://www.youtube.com/watch?v=6gcRyuj0smg)

or create towers of ice with a gesture:

![](figure/ice_towers.png)

### Write a bot to play a game with players over chat:

![](figure/guessnum.png).


### And, of course, make `ggplot` plots in Minecraft:

[![](figure/ggplot.gif)](https://www.youtube.com/watch?v=zggCAYAfjXE)

### Extending

The [craft](https://github.com/ropenscilabs/craft) package includes additional functions that illustrate and extend the use of [miner](https://github.com/ropenscilabs/miner). Contributors who want to extend the functionality of [miner](https://github.com/ropenscilabs/miner) should submit a pull request to the [craft](https://github.com/ropenscilabs/craft) package.

### Documentation

[R Programming with Minecraft](https://ROpenSciLabs.github.io/miner_book/) is a bookdown book about R and Minecraft, and particularly about using Minecraft with the [miner](https://github.com/ropenscilabs/miner) package. Contributors who want to add documentation should submit a pull request to the [miner_book](https://github.com/ropenscilabs/miner_book) repository on Github.


### About this package

This package was created as part of the [ROpenSci unconference](http://unconf17.ropensci.org/)
in May, 2017 by:

* [Brooke Anderson](https://github.com/geanders)
* [Karl Broman](https://github.com/kbroman)
* [Gergely Daróczi](https://github.com/daroczig)
* [Mario Inchiosa](https://github.com/inchiosa)
* [David Smith](https://github.com/revodavid)
* [Ali Zaidi](https://github.com/akzaidi)

### License

Licensed under the [MIT license](https://cran.r-project.org/web/licenses/MIT). ([More information here](https://en.wikipedia.org/wiki/MIT_License).)
