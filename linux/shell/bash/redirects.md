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

<< here document
```sh
$ wc << EOF
> one two three
> four five
> EOF
 2  5 24
```

<<< here string
```sh
bc <<< 5*4
```