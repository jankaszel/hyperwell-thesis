pdf:
	pandoc --defaults thesis.yaml --verbose --biblatex 2>pandoc.log && \
		latexmk -pdf -xelatex thesis.tex

clean:
	latexmk -C

test:
	pdfx thesis.pdf -c

.PHONY: pdf clean test
