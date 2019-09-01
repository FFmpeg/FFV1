SRC=ffv1.md
PDF=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)
VERSION=08
VERSION-v4=05

$(info RFC rendering has been tested with mmark version 2.0.48, xml2rfc 2.23.1, xmlstarlet 1.6.1, pdfcrop v1.38, and pdf2svg 0.2.3, please ensure these are installed and recent enough.)

all: draft-ietf-cellar-ffv1-$(VERSION).html draft-ietf-cellar-ffv1-v4-$(VERSION-v4).html draft-ietf-cellar-ffv1-$(VERSION).txt draft-ietf-cellar-ffv1-v4-$(VERSION-v4).txt

draft-ietf-cellar-ffv1-$(VERSION).html: ffv1.md
	bash makesvg
	cat rfc_frontmatter.md "$<" rfc_backmatter.md | grep -v "^AART:" | grep -v "^SVGC" | grep -v "{V4}" |  sed "s|^AART:||g;s|{V3}||g;s|SVGI:||g" > merged_rfchtml.md
	mmark merged_rfchtml.md > draft-ietf-cellar-ffv1-$(VERSION).xml
	bash svg2src draft-ietf-cellar-ffv1-$(VERSION).xml
	xml2rfc --html --v3 draft-ietf-cellar-ffv1-$(VERSION).xml -o "$@"

draft-ietf-cellar-ffv1-v4-$(VERSION-v4).html: ffv1.md
	bash makesvg
	cat rfc_frontmatter.md "$<" rfc_backmatter.md | grep -v "^AART:" | grep -v "^SVGC" | grep -v "{V3}" | sed "s|^AART:||g;s|{V4}||g;s|SVGI:||g" > merged_rfchtml-v4.md
	mmark merged_rfchtml-v4.md > draft-ietf-cellar-ffv1-v4-$(VERSION-v4).xml
	bash svg2src draft-ietf-cellar-ffv1-v4-$(VERSION-v4).xml
	xml2rfc --html --v3 draft-ietf-cellar-ffv1-v4-$(VERSION-v4).xml -o "$@"

draft-ietf-cellar-ffv1-$(VERSION).txt: ffv1.md
	cat rfc_frontmatter.md "$<" rfc_backmatter.md | grep -v "^SVG" | grep -v "{V4}" | sed "s|^AART:||g;s|{V3}||g" > merged_rfctxt.md
	mmark merged_rfctxt.md > draft-ietf-cellar-ffv1-$(VERSION).xml
	xml2rfc --v3 draft-ietf-cellar-ffv1-$(VERSION).xml -o "$@"

draft-ietf-cellar-ffv1-v4-$(VERSION-v4).txt: ffv1.md
	cat rfc_frontmatter.md "$<" rfc_backmatter.md | grep -v "^SVG" | grep -v "{V3}" | sed "s|^AART:||g;s|{V4}||g" > merged_rfctxt-v4.md
	mmark merged_rfctxt-v4.md > draft-ietf-cellar-ffv1-v4-$(VERSION-v4).xml
	xml2rfc --v3 draft-ietf-cellar-ffv1-v4-$(VERSION-v4).xml -o "$@"

clean:
	rm -f ffv1.pdf ffv1-v4.pdf ffv1.html ffv1-v4.html draft-ietf-cellar-ffv1-* merged_*
