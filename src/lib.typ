#let flow(
  title: "",
  subtitle: none,
  author: "",
  affiliation: none,
  year: none,
  logo: none,
  lang: "en",
  toc: false,
  toc-depth: none,
  breaks: false,
  main-color: "003F88",
  alpha: 60%,
  body,
) = {
  // fonts used
  let body-font = "Source Sans Pro"
  let title-font = "Barlow"
  let code-font  = "CMU Typewriter Text"
  //colors
  let primary-color = rgb(main-color)
  let secondary-color = color.mix(color.rgb(100%, 100%, 100%, alpha), primary-color, space:rgb)

  // set up document styles
  set document(author: author, title: title)
  set text(font: body-font, 12pt, lang: lang)
  set heading(numbering: "1.")
  set enum(indent: 1em, numbering: n => [#text(fill: primary-color, numbering("1.", n))])
  set list(indent: 1em, marker: n => [#text(fill: primary-color, "•")])
  set figure.caption(separator: [ --- ], position: bottom)

  // inline code
  show raw.where(block: false): set text(font: code-font)
  // code blocks
  show raw.where(block: true): it => {
    block(
      fill: luma(93%),
      inset: 10pt,
      radius: 4pt, 
      width: 100%,
      text(font: code-font, it)
    )
  }
  // headings
  show heading.where(level:1): it => {
    if breaks {
      pagebreak(weak: true)
    }
    it + v(0.5em)
  }
  show heading: set text(font: title-font, fill: primary-color)
  // links
  show link: it => underline(text(fill: primary-color, it))

  if logo != none {
    set image(width: 6cm)
    place(top + right, logo)
  }
  
  //cover
  place(top + left, dx: -200pt, dy: 80pt)[
    #rotate(-25deg)[
      #ellipse(width: 400pt, height: 300pt, fill: secondary-color.transparentize(88%))
    ]
  ]
  
  place(bottom + right, dx: 150pt, dy: -100pt)[
    #rotate(20deg)[
      #ellipse(width: 450pt, height: 350pt, fill: secondary-color.transparentize(90%))
    ]
  ]
  
  v(2fr)
  align(center, text(font: title-font, 3em, weight: 700, title))
  v(2em, weak: true)
  if subtitle == none {
    align(center)[
      #ellipse(width: 150pt, height: 3pt, fill: primary-color)
    ]
    v(2em, weak: true)
  } else {
    align(center, text(font: title-font, 2em, weight: 700, subtitle))
    v(2em, weak: true)
    align(center)[
      #ellipse(width: 150pt, height: 3pt, fill: primary-color)
    ]
    v(2em, weak: true)
  }
  v(2fr)

  align(center)[
      #if author != "" {strong(author); linebreak();}
      #if affiliation != none {affiliation; linebreak();}
      #if year != none {str(year); linebreak();}
    ]

  pagebreak()

  set page(
    numbering: "1",
    header: context {
      let elems = query(
        heading.where(level: 1)
      )
      let loc = here()
      let filtered = elems.filter(h => h.location().page() <= loc.page())
      let current = if filtered.len() > 0 { filtered.last() } else { none }
      if current != none {
        align(right, emph(current.body))
        v(-0.7em) 
        line(length: 100%, stroke: 0.5pt + black)
      }
    }
  )

  if toc {
    outline(depth: toc-depth)
  }

  body 
}