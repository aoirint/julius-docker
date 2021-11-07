.PHONY: build
build:
	docker buildx build . -t aoirint/julius

FILE=
.PHONY: recognize-file
recognize-file:
ifeq ($(FILE),)
	@echo "Usage: make recognize-file FILE=<path>"
	@exit 1
endif
	docker run --rm aoirint/julius julius -v
