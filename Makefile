SRC=ffv1.md
PDF=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)
VERSION=02
VERSION-v4=00

$(info PDF and HTML rendering has been tested with pandoc version 1.13.2.1, some older versions are known to produce very poor output, please ensure your pandoc is recent enough.)
$(info RFC rendering has been tested with mmark version 1.3.4 and xml2rfc 2.5.1, please ensure these are installed and recent enough.)

all: ffv1.html ffv1-v4.html ffv1.pdf ffv1-v4.pdf draft-ietf-cellar-ffv1-$(VERSION).html draft-ietf-cellar-ffv1-v4-$(VERSION-v4).html draft-ietf-cellar-ffv1-$(VERSION).txt draft-ietf-cellar-ffv1-v4-$(VERSION-v4).txt

ffv1.html: ffv1.md
	cat pdf_frontmatter.md "$<" pdf_backmatter.md | grep -v "^RFC:" | grep -v "{V4}" | sed "s|^PDF:||g;s|{V3}||g" > merged_ffv1html.md
	pandoc --toc --mathml -s --number-sections  -c "style.css" -o "$@" merged_ffv1html.md

ffv1-v4.html: ffv1.md
	cat pdf_frontmatter.md "$<" pdf_backmatter.md | grep -v "^RFC:" | grep -v "{V3}" | sed "s|^PDF:||g;s|{V4}||g" > merged_ffv1-v4-html.md
	pandoc --toc --mathml -s --number-sections  -c "style.css" -o "$@" merged_ffv1-v4-html.md

ffv1.pdf:  ffv1.md
	cat pdf_frontmatter.md "$<" pdf_backmatter.md | grep -v "^RFC:" | grep -v "{V4}" | sed "s|\[@!|\[|g;s|\[@?|\[|g;s|\[@|\[|g;s|^PDF:||g;s|{V3}||g" > merged_ffv1pdf.md
	pandoc --toc -s --number-sections --latex-engine=xelatex -V geometry:margin=1in --variable urlcolor=blue -o "$@" merged_ffv1pdf.md

ffv1-v4.pdf:  ffv1.md
	cat pdf_frontmatter.md "$<" pdf_backmatter.md | grep -v "^RFC:" | grep -v "{V3}" | sed "s|\[@!|\[|g;s|\[@?|\[|g;s|\[@|\[|g;s|^PDF:||g;s|{V4}||g" > merged_ffv1-v4-pdf.md
	pandoc --toc -s --number-sections --latex-engine=xelatex -V geometry:margin=1in --variable urlcolor=blue -o "$@" merged_ffv1-v4-pdf.md

draft-ietf-cellar-ffv1-$(VERSION).html: ffv1.md
	cat rfc_frontmatter.md "$<" | grep -v "^PDF:" | grep -v "{V4}" |  sed "s|^RFC:||g;s|{V3}||g" > merged_rfchtml.md
	mmark -xml2 -page merged_rfchtml.md > draft-ietf-cellar-ffv1-$(VERSION).xml
	xml2rfc --html draft-ietf-cellar-ffv1-$(VERSION).xml -o "$@"

draft-ietf-cellar-ffv1-v4-$(VERSION-v4).html: ffv1.md
	cat rfc_frontmatter.md "$<" | grep -v "^PDF:" | grep -v "{V3}" | sed "s|^RFC:||g;s|{V4}||g" > merged_rfchtml-v4.md
	mmark -xml2 -page merged_rfchtml-v4.md > draft-ietf-cellar-ffv1-v4-$(VERSION-v4).xml
	xml2rfc --html draft-ietf-cellar-ffv1-v4-$(VERSION-v4).xml -o "$@"

draft-ietf-cellar-ffv1-$(VERSION).txt: ffv1.md
	cat rfc_frontmatter.md "$<" | grep -v "^PDF:" | grep -v "{V4}" | sed "s|^RFC:||g;s|{V3}||g" > merged_rfctxt.md
	mmark -xml2 -page merged_rfctxt.md > draft-ietf-cellar-ffv1-$(VERSION).xml
	xml2rfc draft-ietf-cellar-ffv1-$(VERSION).xml -o "$@"

draft-ietf-cellar-ffv1-v4-$(VERSION-v4).txt: ffv1.md
	cat rfc_frontmatter.md "$<" | grep -v "^PDF:" | grep -v "{V3}" | sed "s|^RFC:||g;s|{V4}||g" > merged_rfctxt-v4.md
	mmark -xml2 -page merged_rfctxt-v4.md > draft-ietf-cellar-ffv1-v4-$(VERSION-v4).xml
	xml2rfc draft-ietf-cellar-ffv1-v4-$(VERSION-v4).xml -o "$@"

clean:
	rm -f ffv1.pdf ffv1-v4.pdf ffv1.html ffv1-v4.html draft-ietf-cellar-ffv1-* merged_*
