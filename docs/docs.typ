#import "@preview/tidy:0.4.3"
#import "../src/lib.typ"

#show heading.where(level: 1): set text(rgb("#239DAD"))

#set text(size: 13pt)

#show raw.where(block: true): it => {
    block(
      fill: luma(93%),
      inset: 10pt,
      radius: 4pt, 
      width: 100%,
      text(it)
    )
  }

#align(center, heading(level: 1, outlined: false)[Flow-Way Template Documentation])

#outline()

= Introduction

Flow-Way is a modern and clean Typst template designed for writing documents, reports or notes. The front page features a sleek design with customizable colors and an optional logo.
Each page header displays a line with the title of the current section, enhancing navigation throughout the document.

= API Reference

#let module = tidy.parse-module(
  read("/src/lib.typ"),
  name: "flow-way",
  scope: (flow: lib)
)

#tidy.show-module(module, style: tidy.styles.default)

= Fonts

The template uses the following fonts:

- *Source Sans Pro* for the body.
- *Barlow* for headings.
- *CMU Typewriter Text* for inline code and code blocks.

The fonts are available under the OFL license and you can find them under the `fonts` directory of the repository.

