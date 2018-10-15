main.pdf:	main.tex	cpu-complexity/cpucomplexity.pdf Chapters/*.tex *.bib Appendices/*.tex 4004.jpg
	pdflatex main
	pdflatex main
	bibtex main
	pdflatex main
	pdflatex main

cpu-complexity/cpucomplexity.pdf:	Makefile cpu-complexity/makefig.sh
	(cd cpu-complexity; ./makefig.sh )

4004.jpg:
	echo "WARNING: 4004.jpg missing. Substituting poor hand-drawn facsimilie instead."
	sleep 5
	cp place-holders/4004.png 4004.jpg

clean:
	rm `cat .gitignore`
