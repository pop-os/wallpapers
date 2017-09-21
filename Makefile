ORIGINAL=$(wildcard original/*.jpg)
SCALED=$(patsubst original/%.jpg, scaled/%.jpg, $(ORIGINAL))

all: $(SCALED)

scaled:
	mkdir -p scaled
	touch scaled

scaled/%.jpg: original/%.jpg scaled
	convert "$<" -resize "3840x2160^" "$@"

clean:
	rm -rf scaled
