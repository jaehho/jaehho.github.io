#import "shared/lib.typ": *
#import "shared/data.typ" as data

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
- Designed a chopper-stabilized low-noise amplifier in 65-nm CMOS using Cadence Virtuoso as a front-end for ultra-low-power neuromorphic brain–machine interfaces, achieving post-layout (PEX) verified 41 dB gain over 0.6 Hz–5 kHz, 1.6 μW power consumption, and a noise-efficiency factor of 1.7.
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
- Analyzing minimal two-neuron spiking networks via Python-based Hodgkin–Huxley simulations to extract geometrical descriptions of how plasticity-driven dynamics shape learning in neural circuits.
]

#work(
  position: "Research Volunteer",
  details: "Dr. Jonathan Dropkin, Dr. Alfred Marc Iloreta",
  company: "The Icahn School of Medicine at Mount Sinai",
  location: "New York, NY",
  start-date: "Feb 2024",
  end-date: "Present",
)[
- Training and refining a deep learning model (Ultralytics YOLO) for real-time surgical instrument recognition in endoscopic sinus and skull-base procedures, achieving 96.4% precision, 94.8% recall, and 96.6% mAP50 while expanding to new surgical datasets.
- Designing an assistive device to improve surgeon ergonomics during prolonged procedures, validating effectiveness through EMG-based muscle fatigue analysis and computer-vision–based posture assessment.
- Conducted quantitative ergonomics studies of ENT surgeons using IMU (Opal V2R) and EMG (FREEEMG) sensor arrays; developing signal-processing pipelines for posture and mechanical-exposure analysis.
]

#work(
  position: "Undergraduate Researcher",
  details: "Dr. Mili Shah",
  company: "The Cooper Union for the Advancement of Science and Art",
  location: "New York, NY",
  start-date: "Sep 2023",
  end-date: "Present",
)[
- Leading a team of six students in developing an ultra-low-cost mobile robot for disposable field exploration, mentoring in ROS 2, PCB design, electronics prototyping, and mechanical CAD.
- Led development of a dual-arm robot; implemented motion-planning pipelines and web-based teleoperation using the ROS 2 framework.
- Designed and fabricated a custom PCB for an e-textile sensor, presented at the 2024 ASTM International Exo Games.
]

#work(
  position: "Research Volunteer",
  details: "Dr. Michael Long",
  company: "NYU Langone Health",
  location: "New York, NY",
  start-date: "Jun 2025",
  end-date: "Dec 2025",
)[
- Developed signal-processing and machine-learning pipelines for vocalization analysis, including acoustic feature extraction, unsupervised clustering, dimensionality-reduction techniques, and deep neural models for syllable segmentation and classification.
- Worked on a ROS2-based automated bird-tutoring and data-collection robot to enable long-duration, minimally supervised behavioral experiments in budgie vocal learning.
]


== Publications
#bibliography("bib.bib", title: none, full: true, style: "ieee")


== Work Experience

#work(
  position: "Data and AI Intern",
  details: "Hanwha TotalEnergies Petrochemical",
  company: "PwC",
  location: "Seoul, South Korea",
  start-date: "May 2024",
  end-date: "Aug 2024",
)[
- Developed time-series forecasting models using GluonTS, Chronos, and Darts to generate three-month market predictions for petrochemical products.
- Refactored Django backend pipelines during a transition from MongoDB to ClickHouse, improving data throughput and service latency.
- Implemented a Django-based article aggregation service integrating private and public APIs to support LLM-driven sentiment analysis.
]


== Skills

- *Programming*: #data.skills-programming
- *Software*: #data.skills-software
