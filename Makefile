# $Id: Makefile 93 2008-08-25 01:26:39Z Jie.Bao $

SVNREV = $(shell svnversion -n)

SRC = diss

all: 
	#(cd result;\
	#pdflatex simulation;\
	#pdflatex psp_all)
	pdflatex $(SRC)
	makeindex $(SRC).nlo -s nomencl.ist -o $(SRC).nls
	-bibtex $(SRC)
	pdflatex $(SRC)
	pdflatex $(SRC)

presentation:
	(cd talk;\
	pdflatex DAPresentation;\
	bibtex DAPresentation;\
	pdflatex DAPresentation;\
	pdflatex DAPresentation)

clean: 
	rm -f *.pdf *.aux *.log *.blg *.out *.bbl *.lof *.lot *.toc *.nlo *.nls *.ilg
	rm -f talk/*.aux talk/*.log talk/*.blg talk/*.out talk/*.bbl \
	talk/*.nav talk/*.toc talk/*.snm

dist:
	svn export . "../diplomarbeit-jie.$(SVNREV)/"
	tar cvfz "diplomarbeit-jie.$(SVNREV).tar.gz" "../diplomarbeit-jie.$(SVNREV)/"
