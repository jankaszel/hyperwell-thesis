CHAPTERS = $(shell find chapters -name '*.md')
FIGURES = $(shell find figures)
CHARTS = $(shell find figures/charts -name '*.pdf')

TEXFLAGS =  \
	--defaults thesis.yaml \
	--verbose \
	--biblatex \
	-M codeBlockCaptions=true \
	--include-after-body back/statement.tex \
	--template templates/template.tex \

pdf: thesis.tex references.bib
	latexmk -pdf -xelatex thesis.tex

thesis.tex: thesis.yaml templates/template.tex $(CHAPTERS) $(FIGURES) $(CHARTS)
	pandoc -o $@ $(TEXFLAGS) 2>pandoc.log 

clean:
	latexmk -C && rm thesis.tex thesis.bbl

test:
	biber --tool -V references.bib && pdfx thesis.pdf -c

diff:
	(cd bin && ./stats.sh)

stats:
	wc -w chapters/*.md

.PHONY: pdf clean test stats
