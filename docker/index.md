## Common

```
images
stats
ps 
  -a - all
  -q - quet - show only ID
  -f filter
start $container
stop $container
rename $image <new-name> 
inspect $image
run <opts> $image <cmd>
  --rm
  -d
  --name
  -p host:container
  -t
  -i
  --entrypoint
  -v host:container
port $container

```

## Build

- `docker image build -t name:tag .` build
- When you issue a docker build command, the current working directory is called the build context.
- [.dockerignore](https://docs.docker.com/engine/reference/builder/#dockerignore-file)

### Cache

`docker build --no-cache=true`


### Layers

- Only the instructions RUN, COPY, ADD create layers.

## Run

```sh
-p, --publish list
--name string
-d, --detach
```


## docker-machine

- Get machine ip using `docker-machine ls` or `docker-machine ip`


## Ports mapping

- `docker run -p 8000:80 -d nginx` The syntax for -p is HostPort:ContainerPort

Example: run webserver in container and request it from host:

- `docker run --name webserver -d -p 8080:80`
- In host: `http://<machine_ip>:8080`
