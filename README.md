# gitstats Docker image
Forked from https://github.com/dmitryn/GitStats to package gitstats in a
Docker image with all prerequisites:

[jk4ger/gitstats](https://hub.docker.com/repository/docker/jk4ger/gitstats)

See the [original README](README.original.md) for documentation of gitstats itself.

## Usage
Run with Docker:
```bash
# Path to git repository.
REPO_DIR="./"
# Path to output directory.
OUT_DIR="./out"

# Generate report in $OUT_DIR.
docker run --rm \
  -v "$REPO_DIR:/repo:ro" \
  -v "$OUT_DIR:/out" \
  jk4ger/gitstats:latest
  
# Open report in browser.
xdg-open "$OUT_DIR/index.html"
```
