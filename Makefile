PREFIX=/usr/local
BINDIR=$(PREFIX)/bin
RESOURCEDIR=$(PREFIX)/share/gitstats
RESOURCES=gitstats.css sortable.js *.gif
BINARIES=git-stats
VERSION=$(shell git describe 2>/dev/null || git rev-parse --short HEAD)
SEDVERSION=sed -ie 's/VERSION = 0/VERSION = "$(VERSION)"/'
OUTDIR=./out

DOCKERIMAGE=jk4ger/gitstats:local
DOCKERFILE=Dockerfile

run: image
	docker-compose run gitstats

image:
	docker build -t $(DOCKERIMAGE) --progress=plain .

clean:
	find $(OUTDIR) -mindepth 1 -not -name .gitignore | xargs -l rm -fv

.PHONY: run image clean
