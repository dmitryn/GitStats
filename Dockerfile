# alpine:3.15 is the last version where the package python2 is still available.
FROM alpine:3.15

# Avoid issues with printing to stdout/stderr in Docker containers.
# See: https://github.com/Docker-Hub-frolvlad/docker-alpine-python3/pull/13
ENV PYTHONUNBUFFERED=1

RUN apk update && \
    apk add --no-cache \
      git  \
      gnuplot \
      python2 && \
    rm -rfv /var/cache/apk/* && \
    python --version

WORKDIR /app
COPY . .

ENV REPO_DIR=/repo
ENV OUT_DIR=/out

RUN git config --global --add safe.directory $REPO_DIR
ENTRYPOINT exec python -u git-stats $REPO_DIR $OUT_DIR
