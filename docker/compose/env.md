# Ways to set environment variables in Compose

Source: https://docs.docker.com/compose/environment-variables/

## Env vars substitutions

- Substitution from docker compose environment is a `docker compose` CLI feature.
- Variables, used in `docker-compose.yml` file and in `.env` files, specified by `env_file` directive will gets their values from shell environment where `docker compose up` command was executed.
- We can set `docker compose` shell environment variables in 3 ways:
  - Directly in shell. `export MYVAR=1` or `MYVAR=1 docker compose up`
  - By default, `.env` file used.
  - It is possible to spesify several files for substitutions via `--env-file` option, like this: `docker compose --env-file .env1 --env-file .env2`
- `docker compose` environment is not passed to containers, but you can use substitutions feature.

Example of docker-compose.yml, having variable inside

```bash
$ cat .env
TAG=v1.5

$ cat compose.yml
services:
  web:
    image: "webapp:${TAG}"
```

# Convenient way to debug env variable in Docker Compose

```yaml
version: "3.3"
services:
  shell:
    image: ubuntu
    command: echo "APP_PORT = $APP_PORT"
```

`docker compose up shell`

`docker compose config` which will show the exact docker compose configuration with all environment variables substituted. Usefull when you use different ways to provide env variables (env_file and environment options). It mentioned here: https://docs.docker.com/compose/environment-variables/set-environment-variables/

