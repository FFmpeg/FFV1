SRC=ffv1.md
PDF=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)

$(info PDF and HTML rendering has been tested with pandoc version 1.13.2.1, some older versions are known to produce very poor output, please ensure your pandoc is recent enough.)
$(info RFC rendering has been tested with mmark version 1.3.4 and xml2rfc 2.5.1, please ensure these are installed and recent enough.)

all: ffv1.html ffv1.pdf draft-ietf-cellar-ffv1-00.html draft-ietf-cellar-ffv1-00.txt
	
ffv1.html: ffv1.md
	cat pdf_frontmatter.md "$<" pdf_backmatter.md | grep -v "^RFC:" | sed "s|^PDF:||g" > merged_ffv1html.md
	pandoc --toc --mathml -s --number-sections  -c "style.css" -o "$@" merged_ffv1html.md

ffv1.pdf:  ffv1.md
	cat pdf_frontmatter.md "$<" pdf_backmatter.md | grep -v "^RFC:" | sed "s|\[@!|\[|g;s|\[@?|\[|g;s|\[@|\[|g;s|^PDF:||g" > merged_ffv1pdf.md
	pandoc --toc -s --number-sections --latex-engine=xelatex -V geometry:margin=1in --variable urlcolor=blue -o "$@" merged_ffv1pdf.md

draft-ietf-cellar-ffv1-00.html: ffv1.md
	cat rfc_frontmatter.md "$<" | grep -v "^PDF:" | sed "s|^RFC:||g" > merged_rfchtml.md
	mmark -xml2 -page merged_rfchtml.md > draft-ietf-cellar-ffv1-00.xml
	xml2rfc --html draft-ietf-cellar-ffv1-00.xml -o "$@"

draft-ietf-cellar-ffv1-00.txt: ffv1.md
	cat rfc_frontmatter.md "$<" | grep -v "^PDF:" | sed "s|^RFC:||g" > merged_rfctxt.md
	mmark -xml2 -page merged_rfctxt.md > draft-ietf-cellar-ffv1-00.xml
	xml2rfc draft-ietf-cellar-ffv1-00.xml -o "$@"

clean:
	rm -f ffv1.pdf ffv1.html draft-ietf-cellar-ffv1-0* merged_ffv1html.md merged_ffv1pdf.md merged_rfchtml.md merged_rfctxt.md
