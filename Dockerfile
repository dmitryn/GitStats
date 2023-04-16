# alpine:3.15 is the last version where the package python2 is still available.
FROM alpine:3.15

# This hack is widely applied to avoid python printing issues in docker containers.
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

RUN git config --global --add safe.directory /repo
ENTRYPOINT exec python -u git-stats /repo /out
