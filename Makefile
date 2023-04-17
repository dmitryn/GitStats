# Makefile for building Docker image of gitstats.

SHELL = /bin/bash

# Absolute path to directory containing this Makefile.
# Needed for older `docker run` versions which don't support bind mounts using relative paths.
ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

DOCKERIMAGE=jk4ger/gitstats:local
DOCKERFILE=Dockerfile

REPO_DIR=$(ROOT_DIR)
OUTDIR=$(ROOT_DIR)/out
OUT_INDEX=$(OUTDIR)/index.html

# Run with current user, otherwise the output files will be owned by root.
UID=$(shell id -u)
GID=$(shell id -g)
USER=$(UID):$(GID)

.PHONY: build
build:
	docker build -t $(DOCKERIMAGE) --progress=plain .

.PHONY: run
run: build run-ci

.PHONY: run-ci
run-ci:
	docker run \
		--user $(USER) \
		-v "$(REPO_DIR):/repo:ro" \
		-v "$(OUTDIR):/out" \
		--rm \
		$(DOCKERIMAGE)

.PHONY: test
test: clean run check-output

.PHONY: test-ci
test-ci: clean run-ci check-output

.PHONY: check-output
check-output:
	@grep '<title>GitStats - repo</title>' $(OUT_INDEX) >/dev/null || (echo "Unexpected content of $(OUT_INDEX)."; exit 1)

.PHONY: clean
clean:
	find $(OUTDIR) -mindepth 1 -not -name .gitignore | xargs -l rm -fv
