- /etc/environment
- /usr/bin/env
- `source script.sh` or `. script.sh`
- export NAME=value   # for session only

[1]: https://wiki.debian.org/EnvironmentVariables

# Recipes

## To load environment from file

### `set -o allexport; source .env; set +o allexport`

source: https://gist.github.com/mihow/9c7f559807069a03e302605691f85572

### export $(cat .env | xargs) && <cmd>

```
export $(cat .env | xargs) && rails c
export $(grep -v '^#' .env | xargs -d '\n')
```

source: https://stackoverflow.com/questions/19331497/set-environment-variables-from-file-of-key-value-pairs/19331521

