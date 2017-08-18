LATEX    = latex
BIBTEX   = biber
DVIPS    = dvips
PDFLATEX = pdflatex

BASENAME = main

default: pdflatex

pdflatex:
	${PDFLATEX} ${BASENAME}
	${BIBTEX} ${BASENAME}
	${PDFLATEX} ${BASENAME}
	${PDFLATEX} ${BASENAME}

#
# standard Latex targets
#

%.dvi:	%.tex 
	$(LATEX) $<

%.bbl:	%.tex *.bib
	$(LATEX) $*
	$(BIBTEX) $*

%.ps:	%.dvi
	$(DVIPS) $< -o $@

%.pdf:	%.tex
	$(PDFLATEX) $<

.PHONY: clean

clean:
	rm -f *.aux *.log *.bbl *.blg *.brf *.cb *.ind *.idx *.ilg  \
	      *.xml *.bcf *.inx *.dvi *.toc *.out *~ ~* spellTmp 

