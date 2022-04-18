PARAMS=-s -N --toc --pdf-engine=xelatex -V lang=de -V documentclass=scrartcl \
       -V papersize=a4 -V fontsize=11pt -V urlcolor=blue -V linkcolor=blue \
       -V mainfont="Liberation Serif" -V sansfont="Liberation Sans" -V monofont="Liberation Mono" \
       -V date="`date +'%d.%m.%Y'`"

.PHONY: all clean

all: go-intro.pdf

clean:
	rm -f go-intro.pdf

go-intro.pdf: chapters/*.md
	pandoc $(PARAMS) chapters/*.md -o $@
