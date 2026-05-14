all: doc data/mc_items.RData docs/miner.html

doc:
	R -e 'devtools::document()'

data/mc_items.RData: inst/scripts/grab_item_info.R
	cd $(<D);R --no-save -e "source('$(<F)')"

docs/miner.html: vignettes/miner.Rmd docs/miner_logo.png
	cd $(<D);R -e "rmarkdown::render('$(<F)')"
	mv $(<D)/$(@F) $@

docs/miner_logo.png: figure/miner_logo.png
	cp $< $@
