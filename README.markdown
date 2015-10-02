# About
gitstats is a statistics generator for git repositories.  It is mostly intended
for developers, as a way to check some development statistics for a project.

Currently it produces only HTML output with tables and graphs.

## Features
Here is a list of some statistics generated currently:

* General statistics: total files, lines, commits, authors.
* Activity: commits by hour of day, day of week, hour of week, month of year, year and month, and year.
* Authors: list of authors (name, commits (%), first commit date, last commit date, age), author of month, author of year.
* Files: file count by date, extensions
* Lines: Lines of Code by date

## Demo
http://gitstats.sourceforge.net/examples/gitstats/

## Requirements

- Python (>= 2.4.4) (python3 is not supported)
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
    
    $ open ~/public_html/project/index.html

## Install for windows 7

1.  Add variables to PATH
    * Add python to PATH following [link](http://stackoverflow.com/questions/3701646/how-to-add-to-the-pythonpath-in-windows-7)(working with answer from Delicia Brummitt)
    * Add git to PATH following [link](http://blog.countableset.ch/2012/06/07/adding-git-to-windows-7-path/)

2.  Unzip GitStats in your favorite git working repo

3.  Open a terminal windows+r then write cmd

4.  Go in the repo where you unzip GitStats with cd

5.  Use command 
    
    $   python git-stats input-file output-file

## Recommended

- Lots of memory and fast disk for large projects

## Contributions

Patches should be sent under "GPLv2 or older" license - this will allow
upgrading to newer GPL versions if they are sensible.
