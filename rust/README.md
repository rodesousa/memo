# Rust

# Rules

- Rust always chooses i32 for integers if you don't tell it to use a different type
- u8 can be cast into a char

- Specify a type
```
let a: u8 = 100;
// for integer u can add the type after
let = 100u8;
```

- `usize` is the best index for loop because it can not be negative and u64 can not be use in 32-bit computer

- char is 4 bytes

- When using characters as part of a string, the string is encoded to use the least amount of memory needed for each character.

- float: If you don't write the type, Rust will choose f64.

- print a value
```
println!("Hello, worlds number {} and {}!", 8, 9);
```

- If it had a ; in fn(), it would not return anything (it would return a ()).

- code block

```
    let my_number = {
    let second_number = 8;
        second_number + 9 // No semicolon, so the code block returns 8 + 9.
                          // It works just like a function
    };
```

- `{:?}` for debug and `{}` for display

- let is immutable. To make mutable
```
let mut a = 1;
```

- Shadowing means using let to declare a new variable with the same name as another variable. The old value is not destroyed but blocked. Best pratices: It is only used in a block as a multiple operations

- stack ?

- heap ?

- when you need a lot of character escape, you can use `r#`
```
println!("He said, \"You can find the file at c:\\files\\my_documents\\file.txt.\" Then I found the file.");
println!(r#"He said, "You can find the file at c:\files\my_documents\file.txt." Then I found the file."#)
```

# chap 14
