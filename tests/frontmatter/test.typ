// test/cover-and-toc.typ
#import "/src/lib.typ": *

#show: flow.with(
  title: "Document title",
  subtitle: "Subtitle",
  authors: ("John Smith", "Jane Doe", "Robert Johnson"),
  affiliation: "University of Technology",
  year: 2024,
  logo: circle(radius: 1.5cm, fill: black),
  toc: true,
  toc-depth: 1,
  breaks: true
)

= Introduction
#lorem(50)

== Background
#lorem(200)

= Literature Review
#lorem(60)

== Previous Studies
#lorem(45)
  

