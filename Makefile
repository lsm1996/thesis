main.pdf:	main.tex	cpu-complexity/cpucomplexity.pdf Chapters/*.tex *.bib
	pdflatex main
	pdflatex main
	bibtex main
	pdflatex main
	pdflatex main

cpu-complexity/cpucomplexity.pdf:	Makefile cpu-complexity/makefig.sh
	(cd cpu-complexity; ./makefig.sh )
