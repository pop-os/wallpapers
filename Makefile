ORIGINAL=$(wildcard original/*.jpg)
SCALED=$(patsubst original/%.jpg, scaled/%.jpg, $(ORIGINAL))

prefix ?= /usr
datarootdir = $(prefix)/share
datadir = $(datarootdir)

.PHONY: all clean install uninstall

all: $(SCALED)

clean:
	rm -rf scaled

install: all
	for file in $(SCALED); do \
		install -D -m 0644 "$$file" "$(DESTDIR)$(datadir)/backgrounds/$$(basename "$$file")"; \
	done

uninstall:
	for file in $(SCALED); do \
		rm -f "$(DESTDIR)$(datadir)/backgrounds/$$(basename "$$file")"; \
	done
	rmdir --ignore-fail-on-non-empty "$(DESTDIR)$(datadir)/backgrounds/"

scaled:
	mkdir -p scaled
	touch scaled

scaled/%.jpg: original/%.jpg scaled
	convert "$<" -resize "3840x2160^" "$@"
