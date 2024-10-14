#let project(title: "", abstract: [], author: "", date: none, body) = {
  set document(author: author, title: title)

  set page(
    margin: (left: 25mm, right: 25mm, top: 25mm, bottom: 30mm),
    numbering: "1",
    number-align: center,
  )

  set text(font: "New Computer Modern", lang: "it")

  set heading(numbering: "1.1")

  show math.equation: set text(weight: 400)
  show math.equation: set block(spacing: 0.65em)

  line(length: 100%, stroke: 2pt)

  pad(
    bottom: 4pt,
    top: 4pt,
    align(center)[
      #block(text(weight: 500, 1.75em, title))
      #v(1em, weak: true)
    ],
  )

  line(length: 100%, stroke: 2pt)

  pad(
    top: 0.5em,
    x: 2em,
    align(center)[
      #block(text(weight: 500, 1.25em, author))
    ],
  )

  align(center)[#date]

  pad(
    x: 3em,
    top: 1em,
    bottom: 0.4em,
    align(center)[
      #heading(
        outlined: false,
        numbering: none,
        text(0.85em, smallcaps[Abstract]),
      )
      #set par(justify: true)
      #set text(hyphenate: false)

      #abstract
    ],
  )

  line(length: 100%, stroke: 2pt)
  v(24pt)

  set par(justify: true)
  set text(hyphenate: false)

  body
}
