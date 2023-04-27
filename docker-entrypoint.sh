#!/bin/bash
set -eu -o pipefail

bailout() {
  echo "ERROR: $1" >&2
  exit 1
}

REPO_DIR="${REPO_DIR:-}"
OUT_DIR="${OUT_DIR:-}"

if [ ! -d "$REPO_DIR" ]; then
  bailout "Invalid repository directory \"$REPO_DIR\"."
fi

if [ ! -w "$OUT_DIR" ]; then
  bailout "Invalid output directory \"$OUT_DIR\"."
fi

cd "$REPO_DIR"
exec python -u /app/git-stats "$REPO_DIR" "$OUT_DIR"
