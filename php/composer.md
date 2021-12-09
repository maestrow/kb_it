https://getcomposer.org/


docker run --rm -ti --entrypoint bash --volume $PWD:/app composer

## composer CLI

Commands:
- `init` Creates a basic composer.json file in current directory.
- `require` Adds required packages to your composer.json and installs them.
- `install [--no-dev]` Installs the project dependencies from the composer.lock file if present, or falls back on the composer.json.
- `update [--no-dev]` Upgrades your dependencies to the latest version according to composer.json, and updates the composer.lock file.

## `composer.json`

- `require-dev` section. Lists packages required for developing this package, or running tests, etc. The dev requirements of the root package are installed by default. Both `install` or `update` support the `--no-dev` option that prevents dev dependencies from being installed.

