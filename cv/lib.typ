#import "modules.typ": *

// Main configuration function
#let conf(
  author: "",
  paper: "us-letter",
  accent-color: "#000000",
  font: "New Computer Modern",
  font-size: 10pt,
  paragraph-leading: 0.65em,
  paragraph-spacing: 1.2em,
  section-heading-margin-top: 1em,
  section-heading-margin-bottom: 0.5em,
  page-margin: 0.5in,
  border-margin: 0.3in,
  show-border: false,
  doc,
) = {

  // Sets document metadata
  set document(author: author, title: author.replace(" ", "_") + "_CV")

  // Document-wide formatting
  set text(
    font: font,
    size: font-size,
    // Disable ligatures so ATS systems do not get confused when parsing fonts.
    ligatures: false,
  )

  // Page formatting
  set page(
    margin: page-margin,
    paper: paper,
    // Border for debugging or style
    background: if show-border {
      context {
        let w = page.width - border-margin * 2
        let h = page.height - border-margin * 2
        place(dx: border-margin, dy: border-margin, rect(width: w, height: h, stroke: 0.5pt))
      }
    }
  )

  // Paragraph formatting
  set par(
    leading: paragraph-leading,
    spacing: paragraph-spacing,
    justify: true,
  )

  // List formatting
  set list(
    indent: 1em,
  )

  // Section headings (Level 2)
  show heading.where(level: 2): it => [
    #v(0.5em)
    #pad(
      top: 0em,
      bottom: section-heading-margin-bottom,
      block(width: 100%)[
        #smallcaps(it.body)
        #place(dy: 0.3em, line(length: 100%, stroke: 0.5pt))
      ]
    )
  ]

  // Accent Color Styling
  show heading: set text(fill: rgb(accent-color))
  show link: set text(fill: rgb(accent-color))
  
  doc
}
