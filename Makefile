CHAPTERS = $(shell find front chapters appendix -name '*.md')
FIGURES = $(shell find figures)

TEXFLAGS =  \
	--defaults thesis.yaml \
	--verbose \
	--biblatex \
	-M codeBlockCaptions=true \
	--include-after-body back/statement.tex \
	--template templates/template.tex \

pdf: thesis.tex references.bib
	latexmk -pdf -xelatex thesis.tex

docx: thesis.yaml $(CHAPTERS) $(FIGURES)
	pandoc --defaults thesis.yaml -o thesis.docx

thesis.tex: thesis.yaml templates/template.tex $(CHAPTERS) $(FIGURES)
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
