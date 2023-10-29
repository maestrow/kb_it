#!/usr/bin/env bash

# Usage: 
#     ./manage.sh walk mbr=123
# OR
#     source ./manage
#     sleep efi=qwe

function walk {
  echo "Current function: ${FUNCNAME[0]}"
  local "${@}"
  local mbr=${mbr:-$outDir/mbr.bin}
  local efi=${efi:-$outDir/efi.bin}

  echo $mbr
  echo $efi
}

function sleep {
  echo "Current function: ${FUNCNAME[0]}"
  local "${@}"
  local mbr=${mbr:-$outDir/mbr.bin}
  local efi=${efi:-$outDir/efi.bin}

  echo $mbr
  echo $efi
}

function run {
  local action=$1
  $action ${@:2}
}

run ${@}