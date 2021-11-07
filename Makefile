.PHONY: build
build:
	docker buildx build . -t aoirint/julius

.PHONY: run
run:
	docker run --rm -it aoirint/julius julius $(O)
