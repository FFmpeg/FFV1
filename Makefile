SRC=ffv1.md
PDF=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)
VERSION=11
VERSION-v4=08

$(info RFC rendering has been tested with mmark version 2.0.48, xml2rfc 2.32.0, xmlstarlet 1.6.1, pdfcrop v1.38, and pdf2svg 0.2.3, please ensure these are installed and recent enough.)

all: draft-ietf-cellar-ffv1-$(VERSION).html draft-ietf-cellar-ffv1-v4-$(VERSION-v4).html draft-ietf-cellar-ffv1-$(VERSION).txt draft-ietf-cellar-ffv1-v4-$(VERSION-v4).txt

draft-ietf-cellar-ffv1-$(VERSION).xml: ffv1.md
	bash makesvg
	cat rfc_frontmatter.md "$<" rfc_backmatter.md | grep -v "^AART:" | grep -v "^SVGC" | grep -v "{V4}" |  sed "s|^AART:||g;s|{V3}||g;s|SVGI:||g" > merged_rfchtml.md
	mmark merged_rfchtml.md | sed 's|<date year="undated"></date>|<date>undated</date>|g' > draft-ietf-cellar-ffv1-$(VERSION).xml
	bash svg2src draft-ietf-cellar-ffv1-$(VERSION).xml

draft-ietf-cellar-ffv1-v4-$(VERSION-v4).xml: ffv1.md
	bash makesvg
	cat rfc_frontmatter.md "$<" rfc_backmatter.md | grep -v "^AART:" | grep -v "^SVGC" | grep -v "{V3}" |  sed "s|^AART:||g;s|{V4}||g;s|SVGI:||g" > merged_rfchtml-v4.md
	mmark merged_rfchtml-v4.md | sed 's|<date year="undated"></date>|<date>undated</date>|g' > draft-ietf-cellar-ffv1-v4-$(VERSION-v4).xml
	bash svg2src draft-ietf-cellar-ffv1-v4-$(VERSION-v4).xml

draft-ietf-cellar-ffv1-$(VERSION).html: draft-ietf-cellar-ffv1-$(VERSION).xml
	xml2rfc --html --v3 "$<" -o "$@"

draft-ietf-cellar-ffv1-v4-$(VERSION-v4).html: draft-ietf-cellar-ffv1-v4-$(VERSION-v4).xml
	xml2rfc --html --v3 "$<" -o "$@"

draft-ietf-cellar-ffv1-$(VERSION).txt: draft-ietf-cellar-ffv1-$(VERSION).xml
	xml2rfc --v3 "$<" -o "$@"

draft-ietf-cellar-ffv1-v4-$(VERSION-v4).txt: draft-ietf-cellar-ffv1-v4-$(VERSION-v4).xml
	xml2rfc --v3 "$<" -o "$@"

clean:
	rm -f ffv1.pdf ffv1-v4.pdf ffv1.html ffv1-v4.html draft-ietf-cellar-ffv1-* merged_*
