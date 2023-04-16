DOCKERIMAGE=jk4ger/gitstats:local
DOCKERFILE=Dockerfile
OUTDIR=./out

run: image
	docker-compose run gitstats

image:
	docker build -t $(DOCKERIMAGE) --progress=plain .

clean:
	find $(OUTDIR) -mindepth 1 -not -name .gitignore | xargs -l rm -fv

.PHONY: run image clean
