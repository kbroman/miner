all: doc data/mc_items.RData docs/miner.html

doc:
	R -e 'devtools::document()'

test:
	R -e 'devtools::test()'

data/mc_items.RData: inst/scripts/grab_item_info.R
	cd $(<D);R --no-save -e "source('$(<F)')"

docs/miner.html: vignettes/miner.Rmd docs/miner_logo.png docs/badges.html docs/paste_badges.R
	cd $(<D);R -e "rmarkdown::render('$(<F)')"
	mv $(<D)/$(@F) $@
	cd $(@D);paste_badges.R $(@F)

docs/miner_logo.png: figure/miner_logo.png
	cp $< $@
