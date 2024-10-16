#let project(title: "", abstract: [], author: "", body) = {
  set document(author: author, title: title)

  set page(
    margin: (left: 25mm, right: 25mm, top: 25mm, bottom: 25mm),
    numbering: "1",
    number-align: center,
  )

  set text(font: "New Computer Modern", lang: "it")

  set heading(numbering: "1.")

  line(length: 100%, stroke: 2pt)

  pad(
    bottom: 4pt,
    top: 4pt,
    align(center)[
      #block(text(1.75em, title))
      #v(1em, weak: true)
    ],
  )

  line(length: 100%, stroke: 2pt)

  pad(
    top: 0.5em,
    x: 2em,
    align(center)[
      #block(text(1.25em, author))
    ],
  )

  align(center)[#datetime.today().display("[day]-[month]-[year]")]

  pad(
    x: 3em,
    top: 1em,
    bottom: 0.4em,
    align(center)[
      #heading(
        outlined: false,
        numbering: none,
        text(1em, smallcaps[Abstract]),
      )
      #set par(justify: true)
      #set text(hyphenate: false)

      #abstract
    ],
  )

  line(length: 100%, stroke: 2pt)
  v(12pt)

  set par(justify: true)
  set text(hyphenate: false)

  body
}
