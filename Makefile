all: original/*.jpg
	mkdir -p scaled
	for image in $^; do \
		convert "$$image" -resize "3840x2160!" "scaled/$$(basename "$$image")";\
	done

clean:
	rm -rf scaled
