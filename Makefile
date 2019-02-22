IMAGE_NAME="alpine-trj"
TAG="latest"
CONTAINER_NAME="alpine-trj"

.PHONY: all build

all: build

build:
	docker build --tag "octupole/${IMAGE_NAME}:${TAG}" .

start:
	docker run --rm -it \
		"octupole/${IMAGE_NAME}:${TAG}" 

term:
	docker exec -it ${CONTAINER_NAME} /bin/bash


stop:
	docker kill ${CONTAINER_NAME}
