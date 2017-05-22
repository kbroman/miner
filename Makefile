all: doc data/mc_items.RData

doc:
	R -e 'devtools::document()'

data/mc_items.RData: inst/scripts/grab_item_info.R
	cd $(<D);R --no-save -e "source('$(<F)')"
