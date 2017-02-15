all:
		emacs -batch -q src/pres.org --eval="(org-beamer-export-to-pdf)"
		mv src/*.pdf build/
		rm -f src/*.{tex,bbl,blg}
