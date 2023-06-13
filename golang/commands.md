## Modules

`go mod init <name>`

## `Go` command line tool

- `go get`
- `go get -d ./...` - install all dependencies.
- `go build && ./<executable>` - build & run.
- `go run .` - run current app.
- `gofmt -s -w .`

### Build

Define target by the source folder

    go build .

Define target by the module name

    go build hello

Define target by the main file

    go build hello.go