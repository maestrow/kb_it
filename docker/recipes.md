# Docker recipes


- [Docker recipes](#docker-recipes)
- [Oneliners](#oneliners)
- [System](#system)
- [Usefull as command substitution](#usefull-as-command-substitution)
- [Images](#images)
  - [List and filter](#list-and-filter)
  - [Stop & remove all images](#stop--remove-all-images)
  - [See docker image contents without running](#see-docker-image-contents-without-running)
- [Run image](#run-image)
  - [Override cmd when running image](#override-cmd-when-running-image)
  - [How to copy Docker images from one host to another without using a repository](#how-to-copy-docker-images-from-one-host-to-another-without-using-a-repository)
- [Containers](#containers)
  - [ps, format](#ps-format)
    - [export container to tar](#export-container-to-tar)
    - [list tar content](#list-tar-content)
  - [How to start a stopped Docker container with a different command (entrypoint)](#how-to-start-a-stopped-docker-container-with-a-different-command-entrypoint)
  - [Network: Access to Host](#network-access-to-host)
  - [Logs](#logs)
  - [Run some code in container](#run-some-code-in-container)
- [Volumes](#volumes)
- [Private registry](#private-registry)
  - [API](#api)
    - [View Images](#view-images)
- [Best practices](#best-practices)
  - [Use temporary dependencies](#use-temporary-dependencies)

# Oneliners

- docker cp <containerId>:/file/path/within/container /host/path/target
- docker inspect --format='{{index .RepoDigests 0}}' $IMAGE # get image sha256


# System

```sh
docker system df
serice docker {start|stop|restart}
journalctl -fu docker
```

# Usefull as command substitution

```sh
docker ps -aq                           # list container IDs
docker ps -aqf 
    "name=<container_name>"  # get container ID by name
    status=exited
```


# Images

- https://stackoverflow.com/questions/45142528/what-is-a-dangling-image-and-what-is-an-unused-image

## List and filter

Sourse: https://stackoverflow.com/questions/24659300/how-to-use-docker-images-filter

`-f, --filter value`

Filter output based on conditions provided (default [])
- dangling=(true|false)
- label=<key> or label=<key>=<value>
- before=(<image-name>[:tag]|<image-id>|<image@digest>)
- since=(<image-name>[:tag]|<image-id>|<image@digest>)
- reference=(pattern of an image reference)

Samples:

    docker image ls --filter reference=vsc*


## Stop & remove all images

```sh
docker image prune -a # -a removes all unused images, without it Docker only removes dangling (untagged) images
docker ps -aq                  # List all containers (only IDs)
docker stop $(docker ps -aq)   # Stop all running containers
docker rm $(docker ps -aq)     # Remove all containers
docker rm $(docker ps -a -q -f status=exited)
docker container prune         # same as prev
docker rmi $(docker images -q) # Remove all images
```

## See docker image contents without running

source: https://stackoverflow.com/questions/44769315/how-to-see-docker-image-contents/44769468

docker cp

# Run image

## Override cmd when running image

    docker run -it --entrypoint=/bin/bash $IMAGE

## How to copy Docker images from one host to another without using a repository

```
docker save -o <path_for_generated_tar_file> <image_name>
docker load -i <path_to_image_tar_file>
```
source: https://stackoverflow.com/questions/23935141/how-to-copy-docker-images-from-one-host-to-another-without-using-a-repository


# Containers

## ps, format

    docker ps --no-trunc --format "table {{.Command}}"
    docker ps -a --no-trunc --filter name=^/foo$

### export container to tar

    docker create --name="tmp_$$" image:tag
    docker export tmp_$$ | tar t
    docker rm tmp_$$

### list tar content

    docker export $(docker ps -lq) | tar tf -

## How to start a stopped Docker container with a different command (entrypoint)

```sh
docker ps -a  # Find your stopped container id
docker commit $CONTAINER_ID user/test_image
docker run -ti --entrypoint=sh user/test_image
```

source: https://stackoverflow.com/questions/32353055/how-to-start-a-stopped-docker-container-with-a-different-command

## Network: Access to Host

- https://stackoverflow.com/questions/31324981/how-to-access-host-port-from-docker-container
- https://docs.docker.com/docker-for-mac/networking/#use-cases-and-workarounds Special DNS name `host.docker.internal`, which resolves to the internal IP address used by the host. This applied to macOS and Windows only, in linux there is only [feature request](https://github.com/docker/for-linux/issues/264).

## Logs

```sh
docker inspect --format='{{.LogPath}}' $INSTANCE_ID
docker inspect --format='{{.LogPath}}' $(docker ps -aq) | xargs du -ah
docker inspect --format='{{.LogPath}}' $(docker ps -aqf "name=container_name") | xargs du -ah
```

- [Setup log rotation](https://success.docker.com/article/how-to-setup-log-rotation-post-installation)

## Run some code in container

docker run -ti -v "$PWD":/app -w /app golang:1.11-alpine go run bigfile.go


# Volumes

Create persistent volume:
```sh
docker volume create \
	--driver local \
	--opt type=none \
	--opt device=$PWD/grav \
	--opt o=bind \
	--name sprintschool-grav
```


# Private registry

## API

### View Images

https://docs.docker.com/registry/spec/api

Examples:
- https://example.com/v2/_catalog
- https://example.com/v2/image_name/tags/list


# Best practices

## Use temporary dependencies

```dockerfile
RUN apk add --no-cache git mercurial \
    && go get github.com/random/library/that/I/use/ \
    && apk del git mercurial
```

Source: https://github.com/docker-library/golang/issues/80#issuecomment-174085707








