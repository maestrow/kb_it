## How to print during Rust tests?

source: https://medium.com/@ericdreichert/how-to-print-during-rust-tests-619bdc7ccebc

By default, output from print statements (e.g. println!, print!) will be eaten (not printed to stdout) by the Rust test harness.

To see the output from print statements, run the tests with the nocapture flag.

    cargo test -- --nocapture

or

    rustc --test main.rs; ./main

or (my favorite)

    cargo watch "test -- --nocapture"

You must use the double, double hyphens with cargo test. It’s not a typo.

See http://stackoverflow.com/questions/25106554/println-doesnt-work-in-rust-unit-tests for more information.
