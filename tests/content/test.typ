// test-content.typ
#import "/src/lib.typ": *

// Minimal cover, testing all content formatting features
#show: flow.with(
  title: "Content Test"
)
= Inline Code Testing

This is inline code: `let x = 42`.

= Code Blocks

```rust
fn main() {
  let numbers = vec![1, 2, 3, 4, 5];
  let sum: i32 = numbers.iter().sum();
  println!("Sum: {}", sum);
}
```

= Numbered Lists

+ Main item one
  + Sub-item 1.1
  + Sub-item 1.2
+ Main item two
  + Sub-item 2.1
    + Sub-sub-item 2.1.1
  + Sub-item 2.2
+ Main item three

= Bullet Lists

- Main point A
  - Sub-point A.1
  - Sub-point A.2
    - Deep sub-point A.2.1
- Main point B
  - Sub-point B.1
- Main point C


= Links

Direct URL: #link("https://typst.app")

Link with custom text: #link("https://github.com")[Visit GitHub]

Email link: #link("mailto:contact@example.com")

Multiple links in text: Check out #link("https://typst.app")[Typst] and 
#link("https://github.com")[GitHub] for more information.

= Figures and Captions

= Tables as Figures

#figure(
  table(
    columns: 4,
    [*Name*], [*Age*], [*City*], [*Score*],
    [Alice], [28], [New York], [95],
    [Bob], [34], [London], [87],
    [Charlie], [25], [Paris], [92],
    [Diana], [31], [Tokyo], [89]
  ),
  caption: [Sample Data Table]
)

= Headings at Different Levels

Testing the heading numbering system.

== Second Level Heading

Content under second level.

=== Third Level Heading

Content under third level.