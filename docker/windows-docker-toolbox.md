
## Docker toolbox Windows issues

- https://blog.sixeyed.com/published-ports-on-windows-containers-dont-do-loopback/
- https://github.com/docker/toolbox/issues/433
- https://github.com/docker/for-win/issues/204
- https://docs.docker.com/docker-for-windows/networking/

## Сеть

Пример запуска образа с веб-сервером и обращение к нему из хоста:

- `docker run --name webserver -d -p 8080:80`
- Get machine ip using `docker-machine ls` or `docker-machine ip`
- In host: `http://<machine_ip>:8080`

