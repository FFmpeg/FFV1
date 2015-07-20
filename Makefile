SRC=ffv1.md
PDF=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)

$(info PDF and HTML rendering has been tested with pandoc version 1.13.2.1, some older versions are known to produce very poor output, please ensure your pandoc is recent enough.)

all: ffv1.html ffv1.pdf
	
ffv1.html: ffv1.md
	pandoc --toc --mathml -s --number-sections  -c "http://elyxer.nongnu.org/lyx.css" -o "$@" "$<"

ffv1.pdf:  ffv1.md
	pandoc --toc -s --number-sections --latex-engine=xelatex -V geometry:margin=1in -o "$@" "$<"

clean:
	rm -f ffv1.pdf ffv1.html
