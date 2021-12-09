## There is no pass-by-reference in Go

> There is no pass-by-reference in Go
My post on pointers provoked a lot of debate about maps and pass by reference semantics. This post is a response to those debates.
To be clear, Go does not have reference variables, so Go does not have pass-by-reference function call semantics.

Source: https://webcache.googleusercontent.com/search?q=cache:if6zs_wNU-cJ:https://dave.cheney.net/2017/04/29/there-is-no-pass-by-reference-in-go+&cd=2&hl=en&ct=clnk&gl=ru

Unlike C++, each variable defined in a Go program occupies a unique memory location.

It is not possible to create a Go program where two variables share the same storage location in memory. It is possible to create two variables whose contents point to the same storage location, but that is not the same thing as two variables who share the same storage location.

## Are Golang function parameter passed as copy-on-write?

- https://stackoverflow.com/questions/33995634/are-golang-function-parameter-passed-as-copy-on-write
