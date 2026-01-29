#import "@preview/fontawesome:0.6.0": fa-icon

// Helper for generic two-column layout
#let generic-two-by-two(
  top-left: "",
  top-right: "",
  bottom-left: "",
  bottom-right: "",
) = {
  block(
    width: 100%,
    breakable: true,
    [
      #top-left #h(1fr) #top-right \
      #bottom-left #h(1fr) #bottom-right
    ]
  )
}

// Helper for generic one-row layout with right-aligned date
#let generic-one-by-two(
  left: "",
  right: "",
) = {
  block(
    width: 100%,
    breakable: true,
    [
      #left #h(1fr) #right
    ]
  )
}

// Helper to format date ranges
#let dates-helper(
  start-date: "",
  end-date: "",
) = {
  if end-date != "" {
    start-date + " " + sym.dash.en + " " + end-date
  } else {
    start-date
  }
}

// Helper to render contact info items with icons
#let contact-helper(value, prefix: "", link-type: "") = {
  if value != "" {
    if link-type != "" {
      link(link-type + value)[#(prefix + " " + value)]
    } else {
      prefix + " " + value
    }
  }
}
