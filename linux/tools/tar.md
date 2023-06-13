# tar

## Pack

    tar -czvf filename.tar.gz /path/to/dir1
    tar -czvf filename.tar.gz /path/to/dir1 dir2 file1 file2
    tar -czvf archive.tgz *.pdf
    tar -czvf my_directory.tar.gz -C my_directory .


## Unpack

    tar -xvf file.tar
    tar -xzvf file.tar.gz
    tar xzf archive.tar.gz -C /destination

## To view contents of tar file without extracting it

    tar -ztvf my-data.tar.gz
    tar -tvf my-data.tar.gz
    tar -tvf my-data.tar.gz 'search-pattern'


## C option

Unlike most options, `-C` is processed at the point it occurs within the list of files to be processed. Consider the following command: `tar --create --file=foo.tar -C /etc passwd hosts -C /lib libc.a`. `tar -czvf my_directory.tar.gz * -C my_directory` - that does not work. `-C` location is important.

source: https://stackoverflow.com/questions/939982/how-do-i-tar-a-directory-of-files-and-folders-without-including-the-directory-it


## Examples

```
wget -c https://github.com/maestrow/archivist/archive/refs/tags/v1.0.1.tar.gz -O - | tar -xz \
  --strip-components=2 \
  -C admin \
  --wildcards \
  --anchored 'archivist-*/src' \
  --exclude 'archivist-*/src/dev' \
  --exclude 'archivist-*/src/stories'
```