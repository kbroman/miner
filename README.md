## miner

[![Travis-CI Build Status](https://travis-ci.org/kbroman/miner.svg?branch=master)](https://travis-ci.org/kbroman/miner>)

Following [py3minepi](https://github.com/py3minepi/py3minepi), an R package that allows
connection to the
[Minecraft API](http://www.stuffaboutcode.com/p/minecraft-api-reference.html)
using [RaspberryJuice](https://dev.bukkit.org/projects/raspberryjuice)
and either [Spigot](https://www.spigotmc.org/) or
[Minecraft:Pi](https://minecraft.net/en-us/edition/pi/).

The mineR package provides a a few simple functions to minipulat the Minecraft world from R. See
the vignette for details on setting up a Minecraft server and using this package.

The 
intent of this package is to encourage new R users to learn R by writing scripts to do fun things
in Minecraft. For example, with these functions you could:

Take an image of a photograph and render it as a wall of blocks.

![](extra_vignettes/figure/karthik_minecraft.png)


* Take an image (like a [photo](https://github.com/ropenscilabs/miner/blob/master/extra_vignettes/mc_image.md) or
  [logo](https://github.com/ropenscilabs/miner/blob/master/extra_vignettes/R_logo.md)), 
  and create a wall in Minecraft that looks like the image.
* Build a random maze ([like this](maze.png)) to explore in Minecraft.
* Create a [staircase](../extra-vignettes/stairway-to-heaven.Rmd) or 
  [tower](../extra-vignettes/stnad_on_tower.Rmd) programatically.
* Make it possible to run over water, by having ice appear wherever water touches
  the player's feet (like in [this video](https://youtu.be/6gcRyuj0smg).)
* Track the player's actions to have them [plant flowers or build an ice tower](../extra-vignettes/).  
* Write a bot to [play a game with players over chat](../extra-vignettes/numguess.Rmd), [like this](../extra-vignettes/figure/guessnum.png). 

Use R functions
to connect with a Minecraft server and control the world within.

<iframe width="640" height="360" src="https://www.youtube.com/embed/6gcRyuj0smg" frameborder="0" allowfullscreen></iframe>
