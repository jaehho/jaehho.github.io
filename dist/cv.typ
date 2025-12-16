#import "lib.typ": *

#let name = "Curriculum Vitae | Jaeho Cho"

#show: conf.with(
  author: name,
  paper: "us-letter",
  accent-color: "#000000",
  font: "New Computer Modern",
  font-size: 9.4pt,
  paragraph-leading: 0.6em,
  paragraph-spacing: 1em,
  section-heading-margin-top: 0.6em,
  section-heading-margin-bottom: 0.3em,
  page-margin: 1in,
  border-margin: 0.3in,
)

#header(
  name: name,
  subtitle: "Electrical & Computer Engineering Ph.D. at the University of Michigan Rackham Graduate School",
  location: "New York, NY",
  phone: "+1 (201) 406-5974",
  email: "jaeho2025@gmail.com",
  linkedin: "jaeho-cho",
  website: "https://jaehho.github.io"
)


== Education

#edu(
  institution: "The Cooper Union for the Advancement of Science and Art",
  location: "New York City, NY",
  start-date: "Aug 2022",
  end-date: "May 2026*",
  degree: "M.Eng, B.Eng in Electrical Engineering (Joint), Bioengineering Minor",
)
- Half Tuition Scholarship | Myron Coe Scholarship | Full Tuition Scholarship 2025-2026
- Courses: Digital Signal Processing, Communication Theory, Engineering Electromagnetics, Digital VLSI System Design, Integrated Circuit Engineering, Theoretical Neuroscience


== Research Experience

#work(
  position: "Master's Thesis",
  details: "Dr. Jabeom Koo",
  company: "The Cooper Union for the Advancement of Science and Art",
  location: "New York, NY",
  start-date: "Jun 2025",
  end-date: "Present",
)
- Conducting research on neuromorphic architectures for ultra-low-power brain–machine interfaces, with current efforts focused on designing a neuromorphic processing block (Analog-to-Digital Converter).
- Designed a chopper-stabilized low-noise amplifier in 65-nm CMOS using Cadence Virtuoso, achieving post-layout (PEX) verified performance of 41 dB gain over 0.6 Hz–5 kHz, 1.6 μW power consumption, and a noise-efficiency factor of 1.7.

#work(
  position: "Undergraduate Researcher",
  details: "Dr. Michael Long",
  company: "NYU Langone Health",
  location: "New York, NY",
  start-date: "Jun 2025",
  end-date: "Present",
)
- Developed signal-processing and machine-learning pipelines for vocalization analysis, including acoustic feature extraction, unsupervised clustering, dimensionality-reduction techniques, and deep neural models for syllable segmentation and classification.
- Engineered a ROS2-based automated tutoring and data-collection robot enabling long-duration, minimally supervised behavioral experiments.

#work(
  position: "Independent Researcher",
  details: "Dr. Stanislav Mintchev, Dr. Brian Frost Laplante",
  company: "The Cooper Union for the Advancement of Science and Art",
  location: "New York, NY",
  start-date: "Jan 2025",
  end-date: "Present",
)
- Develop theory identifying when simplified models of plastic spiking neural networks break down, and deriving corrected models that remain accurate as network dynamics change during learning.
- Studied computational models of neural encoding and decoding, multi-compartment Hodgkin-Huxley dynamics, attractor networks, and plasticity rules in Python.

#work(
  position: "Undergraduate Researcher",
  details: "Dr. Jonathan Dropkin, Dr. Alfred Marc Iloreta",
  company: "The Icahn School of Medicine at Mount Sinai",
  location: "New York, NY",
  start-date: "Feb 2024",
  end-date: "Present",
)
- Built and evaluated multi-modal surgical workflow analysis pipelines using the Gemini API, synchronizing endoscopic and external OR video streams for surgical instrument and phase detection.
- Trained and optimized a deep learning model (Ultralytics YOLO) for real-time surgical instrument recognition in endoscopic sinus and skull-base procedures, achieving 96.4% precision, 94.8% recall, and 96.6% mAP50.
- Designing an assistive device to improve surgeon ergonomics during extended procedures, assessing effectiveness through EMG-based fatigue analysis.
- Conducted quantitative ergonomics studies of ENT surgeons using IMU (Opal V2R) and EMG (FREEEMG) sensor arrays; developing signal-processing pipelines for posture and mechanical-exposure analysis.
#pagebreak()
#work(
  position: "Undergraduate Researcher",
  details: "Dr. Mili Shah",
  company: "The Cooper Union for the Advancement of Science and Art",
  location: "New York, NY",
  start-date: "Sep 2023",
  end-date: "Present",
)
- Mentoring and training four students in ROS2, PCB design, circuit prototyping, and mechanical CAD workflows, as well as broader project framing and management skills.
- Led development of a dual-arm robot; implemented motion-planning pipelines and web-based teleoperation using the ROS 2 framework. 
- Building a small spherical robot for decentralized swarm self-assembly; designed and prototyped the mechanical structure and implemented communication and distributed-control routines.
- Designed and fabricated a custom PCB for an e-textile sensor, presented at the 2024 ASTM International Exo Games.


== Publications
// #bibliography("bib.bib", title: none, full: true, style: "ieee_cv.csl")

// [1] J. Cho, C. Stonebraker et al., “Effect of a pilot, office-based ergonomic rhinology intervention on mechanical exposure, musculoskeletal symptoms, and usability.” *In progress*

[1] C. Stonebraker, J. Cho et al., “Multi-modal Surgical Workflow Analysis with Gemini Image Understanding,” *Submitted* to the _2026 American Rhinologic Society (ARS) at Combined Otolaryngology Spring Meetings (COSM)_.

[2] J. Cho and S. Klymchuk, “MARVIN: Web-Based Teleoperation of a Dual-Arm Robot,” *Submitted* to the _TEI 2026 Student Design Competition_, 2026.

[3] C. Stonebraker, J. Cho et al., “Development of a Computer Vision System for Surgical Instrument Analysis During Endoscopic Sinus and Skull Base Surgery,” *Accepted* to the _2026 North American Skull Base Society (NASBS) Annual Meeting_ to be published in the _Journal of Neurological Surgery Part B: Skull Base_, 2026.


== Work Experience

#work(
  position: "Data and AI Intern",
  details: "Hanwha TotalEnergies Petrochemical",
  company: "PwC",
  location: "Seoul, South Korea",
  start-date: "May 2024",
  end-date: "Aug 2024",
)
- Developed time-series forecasting models using GluonTS, Chronos, and Darts to generate three-month market predictions for petrochemical products.
- Refactored Django backend pipelines during a transition from MongoDB to ClickHouse, improving data throughput and service latency.
- Implemented a Django-based article aggregation service integrating private and public APIs to support LLM-driven sentiment analysis.


== Skills

- Programming: Python, MATLAB, Rust, C, C++, Verilog, VHDL, Git, Docker, JavaScript, SQL
- Software: Cadence Virtuoso, LTspice, Altium, Vivado, Fusion360, ROS2, Gazebo, Blender, Onshape