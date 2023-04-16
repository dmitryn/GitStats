# gitstats Docker image
Forked from https://github.com/dmitryn/GitStats to package gitstats in a
Docker image with all prerequisites.

See the [original README](README.original.md) for documentation of gitstats itself.

## Usage
Run with Docker:
```bash
# Path to git repository.
REPO_DIR="./"
# Path to output directory.
OUT_DIR="./out"

docker run --rm \
  -v "$REPO_DIR:/repo:ro" \
  -v "$OUT_DIR:/out" \
  jk4ger/gitstats:latest
```
