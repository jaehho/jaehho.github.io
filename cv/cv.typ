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
// - GPA: 3.5
- #data.education.scholarships
- Courses: #(data.courses.neuro.theoneuro, data.courses.neuro.mathneurosci, data.courses.neuro.netsys, data.courses.bio.bioelec, data.courses.bio.bioinstr, data.courses.bio.microfab, data.courses.ee.ic, data.courses.ee.vlsi, data.courses.ee.dsp, data.courses.ee.stochastic).join(", ")
]


== Research Experience

#work(..data.experience.thesis.header)[
- #data.experience.thesis.bullets.lna-design
- #data.experience.thesis.bullets.lna-metrics
]

#work(..data.experience.mintchev.header)[
- #data.experience.mintchev.bullets.plasticity
- #data.experience.mintchev.bullets.hh-simulations
]

#work(..data.experience.sinai.header)[
- #data.experience.sinai.bullets.yolo
- #data.experience.sinai.bullets.yolo-metrics
- #data.experience.sinai.bullets.ergo-device
- #data.experience.sinai.bullets.ergo-validate
- #data.experience.sinai.bullets.ergo-imu
]

#work(..data.experience.shah.header)[
- #data.experience.shah.bullets.team-lead
- #data.experience.shah.bullets.mentoring
- #data.experience.shah.bullets.dual-arm
- #data.experience.shah.bullets.pcb
]

#work(..data.experience.nyu.header)[
- #data.experience.nyu.bullets.pipelines
- #data.experience.nyu.bullets.neural-models
- #data.experience.nyu.bullets.robot
]


== Publications
#bibliography("publications.bib", title: none, full: true, style: "ieee")


== Work Experience

#work(..data.experience.pwc.header)[
- #data.experience.pwc.bullets.forecasting
- #data.experience.pwc.bullets.django
- #data.experience.pwc.bullets.aggregation
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

#project(name: data.project.theremin.header.name)[\
- #data.project.theremin.bullets.design
- #data.project.theremin.bullets.debug
]

#project(name: data.project.tetris.header.name)[\
- #data.project.tetris.bullets.implementation
- #data.project.tetris.bullets.simulation
- #data.project.tetris.bullets.design
]


== Skills

- *Programming*: #data.skills.programming
- *Software*: #data.skills.software
- *Hardware*: #data.skills.hardware
