# Ime projekta, svi TeX dokumenti moraju imati isto ime.
# Primer $PROJECT.tex, $PROJECT.bib, itd...
PROJECT=AbramskiLabovicProdanUrosevicPajic
# Programi za LaTeX-ovanje.
LATEX=latex
BIBTEX=bibtex
# .tex i .bib fajlovi moraju imati isto ime, otuda se ovde koristi ime projekta.
TEXFILE=$(PROJECT).tex
BIBFILE=$(PROJECT).bib
# Sve pomoćne datoteke koje se naprave nakon LaTeX-ovanja se nalaze u .gitignore
# datoteci. Kako ne bismo ponavljali tu listu, koristićemo tu datoteku ovde.
# TEMPFILES čuva putanju svih prolaznih datoteka.
TEMPFILES=$(shell cat .gitignore)

# Uobičajeno LaTeX-ovanje. Nakon poziva programa `make` bez parametera, ovo će
# se izvršiti.
all:
	$(LATEX) $(TEXFILE)
	$(BIBTEX) $(PROJECT).aux
	$(LATEX) $(TEXFILE)
	$(LATEX) $(TEXFILE)

# Nadgledanje .tex i .bib datoteka, ukoliko dođe do njihovih promena, program
# inotifywait pušta prolaz na dalje pozive, prvo `sleep 1`, nakon `make all`.
# Ovo se radi neograniceno puta. Izlaz iz ove petlje je moguće slanjem signala
# za izlaz, C-c (CTRL-c).
watcher:
	while [ 1 ]; do inotifywait $(TEXFILE) $(BIBFILE); sleep 1; make all; done

# Clean samo čisti prolazne datoteke, one koje su nastale tokom LaTeX-ovanja.
.PHONY: clean
clean:
	@-rm $(TEMPFILES)
