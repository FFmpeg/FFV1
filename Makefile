SRC=ffv1.md
PDF=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)

$(info PDF and HTML rendering has been tested with pandoc version 1.13.2.1, some older versions are known to produce very poor output, please ensure your pandoc is recent enough.)
$(info RFC rendering has been tested with mmark version 1.3.4 and xml2rfc 2.5.1, please ensure these are installed and recent enough.)

all: ffv1.html ffv1.pdf draft-niedermayer-cellar-ffv1-00.html draft-niedermayer-cellar-ffv1-00.txt
	
ffv1.html: ffv1.md
	cat pdf_frontmatter.md "$<" pdf_backmatter.md > merged.md
	pandoc --toc --mathml -s --number-sections  -c "style.css" -o "$@" merged.md

ffv1.pdf:  ffv1.md
	cat pdf_frontmatter.md "$<" pdf_backmatter.md | sed "s|\[@!|\[|g;s|\[@?|\[|g;s|\[@|\[|g" > merged.md
	pandoc --toc -s --number-sections --latex-engine=xelatex -V geometry:margin=1in -o "$@" merged.md

draft-niedermayer-cellar-ffv1-00.html: ffv1.md
	cat rfc_frontmatter.md "$<" > merged.md
	mmark -xml2 -page merged.md > draft-niedermayer-cellar-ffv1-00.xml
	xml2rfc --html draft-niedermayer-cellar-ffv1-00.xml -o "$@"

draft-niedermayer-cellar-ffv1-00.txt: ffv1.md
	cat rfc_frontmatter.md "$<" > merged.md
	mmark -xml2 -page merged.md > draft-niedermayer-cellar-ffv1-00.xml
	xml2rfc draft-niedermayer-cellar-ffv1-00.xml -o "$@"

clean:
	rm -f ffv1.pdf ffv1.html draft-niedermayer-cellar-ffv1-00.txt draft-niedermayer-cellar-ffv1-00.html merged.md draft-niedermayer-cellar-ffv1-00.xml
