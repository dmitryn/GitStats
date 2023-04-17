# alpine:3.15 is the last version where the package python2 is still available.
FROM alpine:3.15

# Avoid issues with printing to stdout/stderr in Docker containers.
# See: https://github.com/Docker-Hub-frolvlad/docker-alpine-python3/pull/13
ENV PYTHONUNBUFFERED=1

RUN apk update && \
    apk add --no-cache \
      bash \
      git \
      gnuplot \
      python2 \
      tini && \
    rm -rfv /var/cache/apk/* && \
    python --version

WORKDIR /app
COPY . .

ENV REPO_DIR=/repo
ENV OUT_DIR=/out

ENTRYPOINT tini -- ./docker-entrypoint.sh
