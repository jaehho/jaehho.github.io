#import "shared/lib.typ": *
#let data = toml("shared/data.toml")

// Document Configuration
#show: conf.with(
  author: data.name,
  paper: "us-letter",
  accent-color: "#000000",
  font: "New Computer Modern",
  font-size: 9.4pt,
  paragraph-leading: 0.6em,
  paragraph-spacing: 1em,
  section-heading-margin-top: 0.8em,
  section-heading-margin-bottom: 0.4em,
  page-margin: 1in,
  border-margin: 0.3in,
  show-border: false,
)

// Header with Contact Information
#header(
  name: data.name,
  subtitle: "",
  location: data.location,
  phone: data.phone,
  email: data.email,
  linkedin: data.linkedin,
  website: data.website,
)


== Education

#edu(
  institution: data.education.institution,
  location: data.education.location,
  start-date: data.education.start-date,
  end-date: data.education.end-date,
  degree: data.education.degree,
)[
// - GPA: 3.5
- #data.education.scholarships
- Courses: #(data.courses.ee.vlsi, data.courses.ee.ic, data.courses.ee.electronics-i, data.courses.ee.electronics-ii, data.courses.ee.circuits, data.courses.ee.dsp, data.courses.ee.emag, data.courses.ee.hwdesign, data.courses.ee.comparch, data.courses.ee.logic).join(", ")
]


== IC Design Experience

#work(..data.experience.thesis.header)[
- #data.experience.thesis.bullets.lna-design
- #data.experience.thesis.bullets.lna-metrics
]


== Projects

#project(..data.project.vlsi.header)[\
- #data.project.vlsi.bullets.design
- #data.project.vlsi.bullets.metrics
- #data.project.vlsi.bullets.layout
]

#project(..data.project.rf.header)[\
- #data.project.rf.bullets.oscillator
- #data.project.rf.bullets.mixer
- #data.project.rf.bullets.filter
- #data.project.rf.bullets.simulation
]

#project(..data.project.theremin.header)[\
- #data.project.theremin.bullets.design
- #data.project.theremin.bullets.debug
]

#project(..data.project.tetris.header)[\
- #data.project.tetris.bullets.implementation
- #data.project.tetris.bullets.simulation
- #data.project.tetris.bullets.design
]


== Skills

- *Languages*: #data.skills.vlsi.programming
- *EDA & Software*: #data.skills.vlsi.eda
- *Hardware*: #data.skills.hardware
