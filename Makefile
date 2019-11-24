# Ime projekta, svi TeX dokumenti moraju imati isto ime.
# Primer $PROJECT.tex, $PROJECT.bib, itd...
PROJECT=AbramskiLabovicProdanUrosevicPajic
# Direktorijumi za clanak i prezentaciju
DIR_CLANAK=./clanak
DIR_PREZENTACIJA=./prezentacija
# Programi za LaTeX-ovanje.
LATEX=latex -halt-on-error
PDFLATEX=pdflatex -halt-on-error
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
# Poziva metu `clanak` i `prezentacija`, efektivno pravi članak i prezentaciju.
.PHONY: all
all: clanak prezentacija

.PHONY: pdf
pdf: clanak_pdf prezentacija_pdf

# Pravljenje članka
.PHONY: clanak
clanak:
	@cd $(DIR_CLANAK) && \
	$(LATEX) $(TEXFILE) && \
	$(BIBTEX) $(PROJECT).aux && \
	$(LATEX) $(TEXFILE) && \
	$(LATEX) $(TEXFILE);

.PHONY: clanak_pdf
clanak_pdf:
	@cd $(DIR_CLANAK) && \
	$(PDFLATEX) $(TEXFILE) && \
	$(BIBTEX) $(PROJECT).aux && \
	$(PDFLATEX) $(TEXFILE) && \
	$(PDFLATEX) $(TEXFILE);

# Pravljenje prezentacije
.PHONY: prezentacija
prezentacija:
	@cd $(DIR_PREZENTACIJA) && \
	$(LATEX) $(TEXFILE) && \
	$(LATEX) $(TEXFILE);

.PHONY: prezentacija_pdf
prezentacija_pdf:
	@cd $(DIR_PREZENTACIJA) && \
	$(PDFLATEX) $(TEXFILE) && \
	$(PDFLATEX) $(TEXFILE);


# Nadgledanje .tex i .bib datoteka, ukoliko dođe do njihovih promena, program
# inotifywait pušta prolaz na dalje pozive, prvo `sleep 1`, nakon `make all`.
# Ovo se radi neograniceno puta. Izlaz iz ove petlje je moguće slanjem signala
# za izlaz, C-c (CTRL-c).
watcher:
	@while [ 1 ]; do inotifywait $(DIR_CLANAK)/$(TEXFILE) $(DIR_CLANAK)/$(BIBFILE) $(DIR_PREZENTACIJA)/$(TEXFILE); sleep 1; make all; done
watcher_pdf:
	@while [ 1 ]; do inotifywait $(DIR_CLANAK)/$(TEXFILE) $(DIR_CLANAK)/$(BIBFILE) $(DIR_PREZENTACIJA)/$(TEXFILE); sleep 1; make pdf; done
# Clean samo čisti prolazne datoteke, one koje su nastale tokom LaTeX-ovanja.
.PHONY: clean
clean:
	-cd $(DIR_CLANAK) && rm $(TEMPFILES);
	-cd $(DIR_PREZENTACIJA) && rm $(TEMPFILES);

