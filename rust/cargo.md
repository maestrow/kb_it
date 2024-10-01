## Cargo common commands

- build your project with `cargo build`
- run your project with `cargo run`
- test your project with `cargo test`
- build documentation for your project with `cargo doc`
- publish a library to crates.io with `cargo publish`
- To test that you have Rust and Cargo installed, you can run this in your terminal of choice: `cargo --version`
- `cargo add` adds lib dependency to porject


source: https://www.rust-lang.org/learn/get-started


```sh
cargo add $crate --features "feature1 feature2"
```

## Test

```sh
cargo test -- --list
cargo test --features full
cargo test -- --nocapture
```
