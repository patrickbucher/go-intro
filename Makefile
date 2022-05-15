ALL=go-intro.pdf go-intro.docx go-intro.html

PARAMS=-s -N --toc -V lang=de -V fontsize=12pt -V urlcolor=blue -V linkcolor=blue \
       -V date="`date +'%d.%m.%Y'`" --highlight-style monochrome
PDF_PARAMS=--pdf-engine=xelatex -V documentclass=scrartcl -V papersize=a4 \
	   -V mainfont="Crimson Pro" -V sansfont="Lato" -V monofont="Inconsolata" \

.PHONY: all clean

all: $(ALL) go-intro.zip

clean:
	rm -f $(ALL) go-intro.zip

go-intro.zip: $(ALL)
	zip $@ $(ALL)

go-intro.pdf: go-intro.md
	pandoc -t pdf $(PARAMS) $(PDF_PARAMS) $< -o $@

go-intro.docx: go-intro.md
	pandoc -t docx $(PARAMS) $< -o $@

go-intro.html: go-intro.md
	pandoc -t html5 $(PARAMS) $< -o $@
