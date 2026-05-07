#import "shared/lib.typ": *
#let data = toml("shared/data.toml")

// Document Configuration
#show: conf.with(
  author: data.name,
  paper: "us-letter",
  accent-color: "#000000",
  font: "New Computer Modern",
  font-size: 10pt,
  paragraph-leading: 0.65em,
  paragraph-spacing: 0.8em,
  section-heading-margin-top: 0.87em,
  section-heading-margin-bottom: 0.8em,
  page-margin: 0.5in,
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
- #data.education.scholarships
- Courses: #(data.courses.ee.hwdesign, data.courses.ee.ic, data.courses.ee.vlsi, data.courses.ee.comparch, data.courses.ee.dsp, data.courses.bio.bioelec, data.courses.bio.bioinstr, data.courses.bio.microfab, data.courses.bio.imaging).join(", ")
]


== Research Experience

#work(..data.experience.sinai.header)[
- #data.experience.sinai.bullets.yolo
- #data.experience.sinai.bullets.ergo-imu
]

#work(..data.experience.thesis.header)[
- #data.experience.thesis.bullets.lna
]

#work(..data.experience.shah.header)[
- #data.experience.shah.bullets.robot-pcb
- #data.experience.shah.bullets.exo-pcb
- #data.experience.shah.bullets.dual-arm
]

#work(..data.experience.nyu.header)[
- #data.experience.nyu.bullets.robot
]


== Projects

#project(name: data.project.ergo.header.name)[\
- #data.project.ergo.bullets.design
]

#project(name: data.project.vlsi.header.name)[\
- #data.project.vlsi.bullets.design
- #data.project.vlsi.bullets.metrics
- #data.project.vlsi.bullets.layout
]

#project(name: data.project.flappy.header.name)[\
- #data.project.flappy.bullets.design
- #data.project.flappy.bullets.logic
]


== Work Experience

#work(..data.experience.pwc.header)[
- #data.experience.pwc.bullets.forecasting
- #data.experience.pwc.bullets.django
- #data.experience.pwc.bullets.aggregation
]


== Skills

- *Programming*: #data.skills.programming
- *Software*: #data.skills.software
- *Hardware*: #data.skills.hardware
