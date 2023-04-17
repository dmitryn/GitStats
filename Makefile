# Absolute path to directory containing this Makefile.
# Older `docker run` versions do not support bind mounts with relative paths.
ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

DOCKERIMAGE=jk4ger/gitstats:local
DOCKERFILE=Dockerfile

REPO_DIR=$(ROOT_DIR)
OUTDIR=$(ROOT_DIR)/out
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
