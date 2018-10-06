main.pdf:	main.tex	cpu-complexity/cpucomplexity.pdf Chapters/*.tex *.bib Appendices/*.tex MEGAphoneSchematics.pdf
	pdflatex main
	pdflatex main
	bibtex main
	pdflatex main
	pdflatex main

cpu-complexity/cpucomplexity.pdf:	Makefile cpu-complexity/makefig.sh
	(cd cpu-complexity; ./makefig.sh )

MEGAphoneSchematics.pdf:
	echo "WARNING: MEGAphone.pdf was not found. Substituting with picture of kittens instead."
	( cd place-holders ; pdflatex kitty )
	cp place-holders/kitty.pdf MEGAphoneSchematics.pdf
