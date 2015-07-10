SRC=ffv1.md
PDF=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)

all: ffv1.html ffv1.pdf
	@echo "Propering PDF and HTML rendering has been tested with requires pandoc version 1.13.2.1 and higher."

ffv1.html: ffv1.md
	pandoc --mathml -s --number-sections  -c "http://elyxer.nongnu.org/lyx.css" -o "$@" "$<"

ffv1.pdf:  ffv1.md
	pandoc -s --number-sections --latex-engine=xelatex -V geometry:margin=1in -o "$@" "$<"

clean:
	rm -f ffv1.pdf ffv1.html
