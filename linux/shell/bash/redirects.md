# Redirects

## Output 

Sources: 
- https://askubuntu.com/questions/350208/what-does-2-dev-null-mean
- https://stackoverflow.com/questions/24793069/what-does-do-in-bash

    > file redirects stdout to file
    1> file redirects stdout to file
    2> file redirects stderr to file
    &> file redirects stdout and stderr to file

to
- &1 - to stdin
- &2 - to stderr

Example: 2>&1 - stderr to stdout


Use `>>` to append

`/dev/null` is the null device it takes any input you want and throws it away. It can be used to suppress any output.

## Input

### Here document

<< here document
```sh
$ wc << EOF
> one two three
> four five
> EOF
 2  5 24
```

### Here string

<<< here string
```sh
bc <<< 5*4
```

Here string adds trailing new line (see [Why does a bash here-string add a trailing newline char?](https://unix.stackexchange.com/questions/20157/why-does-a-bash-here-string-add-a-trailing-newline-char)).

xxd -p <<<'a'  
# output: 610a

xxd -p <<<'a
'
# output: 610a0a
