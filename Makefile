PROJECT=AbramskiLabovicProdanUrosevicPajic
TEXFILE=$(PROJECT).tex
BIBFILE=$(PROJECT).bib
LATEX=latex
BIBTEX=bibtex
TEMPFILES=$(shell cat .gitignore)

all:
	$(LATEX) $(TEXFILE)
	$(BIBTEX) $(PROJECT).aux
	$(LATEX) $(TEXFILE)
	$(LATEX) $(TEXFILE)

watcher:
	while [ 1 ]; do inotifywait $(TEXFILE) $(BIBFILE); sleep 1; make all; done

.PHONY: clean
clean:
	@-rm $(TEMPFILES)
