PARAMS=-s -N --toc -V lang=de -V fontsize=11pt -V urlcolor=blue -V linkcolor=blue \
       -V date="`date +'%d.%m.%Y'`" --highlight-style monochrome
PDF_PARAMS=--pdf-engine=xelatex -V documentclass=scrartcl -V papersize=a4 \
       -V mainfont="Liberation Serif" -V sansfont="Liberation Sans" -V monofont="Liberation Mono" \

.PHONY: all clean

all: go-intro.pdf go-intro.docx go-intro.epub go-intro.html

clean:
	rm -f go-intro.pdf go-intro.docx go-intro.epub go-intro.html

go-intro.pdf: chapters/*.md
	pandoc $(PARAMS) $(PDF_PARAMS) chapters/*.md -o $@

go-intro.docx: chapters/*.md
	pandoc $(PARAMS) chapters/*.md -o $@

go-intro.epub: chapters/*.md
	pandoc $(PARAMS) chapters/*.md -o $@

go-intro.html: chapters/*.md
	pandoc $(PARAMS) chapters/*.md -o $@
