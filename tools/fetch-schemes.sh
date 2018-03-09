#!/bin/bash
# ver: 0.1

# An utility to fetch and convert some color schemes

BASEDIR=$(dirname "$(realpath "$0")")

BASEURL="https://raw.githubusercontent.com/stayradiated/terminal.sexy/master/dist/schemes/base16"
SCHEMES=("3024.dark" "3024.light" "ashes.dark" "ashes.light" "atelierdune.dark" "atelierdune.light" "atelierforest.dark" "atelierforest.light" "atelierheath.dark" "atelierheath.light" "atelierlakeside.dark" "atelierlakeside.light" "atelierseaside.dark" "atelierseaside.light" "bespin.dark" "bespin.light" "brewer.dark" "brewer.light" "chalk.dark" "chalk.light" "codeschool.dark" "codeschool.light" "default.dark" "default.light" "eighties.dark" "eighties.light" "embers.dark" "embers.light" "google.dark" "google.light" "grayscale.dark" "grayscale.light" "greenscreen.dark" "greenscreen.light" "isotope.dark" "isotope.light" "londontube.dark" "londontube.light" "marrakesh.dark" "marrakesh.light" "mocha.dark" "mocha.light" "monokai.dark" "monokai.light" "ocean.dark" "ocean.light" "paraiso.dark" "paraiso.light" "railscasts.dark" "railscasts.light" "shapeshifter.dark" "shapeshifter.light" "solarized.dark" "solarized.light" "tomorrow.dark" "tomorrow.light" "twilight.dark" "twilight.light")


for scheme in "${SCHEMES[@]}";
do
	{
		cat <<-EOCredits
			// Original source: https://github.com/stayradiated/terminal.sexy
			// Licensed under MIT: https://github.com/stayradiated/terminal.sexy/blob/master/LICENSE

		EOCredits

		# Fetch color scheme and blindly translate JSON to SCSS map variable
		curl -s "$BASEURL/${scheme}.json" | sed -rf "$BASEDIR/json2scss.sed"

	} > "_${scheme//./-}.scss" &&\

	echo "Saved scheme: ${scheme}"
done
