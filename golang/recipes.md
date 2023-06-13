- https://matt.aimonetti.net/posts/2013-07-golang-multipart-file-upload-example/


## Update golang to new version

source:  [How to update the Go version](https://gist.github.com/nikhita/432436d570b89cab172dcf2894465753)

```console
$ go version
go version go1.16.6 linux/amd64

$ which go
/usr/local/go/bin/go

$ sudo rm -rf /usr/local/go
$ wget https://go.dev/dl/go1.19.linux-amd64.tar.gz
$ sudo tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz

# Make sure that your PATH contains /usr/local/go/bin
$ echo $PATH | grep "/usr/local/go/bin"

# If not, add it to `~/.bashrc`: `export PATH=$PATH:/usr/local/go/bin`

$ go version
go version go1.19 linux/amd64
```
