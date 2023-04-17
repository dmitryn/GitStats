#!/bin/bash
set -eu -o pipefail

#git config --global --add safe.directory "$REPO_DIR"

cd "$REPO_DIR"
exec python -u git-stats "$REPO_DIR" "$OUT_DIR"
