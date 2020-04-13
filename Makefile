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

thesis.tex: thesis.yaml $(CHAPTERS) $(FIGURES) $(CHARTS)
	pandoc $< -o $@ $(TEXFLAGS) 2>pandoc.log 

figures/charts/%.pdf: figures/charts/%.tex
	latexmk -pdf -outdir=figures/charts/ $<

clean:
	latexmk -C && rm thesis.tex thesis.bbl

test:
	biber --tool -V references.bib && pdfx thesis.pdf -c

stats:
	(cd ./bin; ./stats.sh)

.PHONY: pdf clean test stats
