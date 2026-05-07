#import "@preview/fontawesome:0.6.0": fa-icon

#set page(
  paper: "us-letter",
  margin: (top: 0.75in, bottom: 1in, left: 1in, right: 1in),
)

#set text(
  font: "New Computer Modern",
  size: 12pt,
  ligatures: false,
)

#set par(
  justify: true,
  leading: 1.13em,
  spacing: 1.13em,
  first-line-indent: 1.5em,
)

// Header — matches resume exactly (0.5in effective margins, 10pt body, 9pt icons)
#pad(x: -0.5in)[
  #set text(size: 10pt)
  #show heading.where(level: 1): it => [
    #set align(center)
    #set text(weight: 700, size: 18pt)
    #pad(it.body)
  ]
  = Jaeho Cho
  #pad(
    top: 0.25em,
    align(center)[
      #{
        let fa-icon-size = 9pt
        let items = (
          [#fa-icon("location-dot", solid: true, size: fa-icon-size) New York, NY],
          [#fa-icon("phone", solid: true, size: fa-icon-size) +1 (201) 406-5974],
          link("mailto:jaeho2025@gmail.com")[#fa-icon("envelope", solid: true, size: fa-icon-size) jaeho2025\@gmail.com],
          link("https://linkedin.com/in/jaeho-cho")[#fa-icon("linkedin-in", size: fa-icon-size) jaeho-cho],
          link("https://jaehho.github.io")[#fa-icon("link", solid: true, size: fa-icon-size) jaehho.github.io],
        )
        items.join("    ")
      }
    ],
  )
]

#v(1.5em)

#par(first-line-indent: 0em)[Dear Neuralink Surgery & Robotics Hardware Team,]

At the NYBCI 2025 Symposium I heard presentations on the Neuralink implant and the R1 robot, and spoke with Dr. Michael T. Lawton. What stayed with me was his framing: that the implant procedure is demanding enough to warrant a robot purpose-built for it, rather than adapting existing surgical tools. I had not heard the case for custom surgical hardware put that plainly, and it reframed the problem for me.

My work so far has grown from the same instinct. I am designing an analog frontend for brain--machine interfaces, working on the power and noise tradeoffs that define implantable recording hardware.

Being in the operating room taught me that it is easy to design for a version of surgery you imagine rather than the one that actually happens, and that the difference is hard to see without being there. I want to join the Surgery & Robotics Hardware Team because understanding that difference is part of the job.

#v(1em)

#set par(first-line-indent: 0em)
#align(right)[
  Sincerely, \
  Jaeho Cho
]
