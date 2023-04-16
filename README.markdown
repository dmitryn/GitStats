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

## Usage
Run with Docker:
```bash
docker run --rm \
  -v /path/to/git/repository:/repo:ro \
  -v /path/to/output/directory:/out \
  jk4ger/gitstats:latest
```
