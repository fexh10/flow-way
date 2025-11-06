#import "../src/lib.typ": *

#show: flow.with(
  title: "Flow-Way Template",
  subtitle: "A simple Typst template",
  author: "Fernando H. Gavezzotti",
  affiliation: "My Company",
  year: 2025
)

= Introduction

This is a sample document demonstrating the Flow-Way template. 

The title of the current section is displayed in the header of each page.

== Lists

The lists are styled according to the main colour of the template, that you can customize.

- First item
- Second item
- Third item

+ First item
+ Second item
+ Third item

== Code

Here is an example of inline code: `let x = 10`. For code blocks:

```rs
fn main() {
  println!("Hello, world!");
}
```

== Images

Here is an example of an image included in the document:

#figure(
  image("../assets/rick-astley.jpg", width: 8cm),
  caption: [Rickrolled]
)<rickrolled>