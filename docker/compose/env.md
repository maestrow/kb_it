# Ways to set environment variables in Compose

Source: https://docs.docker.com/compose/environment-variables/

## Substitute with an .env file

```bash
$ cat .env
TAG=v1.5

$ cat compose.yml
services:
  web:
    image: "webapp:${TAG}"
```

Substitution from .env files is a Docker Compose CLI feature! 
You can use env vars only in yaml file, there are will not be available in service container.



# Convenient way to debug env variable in Docker Compose

```yaml
version: "3.3"
services:
  shell:
    image: ubuntu
    command: echo "APP_PORT = $APP_PORT"
```

`docker compose up shell`
