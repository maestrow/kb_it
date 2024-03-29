- https://www.youtube.com/watch?v=ZtqBQ68cfJc
- https://www.freecodecamp.org/news/the-linux-commands-handbook/

- [read](https://www.computerhope.com/unix/bash/read.htm)
- cut


## Files & Directories

```sh
pwd
echo "$PWD"
stat $filename
md5sum $file # md5 checksum
```

get full path of a file:
```sh
type $file
which $file
readlink -f $file # 
```

Remove all from current dir: `rm -rf ..?* .[!.]* *`. source: https://unix.stackexchange.com/questions/77127/rm-rf-all-files-and-all-hidden-files-without-error

## Run as super user

```
su
sudo <cmd>
sudo -u <user> <cmd>
```

## Files

stat \$FILE
stat -c "%a %n" \*

file \$FILE

readlink -f file.txt # get full path to file

### ls

#### ls -l Long Output Format

Source: https://www.mkssoftware.com/docs/man1/ls.1.asp

    drw-rw-rw- owner group size date
    | |  |  |
    | +--+--+-- permissions: owner group others
    +- type 

    type:
    -    Regular file
    b    Block special file
    c    Character special file
    d    Directory
    l    Symbolic link
    n    Network file
    p    FIFO
    s    Socket

    permissions:
    rwx  owner
    rwx  group
    rwx  other users
    r    Permission to read file
    w    Permission to write to file
    x    Permission to execute file
    a    Archive bit is on (file has not been backed up)
    c    Compressed file
    s    System file
    h    Hidden file
    t    Temporary file


### grep

Q: How to grep from stderr? A: You can redirect stderr to stdin using [2>&1](https://stackoverflow.com/questions/818255/in-the-shell-what-does-21-mean):

    docker logs nginx 2>&1 | grep "127."

### Text files

sed -i -e 's/\r$//' $FILE # Remove the spurious CR characters

## Processes

ps aux | grep -i nginx
pgrep nginx

## ZIP

unzip

## curl

https://ec.haxx.se/ Everything curl is an extensive guide for all things curl. The project, the command-line tool, the library, how everything started and how it came to be the useful tool it is today.