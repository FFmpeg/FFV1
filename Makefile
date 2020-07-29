VERSION := 16
STATUS := draft-
OUTPUT := $(STATUS)ietf-cellar-ffv1-$(VERSION)

VERSION-v4 := 13
STATUS-v4 := draft-
OUTPUT-v4 := $(STATUS)ietf-cellar-ffv1-v4-$(VERSION)

XML2RFC_CALL := xml2rfc
MMARK_CALL := mmark

XML2RFC := $(XML2RFC_CALL) --v3
MMARK := $(MMARK_CALL)

$(info RFC rendering has been tested with mmark version 2.0.48, xml2rfc 2.32.0, xmlstarlet 1.6.1, pdfcrop v1.38, and pdf2svg 0.2.3, please ensure these are installed and recent enough.)

all: $(OUTPUT).html $(OUTPUT).txt $(OUTPUT).xml $(OUTPUT-v4).html $(OUTPUT-v4).txt $(OUTPUT-v4).xml

$(OUTPUT).md: ffv1.md 
	cat rfc_frontmatter.md "$<" rfc_backmatter.md | grep -v "^AART:" | grep -v "^SVGC" | grep -v "{V4}" | sed "s|^AART:||g;s|{V3}||g;s|SVGI:||g;s|@BUILD_DATE@|$(shell date +'%F')|" > $(OUTPUT).md

$(OUTPUT-v4).md: ffv1.md 
	cat rfc_frontmatter.md "$<" rfc_backmatter.md | grep -v "^AART:" | grep -v "^SVGC" | grep -v "{V3}" |  sed "s|^AART:||g;s|{V4}||g;s|SVGI:||g;s|@BUILD_DATE@|$(shell date +'%F')|" > $(OUTPUT).md

%.xml: %.md
	bash makesvg
	$(MMARK) $< > $@
	sed -i -e 's|<date year="undated"></date>|<date>undated</date>|g' $@
	bash svg2src $@

%.html: %.xml
	$(XML2RFC) --html $< -o $@

%.txt: %.xml
	$(XML2RFC) $< -o $@

clean:
	rm -f ffv1.pdf ffv1-v4.pdf ffv1.html ffv1-v4.html draft-ietf-cellar-ffv1-* merged_*
