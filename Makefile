SRC = $(wildcard *.tex)
PDFS = $(SRC:.tex=.pdf)

all: pdf clean_intermediate

en: $(filter resume.pdf, $(PDFS)) clean_intermediate

zh: $(filter resume-zh.pdf, $(PDFS)) clean_intermediate

pdf: $(PDFS)

%.pdf: %.tex
	xelatex $<

ifeq ($(OS),Windows_NT)
  # on Windows
  RM = cmd //C del
else
  # on Unix/Linux
  RM = rm -f
endif

clean:
	$(RM) *.log *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind

clean_intermediate:
	$(RM) *.log *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind
