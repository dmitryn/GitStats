# About
gitstats is a statistics generator for git repositories.  It is mostly intended
for developers, as a way to check some development statistics for a project.

Currently it produces only HTML output with tables and graphs.

## Requirements

- Python (>= 2.4.4)
- Git (>= 1.5.2.4)
- Gnuplot (>= 4.0.0)
- a git repository (bare clone will work as well)

The above versions are not absolute requirements; older versions may work also.

## Install

gitstats does not currently need to be installed; it's used right from the
directory (it also assumes some files like the stylesheet are in .)

Suppose you have a git project at /mnt/src/git/project
and you want to save the statistics to ~/public_html/project

You would run:

    $ ./git-stats /mnt/src/git/project ~/public_html/project

or with git-stats executable in your PATH:

    $ git stats /mnt/src/git/project ~/public_html/project

(go grab a cup of coffee if it's a large project :)
    $ sensible-browser ~/public_html/project/index.html

## Recommended

- Lots of memory and fast disk for large projects

## Contributions

Patches should be sent under "GPLv2 or older" license - this will allow
upgrading to newer GPL versions if they are sensible.
