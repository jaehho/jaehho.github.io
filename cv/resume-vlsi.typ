#import "shared/lib.typ": *
#let data = toml("shared/data.toml")

// Document Configuration
#show: conf.with(
  author: data.name,
  paper: "us-letter",
  accent-color: "#000000",
  font: "New Computer Modern",
  font-size: 10pt,
  paragraph-leading: 0.55em,
  paragraph-spacing: 0.8em,
  section-heading-margin-top: 1.0em,
  section-heading-margin-bottom: 0.6em,
  page-margin: 0.6in,
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
- Courses: #(data.courses.ee.vlsi, data.courses.ee.ic, data.courses.ee.hwdesign, data.courses.ee.comparch, data.courses.ee.dsp, data.courses.ee.emag, data.courses.ee.stochastic).join(", ")
]


== Research Experience

#work(..data.experience.thesis.header)[
- #data.experience.thesis.bullets.lna-design
- #data.experience.thesis.bullets.lna-metrics
]

#work(..data.experience.shah.header)[
- #data.experience.shah.bullets.dual-arm
- #data.experience.shah.bullets.pcb
]

#work(..data.experience.sinai.header)[
- #data.experience.sinai.bullets.yolo
- #data.experience.sinai.bullets.yolo-metrics
]

#work(..data.experience.nyu.header)[
- #data.experience.nyu.bullets.pipelines
- #data.experience.nyu.bullets.robot
]


== Projects

#project(name: data.project.vlsi.header.name)[\
- #data.project.vlsi.bullets.design
- #data.project.vlsi.bullets.metrics
- #data.project.vlsi.bullets.layout
]

#project(name: data.project.rf.header.name)[\
- #data.project.rf.bullets.oscillator
- #data.project.rf.bullets.mixer
- #data.project.rf.bullets.filter
- #data.project.rf.bullets.simulation
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
