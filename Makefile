DOCKERIMAGE=jk4ger/gitstats:local
DOCKERFILE=Dockerfile

REPO_DIR=.
OUTDIR=./out
OUT_INDEX=$(OUTDIR)/index.html

build:
	docker build -t $(DOCKERIMAGE) --progress=plain .

run: build run-ci

run-ci:
	docker run \
      --user $(shell id -u):$(shell id -g) \
      -v "$(REPO_DIR):/repo:ro" \
      -v "$(OUTDIR):/out" \
      --rm \
      $(DOCKERIMAGE)

test: clean run check-output

test-ci: clean run-ci check-output

check-output:
	@grep '<title>GitStats - repo</title>' $(OUT_INDEX) >/dev/null || (echo "Unexpected content of $(OUT_INDEX)."; exit 1)

clean:
	find $(OUTDIR) -mindepth 1 -not -name .gitignore | xargs -l rm -fv

.PHONY: build run test check-output clean
