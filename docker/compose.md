# docker compose

- https://docs.docker.com/compose/environment-variables/

## Convenient way to debug env variable in Docker Compose

```yaml
version: "3.3"
services:
  shell:
    image: ubuntu
    command: echo "APP_PORT = $APP_PORT"
```

`docker compose up shell`
