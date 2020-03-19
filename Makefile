pdf:
	pandoc --defaults thesis.yaml --pdf-engine xelatex --verbose 2>pandoc.log 

.PHONY: pdf
