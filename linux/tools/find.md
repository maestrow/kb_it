# find

- https://www.baeldung.com/linux/find-exec-command

    find /home/username/ -name "_.err" # searches for _.err files in the /home/username/ and all sub-directories.

[Exclude directories from search](https://stackoverflow.com/questions/4210042/how-to-exclude-a-directory-in-find-command)

    find / \( -path /c -o -path /x -o -path /z \) -prune -o -name '*.js' -print 2>/dev/null

To not to print service messages use `2>/dev/null` redirect.

    find -L . -type d -name nodes # follow symlinks
    find ~/projects -path "*/trunk*/config/*.xml"   # https://unix.stackexchange.com/questions/76200/how-to-find-files-with-a-certain-subpath
    find ... | xargs grep 'search'

## Options

```bash
-type d  # directory
```

## See Also

- [fd](./fd.md)

## Resources

- https://hamwaves.com/find/en/index.html