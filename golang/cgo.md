## C header files

Компилятору go можно указать пути, по которым искать заголовочные файлы. 
https://stackoverflow.com/questions/38381357/how-to-point-to-c-header-files-in-go

Pass the -I flag to the C compiler using the CGO_CFLAGS environment variable: `CGO_CFLAGS="-I/usr/include/hdf5s/series"`.

### ld linker flags

[ld-flags]: https://forum.golangbridge.org/t/cflags-ldflags-documentation-somewhere/4520/2
[ld-names]: https://unix.stackexchange.com/questions/228886/gcc-ld-cannot-find-lc
[ld-man]: https://linux.die.net/man/1/ld

So, where is the documentation for `CFLAGS` and `LDFLAGS`? It is part of the `c` compiler documentation where command line options are described. Which c compiler? Run `go env` and look for `CC` (c compiler). [source][ld-flags].

See [ld linker manpage][ld-man], look for `-l` and `-L` flags.

Директива `#cgo linux LDFLAGS:-lOpenCL` указывает на то, что линкер `ld` должен быть вызван с флагом `-lOpenCL`.  You need the package that provides `libOpenCL.a` or `libOpenCL.so` ([source][ld-names]). Можно найти пакет, который содержит данный файл: `apt-file search libOpenCL.so`