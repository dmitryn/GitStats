PREFIX=/usr/local
BINDIR=$(PREFIX)/bin
RESOURCEDIR=$(PREFIX)/share/gitstats
RESOURCES=gitstats.css sortable.js *.gif
BINARIES=git-stats
VERSION=$(shell git describe 2>/dev/null || git rev-parse --short HEAD)
SEDVERSION=sed -ie 's/VERSION = 0/VERSION = "$(VERSION)"/'

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

.PHONY: all help install release
