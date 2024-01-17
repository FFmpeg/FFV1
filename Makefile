VERSION := 23
STATUS := draft-
OUTPUT := $(STATUS)ietf-cellar-ffv1-$(VERSION)

VERSION-v4 := 22
STATUS-v4 := draft-
OUTPUT-v4 := $(STATUS-v4)ietf-cellar-ffv1-v4-$(VERSION-v4)

$(info RFC rendering has been tested with mmark version 2.2.8, xml2rfc 2.32.0, xmlstarlet 1.6.1, pandoc 1.19.2.1, pdfcrop v1.38, and pdf2svg 0.2.3, please ensure these are installed and recent enough.)

all: $(OUTPUT).html $(OUTPUT).txt $(OUTPUT).xml $(OUTPUT-v4).html $(OUTPUT-v4).txt $(OUTPUT-v4).xml

$(OUTPUT).md: ffv1.md 
	cat rfc_frontmatter.md "$<" rfc_backmatter.md | grep -v "^AART:" | grep -v "^SVGC" | grep -v "{V4}" | sed "s|^AART:||g;s|{V3}||g;s|SVGI:||g;s|@BUILD_DATE@|$(shell date +'%F')|" > $(OUTPUT).md

$(OUTPUT-v4).md: ffv1.md 
	cat rfc_frontmatter.md "$<" rfc_backmatter.md | grep -v "^AART:" | grep -v "^SVGC" | grep -v "{V3}" | sed "s|^AART:||g;s|{V4}||g;s|SVGI:||g;s|@BUILD_DATE@|$(shell date +'%F')|" > $(OUTPUT-v4).md

%.xml: %.md mmark.version-ok xmlstarlet.version-ok pdfcrop.version-ok
	bash makesvg
	mmark "$<" | sed 's|<date year="undated"></date>|<date>undated</date>|g' > "$@"
	xmlstarlet edit --inplace --insert "/rfc" --type attr -name sortRefs -v "true" "$@"
	bash svg2src "$@"

%.html: %.xml xml2rfc.version-ok
	xml2rfc --html --v3 "$<" -o "$@"

%.txt: %.xml xml2rfc.version-ok
	xml2rfc --v3 "$<" -o "$@"

clean:
	rm -f ffv1.pdf ffv1-v4.pdf ffv1.html ffv1-v4.html draft-ietf-cellar-ffv1-* merged_* mmark.version-ok xml2rfc.version-ok xmlstarlet.version-ok pdfcrop.version-ok

mmark.version-ok:
	test ` mmark --version | sed 's/\.\([0-9][0-9]\)/\1/g;s/\./0/g' `0 -ge 202080 && touch mmark.version-ok || (echo mmark version 2.2.8 or later is required && exit 1)

xml2rfc.version-ok:
	test ` xml2rfc --version | sed 's/.* //g;s/\.\([0-9][0-9]\)/\1/g;s/\./0/g' `0 -ge 232000 && touch xml2rfc.version-ok || (echo xml2rfc version 2.32.0 or later is required && exit 1)

xmlstarlet.version-ok:
	test ` xmlstarlet --version | head -1 | sed 's/\.\([0-9][0-9]\)/\1/g;s/\./0/g' `0 -ge 106010 && touch xmlstarlet.version-ok || (echo xmlstarlet version 1.6.1 or later is required && exit 1)

pdfcrop.version-ok:
	test ` pdfcrop --version | sed 's/.* v//;s/\.\([0-9][0-9]\)/\1/g;s/\./0/g' `0 -ge 1380 && touch pdfcrop.version-ok || (echo pdfcrop version 1.38 or later is required && exit 1)
