all:
		emacs -batch -q --load elisp/org-latex.el src/vgpu.org --eval="(org-latex-export-to-pdf)"
		mv src/*.pdf build/
		rm src/*.{tex,bbl,blg}
