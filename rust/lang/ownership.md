Concepts explaining in this article:
- Borrowing
- Moving
- Immutable binding
- Mutable
- Immutable and mutable References

In Rust, you can have either one mutable reference or multiple immutable references to a piece of data at a time. This is enforced by the borrow checker to prevent data races.


Owbership rules:
- Each value has a variable that is called it's owner
- There could be one owner at a time.
- When the owner goes out of scope, the value is dropped.

Passing a references as function parameters is called borrowing. 

Mutable references have a big restriction: You can only have one mutable reference to a particular piece of data in a particular scope. 