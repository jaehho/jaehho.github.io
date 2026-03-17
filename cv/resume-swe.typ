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
]


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


== Engineering Projects

#work(
  position: "Undergraduate Researcher",
  details: "Dr. Mili Shah",
  company: "The Cooper Union for the Advancement of Science and Art",
  location: "New York, NY",
  start-date: "Sep 2023",
  end-date: "Present",
)[
- Led development of a dual-arm robot; implemented motion-planning pipelines and web-based teleoperation using the ROS 2 framework.
- Building a small mobile robot for decentralized swarm self-assembly: iteratively produced multiple designs in Fusion360; implemented peer-to-peer bluetooth communication and distributed-control routines.
- Designed and fabricated a custom PCB for an e-textile sensor, presented at the 2024 ASTM International Exo Games.
]

#work(
  position: "Research Volunteer",
  details: "Dr. Jonathan Dropkin, Dr. Alfred Marc Iloreta",
  company: "The Icahn School of Medicine at Mount Sinai",
  location: "New York, NY",
  start-date: "Feb 2024",
  end-date: "Present",
)[
- Trained and optimized a deep learning model (Ultralytics YOLO) for real-time surgical instrument recognition, achieving 96.4% precision, 94.8% recall, and 96.6% mAP50.
- Designing an assistive device to improve surgeon ergonomics, validating effectiveness through EMG-based muscle fatigue analysis and computer-vision–based posture assessment.
]

#work(
  position: "Research Volunteer",
  details: "Dr. Michael Long",
  company: "NYU Langone Health",
  location: "New York, NY",
  start-date: "Jun 2025",
  end-date: "Dec 2025",
)[
- Developed signal-processing and ML pipelines for vocalization analysis, including feature extraction, unsupervised clustering, and deep neural models for syllable segmentation.
- Built a ROS2-based automated bird-tutoring and data-collection robot for long-duration behavioral experiments.
]


== Technical Skills

- *Programming*: #data.skills-swe-programming
- *Software*: #data.skills-swe-software
