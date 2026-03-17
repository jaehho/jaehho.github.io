#import "shared/lib.typ": *
#import "shared/data.typ" as data

// Document Configuration — tighter margins for 1-page resume
#show: conf.with(
  author: data.name,
  paper: "us-letter",
  accent-color: "#000000",
  font: "New Computer Modern",
  font-size: 9pt,
  paragraph-leading: 0.5em,
  paragraph-spacing: 0.8em,
  section-heading-margin-top: 0.6em,
  section-heading-margin-bottom: 0.3em,
  page-margin: 0.5in,
  border-margin: 0.3in,
  show-border: false,
)

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
- Courses: #data.education.courses
]


== Research Experience

#work(
  position: "Master's Thesis",
  details: "Dr. Jabeom Koo",
  company: "The Cooper Union for the Advancement of Science and Art",
  location: "New York, NY",
  start-date: "Jun 2025",
  end-date: "Present",
)[
- Conducting research on neuromorphic architectures for ultra-low-power brain–machine interfaces, with current efforts focused on designing a neuromorphic processing block (Analog-to-Digital Converter).
- Designed a chopper-stabilized low-noise amplifier in 65-nm CMOS using Cadence Virtuoso, achieving post-layout (PEX) verified performance of 41 dB gain over 0.6 Hz–5 kHz, 1.6 μW power consumption, and a noise-efficiency factor of 1.7.
]

#work(
  position: "Independent Researcher",
  details: "Dr. Stanislav Mintchev, Dr. Brian Frost Laplante",
  company: "The Cooper Union for the Advancement of Science and Art",
  location: "New York, NY",
  start-date: "Jan 2025",
  end-date: "Present",
)[
- Developing theoretical criteria for when reduced models of plastic spiking neural networks fail, and deriving corrected formulations that remain accurate as network dynamics evolve during learning.
- Investigated neural encoding and decoding through computational modeling of multi-compartment Hodgkin–Huxley neurons, attractor dynamics, and synaptic plasticity rules, implemented and analyzed in Python.
]

#work(
  position: "Research Volunteer",
  details: "Dr. Jonathan Dropkin, Dr. Alfred Marc Iloreta",
  company: "The Icahn School of Medicine at Mount Sinai",
  location: "New York, NY",
  start-date: "Feb 2024",
  end-date: "Present",
)[
- Trained and optimized a deep learning model (Ultralytics YOLO) for real-time surgical instrument recognition in endoscopic sinus and skull-base procedures, achieving 96.4% precision, 94.8% recall, and 96.6% mAP50.
- Conducted quantitative ergonomics studies of ENT surgeons using IMU and EMG sensor arrays; developing signal-processing pipelines for posture and mechanical-exposure analysis.
]

#work(
  position: "Research Volunteer",
  details: "Dr. Michael Long",
  company: "NYU Langone Health",
  location: "New York, NY",
  start-date: "Jun 2025",
  end-date: "Dec 2025",
)[
- Developed signal-processing and machine-learning pipelines for vocalization analysis, including acoustic feature extraction, unsupervised clustering, and deep neural models for syllable segmentation.
- Worked on a ROS2-based automated bird-tutoring and data-collection robot for long-duration behavioral experiments in budgie vocal learning.
]


== Publications
#bibliography("bib.bib", title: none, full: true, style: "ieee")


== Skills

- *Programming*: #data.skills-research-programming
- *Software*: #data.skills-research-software
