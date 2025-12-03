#import "lib.typ": conf, header, edu, work, extracurricular, project

#let name = "Jaeho Cho"

#show: conf.with(
  author: name,
  paper: "us-letter",
  accent-color: "#000000",
  font-size: 10pt,
  paragraph-leading: 0.6em,
  paragraph-spacing: 1em,
  section-heading-margin-top: 0.6em,
  section-heading-margin-bottom: 0.3em,
  border-margin: 0.3in,
)

#header(
  name: name,
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
- Courses: Digital Signal Processing, Communication Theory, Engineering Electromagnetics, Digital VLSI System Design, Integrated Circuit Engineering, Theoretical Neuroscience, Microfabrication & Biomedical Device Design


== Research Experience

#work(
  position: "Master's Thesis",
  details: "Dr. Jabeom Koo",
  company: "The Cooper Union",
  location: "New York, NY",
  start-date: "Jun 2025",
  end-date: "Present",
)
- Conducting research on neuromorphic architectures for ultra-low-power brain–machine interfaces, with current efforts focused on designing a neuromorphic processing block (low-power ADC) to follow the LNA.
- Designed a chopper-stabilized low-noise amplifier in 65-nm CMOS using Cadence Virtuoso, achieving 41 dB gain over 0.6 Hz–5 kHz, 1.6 μW power consumption, and a noise-efficiency factor (NEF) of 1.7.

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
  details: "Dr. Stanislav Mintchev",
  company: "The Cooper Union",
  location: "New York, NY",
  start-date: "Jan 2025",
  end-date: "Present",
)
- Working on the theoretical analysis of a weight- and reward-dependent spike-timing-dependent plasticity rule, with an emphasis on deriving the governing equations and establishing rigorous stability and convergence conditions.
- Modeled and analyzed frameworks in Dayan and Abbott’s Theoretical Neuroscience textbook in Python like multi-compartment models with multiple synaptic inputs or Hopfield networks with Hebbian learning.

#work(
  position: "Undergraduate Researcher",
  details: "Dr. Jonathan Dropkin, Dr. Alfred Marc Iloreta",
  company: "Mount Sinai",
  location: "New York, NY",
  start-date: "Feb 2024",
  end-date: "Present",
)
- Developed and evaluated multi-modal surgical workflow analysis pipelines using the Gemini API, synchronizing endoscopic and external OR video streams for surgical instrument and phase detection.
- Trained and optimized a deep learning model (Ultralytics YOLO) for real-time surgical instrument recognition in endoscopic sinus and skull-base procedures, achieving 96.4% precision, 94.8% recall, and 96.6% mAP50.
- Designing an active assistive device to improve surgeon ergonomics during extended procedures, assessing effectiveness through EMG-based fatigue analysis.
- Conducting quantitative ergonomics studies of ENT surgeons using IMU (Opal V2R) and EMG (FREEEMG) sensor arrays; developing signal-processing pipelines for posture and mechanical-exposure analysis.

#work(
  position: "Project Lead",
  details: "Dr. Mili Shah",
  company: "The Cooper Union",
  location: "New York, NY",
  start-date: "Sep 2023",
  end-date: "Present",
)
- Mentoring and training four students in ROS 2, PCB design, circuit prototyping, soldering, and CAD (Fusion 360).
- Led development of a dual-arm robot; implemented motion-planning pipelines and web-based teleoperation using the ROS 2 framework. 
- Building a small spherical robot for decentralized swarm self-assembly; designed and prototyped the mechanical structure and implemented communication and distributed-control routines.
- Designed and fabricated a custom PCB for an e-textile sensor, presented at the 2024 ASTM International Exo Games.


== Publications
// #bibliography("bib.bib", title: none, full: true, style: "ieee_cv.csl")

[1] J. Cho, C. Stonebraker et al., “Effect of a pilot, office-based ergonomic rhinology intervention on mechanical exposure, musculoskeletal symptoms, and usability.” *In progress*

[2] C. Stonebraker, J. Cho et al., “Multi-modal Surgical Workflow Analysis with Gemini API,” *Submitted* to the _2026 American Rhinologic Society (ARS) at Combined Otolaryngology Spring Meetings (COSM)_ to be published in the _International Forum of Allergy & Rhinology_, 2026.

[3] J. Cho and S. Klymchuk, “MARVIN: Web-Based Teleoperation of a Dual-Arm Robot,” *Submitted* to the _TEI 2026 Student Design Competition_, 2026.

[4] C. Stonebraker, J. Cho et al., “Development of a Computer Vision System for Surgical Instrument Analysis During Endoscopic Sinus and Skull Base Surgery,” *Accepted* to the _2026 North American Skull Base Society (NASBS) Annual Meeting_ to be published in the _Journal of Neurological Surgery Part B: Skull Base_, 2026.


== Work Experience

#work(
  position: "Data and AI Intern",
  details: "Hanwha TotalEnergies Petrochemical",
  company: "PwC",
  location: "Seoul, South Korea",
  start-date: "May 2024",
  end-date: "Aug 2024",
)
- Developed and optimized advanced time-series forecasting models utilizing GluonTS, Chronos, and Darts Python libraries to generate price predictions for flagship petrochemical products with a 3-month forecasting horizon.
- Refactored backend data pipelines in Django, transitioning from MongoDB to ClickHouse and improving performance.
- Built a Django service that automates article aggregation via private and public APIs to enhance LLM-driven sentiment analysis.


== Skills

- Programming: Python, MATLAB, Rust, C, C++, Verilog, VHDL, Git, Docker, JavaScript, SQL
- Software: Cadence Virtuoso, LTspice, Altium, Vivado, Fusion360, ROS2, Gazebo, Blender, Onshape