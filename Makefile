DOCKERIMAGE=jk4ger/gitstats:local
DOCKERFILE=Dockerfile
OUTDIR=./out

image:
	docker build -t $(DOCKERIMAGE) --progress=plain .

run: image
	docker-compose run gitstats

clean:
	find $(OUTDIR) -mindepth 1 -not -name .gitignore | xargs -l rm -fv

.PHONY: run image clean
