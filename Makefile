.PHONY: build
build:
	docker buildx build . -t aoirint/julius

CMD=bash
.PHONY: run
run:
	docker run --rm -it aoirint/julius $(CMD)

.PHONY: example
example:
	docker run --rm -it -v "$(PWD)/data:/data" aoirint/julius bash -c '../julius/julius/julius -C julius.jconf -dnnconf dnn.jconf -logfile /data/log.txt -outfile | tee /data/stdout.txt && mv julius-dnn-output.txt mozilla.out /data/'
