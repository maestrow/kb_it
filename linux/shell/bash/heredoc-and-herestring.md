Resources:
- https://www.youtube.com/watch?v=UAD1v3t7eqo Output, Assign, Pipe and Redirect a Heredoc in a Shell Script


## Here document

`<< here document`

```sh
$ wc << EOF
> one two three
> four five
> EOF
 2  5 24
```

### Preventing variables substitution

In Bash, you can prevent environment variable substitution within a here document by quoting the delimiter. When you quote the delimiter, Bash will treat the here document as a single-quoted string, thus preventing variable substitution.

```sh
cat << 'EOF'
This is a here document.
$HOME will not be substituted.
EOF
```

In this example, $HOME will not be substituted because the delimiter EOF is quoted.


## Here string

`<<< here string`

```sh
bc <<< 5*4
```

Here string adds trailing new line (see [Why does a bash here-string add a trailing newline char?](https://unix.stackexchange.com/questions/20157/why-does-a-bash-here-string-add-a-trailing-newline-char)).

```sh
xxd -p <<<'a'
```

output: 610a

```sh
xxd -p <<<'a
'
```

output: 610a0a