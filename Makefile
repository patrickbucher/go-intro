PARAMS=-s -N --toc -V lang=de -V fontsize=12pt -V urlcolor=blue -V linkcolor=blue \
       -V date="`date +'%d.%m.%Y'`" --highlight-style monochrome
PDF_PARAMS=--pdf-engine=xelatex -V documentclass=scrartcl -V papersize=a4 \
	   -V mainfont="Crimson Pro" -V sansfont="Lato" -V monofont="Inconsolata" \

.PHONY: all clean

all: go-intro.pdf go-intro.docx go-intro.odt go-intro.epub go-intro.html \
	go-intro.rtf go-intro.txt go-intro.7

clean:
	rm -f go-intro.pdf go-intro.docx go-intro.odt go-intro.epub go-intro.html \
		go-intro.rtf go-intro.txt go-intro.7

go-intro.pdf: go-intro.md
	pandoc -t pdf $(PARAMS) $(PDF_PARAMS) $< -o $@

go-intro.docx: go-intro.md
	pandoc -t docx $(PARAMS) $< -o $@

go-intro.odt: go-intro.md
	pandoc -t odt $(PARAMS) $< -o $@

go-intro.epub: go-intro.md
	pandoc -t epub $(PARAMS) $< -o $@

go-intro.html: go-intro.md
	pandoc -t html5 $(PARAMS) $< -o $@

go-intro.rtf: go-intro.md
	pandoc -t rtf $(PARAMS) $< -o $@

go-intro.txt: go-intro.md
	pandoc -t plain $(PARAMS) $< -o $@

go-intro.7: go-intro.md
	pandoc -t man -V section=7 $(PARAMS) $< -o $@
