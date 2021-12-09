# Defining a Bash Variable With or Without `export`

source: https://www.baeldung.com/linux/bash-variables-export

```sh
$ MYVAR=1729
$ export MYVAR=1729
```
The first definition creates a variable named MYVAR and assigns it the value 1729. This is a shell variable.
The second definition with the export command is another way of defining a variable. It creates a variable named MYVAR, assigns it the value 1729, and marks it for export to all child processes created from that shell. This is an environment variable.

