- https://code.visualstudio.com/docs/remote/devcontainerjson-reference
- https://code.visualstudio.com/docs/remote/devcontainer-cli
- https://github.com/microsoft/vscode-remote-try-php

## Build

source: https://code.visualstudio.com/docs/remote/devcontainer-cli#_building-a-dev-container-image

Avoiding problems with images built using Docker:
> In order for your dev container to build properly, it may need to be built by the dev container CLI, the Remote - Containers extension, or in a GitHub Codespace, rather than a manual user build with Docker. 



## VSCode: How to open folder in container using command line?

Sources:
- https://stackoverflow.com/questions/60379221/how-to-attach-a-remote-container-using-vscode-command-line/64929306#64929306
- https://stackoverflow.com/questions/60861873/is-there-a-way-to-open-a-folder-in-a-container-from-the-vscode-command-line-usin

### Shell script

```bash
#!/usr/bin/env bash

case $# in
1) ;;
*) echo "Usage: code-remote-container <directory>"; exit 1 ;;
esac

dir=`echo $(cd $1 && pwd)`
hex=`printf ${dir} | od -A n -t x1 | tr -d '[\n\t ]'`
base=`basename ${dir}`
code --folder-uri="vscode-remote://dev-container%2B${hex}/workspaces/${base}"
```

I have saved it under the name `code-remote-container`, which then e.g. can be used as: `code-remote-container .`

### One-liner

Here's a one-liner to open the current directory in a remote container. The `--folder-uri` is constructed from the hex-encoded directory path `pwd | tr -d '\n' | xxd -p` and the directory name `basename "$(pwd)"`.

`code --folder-uri="vscode-remote://dev-container+$(pwd | tr -d '\n' | xxd -p)/workspaces/$(basename "$(pwd)")"`