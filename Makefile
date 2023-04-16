DOCKERIMAGE=jk4ger/gitstats:local
DOCKERFILE=Dockerfile

OUTDIR=./out
OUT_INDEX=$(OUTDIR)/index.html

image:
	docker build -t $(DOCKERIMAGE) --progress=plain .

run: image
	docker-compose run gitstats

test: clean run check-output

check-output:
	@grep '<title>GitStats - repo</title>' $(OUT_INDEX) >/dev/null || (echo "Unexpected content of $(OUT_INDEX)."; exit 1)

clean:
	find $(OUTDIR) -mindepth 1 -not -name .gitignore | xargs -l rm -fv

.PHONY: run image clean
