
```
echo $SHELL
cat /etc/shells
cat /etc/passwd   # last fiels is shell
chsh              # CHange SHell
```

## Run until success

    until passwd; do echo "Try again"; sleep 2; done


## sudo bash -c

history | tail -n 3 | sudo bash -c "cp /dev/stdin readme.txt"


## Unsorted

```bash
tool=$1
args=${@:2}

echo $tool
echo $args
```

## Args

file `manage`

```bash
#!/usr/bin/env bash

function run {
  local _action=$1
  local "${@:2}"
  local mbr=${mbr:-$outDir/mbr.bin}
  local efi=${efi:-$outDir/efi.bin}

  echo $_action
  echo $mbr
  echo $efi
}

run "${@}"
```

Usage: 

`./manage go mbr=123` 

OR

`source ./manage`, then `run do_something efi=123`

```bash
#!/usr/bin/env bash
source ${1:-".env"}
```