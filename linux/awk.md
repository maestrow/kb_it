
## command line

```
awk [options] 'program' [file1] [file2 ...]
awk [options] -f program-file [file1] [file2 ...]
```

Options:
-F fs - field separator
-v var=val - variables

### Examples

Use variable:

    awk -v sq="'" 'BEGIN { print "Here is a single quote <" sq ">" }' # use variable

Single dash (-) in file list means `stdin`. First reads file1, then it reads the output of some_command, and finally it reads file2:

    some_command | awk -f myprog.awk file1 - file2

## AWK Program

```
pattern { action }
pattern { action }
…
```

An action without a pattern always runs. The default action for a pattern without one is ‘{ print }’.


- `#! /bin/awk -f` - for executable awk.
- `@include "test1"` to include other script into program

## Syntax

```
# - comment
\47 = '
\42 = "
```

gawk ignores newlines after any of the following symbols and keywords:
, { ? : || && do else
A newline at any other point is considered the end of the statement.

awk '/This regular expression is too long, so continue it\
 on the next line/ { print $1 }'

You can place rules in one line and split them with semicolon (;).

