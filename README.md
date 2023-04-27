# gitstats Docker image
Forked from https://github.com/dmitryn/GitStats to package gitstats in a
Docker image with Python 2 and all other prerequisites.

Docker image: [jk4ger/gitstats](https://hub.docker.com/repository/docker/jk4ger/gitstats)

See the [original README](README.original.md) for documentation of gitstats itself.

## Usage
Run with Docker:
```bash
# Path to git repository.
REPO_DIR=$(pwd)
# Output directory for report. 
OUTPUT_DIR="$(pwd)/out"

# Run with the current user, to ensure that the output files
# are owned by the user and not by root.
CONTAINER_USER=$(id -u):$(id -g)

# Generate report in output directory.
mkdir -p "$OUTPUT_DIR" && \
docker run \
  -v "$REPO_DIR:/repo:ro" \
  -v "$OUTPUT_DIR:/out" \
  --user $CONTAINER_USER \
  --rm \
  jk4ger/gitstats:latest
  
# Open report in browser.
xdg-open "$OUTPUT_DIR/index.html"
```

## Development
Prerequisites:
- Docker
- GNU make

Build the Docker image locally and run on this repository with output to [`./out`](/out):
```bash
make run
```

Run smoke test:
```bash
make test
```
