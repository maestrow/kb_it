- https://medium.com/@khorlee/dependency-management-in-go-lang-using-go-commands-7900a7b2f760
  - go list -m all
  - update:
    - go get <package-name>
    - go get <package-name>@latest


- go mod edit -go=1.16
- go mod tidy

## `go mod tidy` 

This command go through the go.mod file to resolve dependencies:

delete the package that are not needed
download those needed
update the go.sum

source: https://stackoverflow.com/questions/67203641/missing-go-sum-entry-for-module-providing-package-package-name
