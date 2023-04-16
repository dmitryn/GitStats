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

all: help

help:
	@echo "Usage:"
	@echo
	@echo "make install                   # install to ${PREFIX}"
	@echo "make install PREFIX=~          # install to ~"
	@echo "make release [VERSION=foo]     # make a release tarball"
	@echo

install:
	install -d $(BINDIR) $(RESOURCEDIR)
	install -v $(BINARIES) $(BINDIR)
	install -v -m 644 $(RESOURCES) $(RESOURCEDIR)
	$(SEDVERSION) $(BINDIR)/git-stats

release:
	@cp git-stats git-stats.tmp
	@$(SEDVERSION) git-stats.tmp
	@tar --owner=0 --group=0 --transform 's!^!gitstats/!' --transform 's!gitstats.tmp!gitstats!' -zcf gitstats-$(VERSION).tar.gz git-stats.tmp $(RESOURCES) doc/ Makefile
	@$(RM) git-stats.tmp

run:
	python2 ./git-stats . $(OUTDIR)

docker-run: docker-image
	docker-compose run gitstats

docker-image:
	docker build -t $(DOCKERIMAGE) --progress=plain .

clean:
	find $(OUTDIR) -mindepth 1 -not -name .gitignore | xargs -l rm -fv

.PHONY: all help install release run docker-run docker-image clean
