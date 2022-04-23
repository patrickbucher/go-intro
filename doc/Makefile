PARAMS=-s -N --toc -V lang=de -V fontsize=12pt -V urlcolor=blue -V linkcolor=blue \
       -V date="`date +'%d.%m.%Y'`" --highlight-style monochrome
PDF_PARAMS=--pdf-engine=xelatex -V documentclass=scrartcl -V papersize=a4 \
       -V mainfont="Crimson" -V sansfont="Lato" -V monofont="Inconsolata" \

.PHONY: all clean

all: go-intro.pdf go-intro.docx go-intro.epub go-intro.html

clean:
	rm -f go-intro.pdf go-intro.docx go-intro.epub go-intro.html

go-intro.pdf: go-intro.md
	pandoc $(PARAMS) $(PDF_PARAMS) $< -o $@

go-intro.docx: go-intro.md
	pandoc $(PARAMS) $< -o $@

go-intro.epub: go-intro.md
	pandoc $(PARAMS) $< -o $@

go-intro.html: go-intro.md
	pandoc $(PARAMS) $< -o $@
