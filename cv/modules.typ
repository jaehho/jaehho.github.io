#import "utils.typ": *
#import "@preview/fontawesome:0.6.0": fa-icon

// Header Component
#let header(
  name: "",
  subtitle: "",
  location: "",
  phone: "",
  email: "",
  linkedin: "",
  website: "",
) = {
  [
    #show heading.where(level: 1): it => [
      #set align(center)
      #set text(
        weight: 700,
        size: 20pt,
      )
      #pad(it.body)
    ]
    = #name

    #if subtitle != "" {
      align(center, text(size: 16pt)[#subtitle])
    }
    
    #pad(
      top: 0.25em,
      align(center)[
        #{
          let fa-icon-size = 8pt
          let items = (
            contact-helper(location, prefix: fa-icon("location-dot", size: fa-icon-size)),
            contact-helper(phone, prefix: fa-icon("phone", size: fa-icon-size)),
            contact-helper(email, prefix: fa-icon("envelope", size: fa-icon-size), link-type: "mailto:"),
            contact-helper(linkedin, prefix: fa-icon("linkedin-in", size: fa-icon-size), link-type: "https://linkedin.com/in/"),
            contact-helper(website, prefix: fa-icon("link", size: fa-icon-size), link-type: "https://"),
          )
          items.filter(x => x != none).join("    ")
        }
      ],
    )
  ]
}

// Education Entry
#let edu(
  institution: "",
  start-date: "",
  end-date: "",
  degree: "",
  gpa: "",
  location: "",
) = {
  generic-two-by-two(
    top-left: strong(institution),
    top-right: location,
    bottom-left: emph(degree),
    bottom-right: emph(dates-helper(start-date: start-date, end-date: end-date)),
  )
}

// Work Experience Entry
#let work(
  position: "",
  details: "",
  company: "",
  location: "",
  start-date: "",
  end-date: "",
) = {
  generic-two-by-two(
    top-left: [#strong(position) #if details != "" [ | #details]],
    top-right: emph(dates-helper(start-date: start-date, end-date: end-date)),
    bottom-left: [#emph(company) #sym.bullet #location],
    bottom-right: "",
  )
}

// Extracurricular Entry (Alias for work)
#let extracurricular = work

// Project Entry
#let project(
  name: "",
  role: "",
  start-date: "",
  end-date: "",
) = {
  generic-one-by-two(
    left: {
      if role == "" {
        [*#name*]
      } else {
        [*#name* (#role)]
      }
    },
    right: {
        emph(dates-helper(start-date: start-date, end-date: end-date))
    },
  )
}
