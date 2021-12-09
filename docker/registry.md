# Official docs

- https://docs.docker.com/registry/
  - https://docs.docker.com/registry/garbage-collection/ `docker exec registry bin/registry garbage-collect --dry-run /etc/docker/registry/config.yml`


# Recipes

## Docker registry cleanup

На машине, где развернут докер репозиторий получаем имя контейнера с репозиторием, получаем расположение хранилища:
```
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                      NAMES
512148d08e07        registry:2          "/entrypoint.sh /etc…"   22 months ago       Up 22 months        127.0.0.1:5000->5000/tcp   registry2

$ docker inspect registry2
...
"Mounts": [
    {
        "Type": "bind",
        ...
    },
    {
        "Type": "volume",
        "Name": "067fc67ad2c9c371577281b84870c9febc4994eeb46dccfb8b6b8a274b25466b",
        "Source": "/var/lib/docker/volumes/067fc67ad2c9c371577281b84870c9febc4994eeb46dccfb8b6b8a274b25466b/_data",
        "Destination": "/var/lib/registry",
        ...
    }
],
...
```

Получаем объем хранилища: `du -h /var/lib/docker/volumes/067fc67ad2c9c371577281b84870c9febc4994eeb46dccfb8b6b8a274b25466b`

Для удаления старых тэгов используем https://github.com/andrey-pohilko/registry-cli

```
./registry.py -l login:pass -r http://127.0.0.1:5000 --order-by-date
./registry.py -l login:pass -r http://127.0.0.1:5000 --order-by-date --delete --dry-run
./registry.py -l login:pass -r http://127.0.0.1:5000 --order-by-date --delete
./registry.py -l login:pass -r http://127.0.0.1:5000 --order-by-date # получаем список после удаления

docker exec registry2 bin/registry garbage-collect --dry-run /etc/docker/registry/config.yml    # сборка мусора
```

Смотрим объем хранилища после удаления: `du -h /var/lib/docker/volumes/067fc67ad2c9c371577281b84870c9febc4994eeb46dccfb8b6b8a274b25466b`   

### Resources

1. [Automate Docker Registry Cleanup](https://betterprogramming.pub/automate-docker-registry-cleanup-3a1af0aa1535) and [repo](https://github.com/wshihadeh/docker-registry)
2. https://github.com/andrey-pohilko/registry-cli
- При удалении тэгов важно правильно применить флаг --order-by-date (если номера тэгов идут не по порядку сортировки, то нужно включить флаг).
