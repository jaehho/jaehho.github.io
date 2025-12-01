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
  start-date: "Aug 2024",
  end-date: "May 2026*",
  degree: "Master of Engineering in Electrical Engineering",
)

#edu(
  institution: "The Cooper Union for the Advancement of Science and Art",
  location: "New York City, NY",
  start-date: "Aug 2022",
  end-date: "May 2026*",
  degree: "Bachelor of Engineering in Electrical Engineering, Bioengineering Minor",
)
- Half Tuition Scholarship | Myron Coe Scholarship | Full Tuition Scholarship 2025-2026
- Courses: Frequentist Machine Learning, Digital Signal Processing, Communication Theory, Computer Architecture, Integrated Circuit Engineering, Theoretical Neuroscience, Medical Imaging, Bio-Instrumentation & Sensing


== Research/Work Experience

#work(
  position: "Master's Thesis",
  details: "Dr. Koo",
  company: "The Cooper Union",
  location: "New York, NY",
  start-date: "Jun 2025",
  end-date: "Present",
)
- Investigating the application of neuromorphic computing to design an ultra-low-power neural signal processor.
- Designed and simulated a low-power chopper low noise amplifier (LNA) in Cadence Virtuoso using 65nm CMOS technology. 

#work(
  position: "Undergraduate Researcher",
  details: "Dr. Long (Long Lab)",
  company: "NYU Langone Health",
  location: "New York, NY",
  start-date: "Jun 2025",
  end-date: "Present",
)
- Analyzing budgerigar recordings to extract acoustic features and cluster syllables using methods like UMAP and HDBSCAN along with supervised and unsupervised deep learning models for segmenting and classifying bird vocalizations.
- Automated budgie tutoring and data collection using ROS2 and a custom robot budgie, reducing manual observation time and increasing data throughput.

#work(
  position: "Independent Researcher",
  details: "Dr. Mintchev",
  company: "The Cooper Union",
  location: "New York, NY",
  start-date: "Jan 2025",
  end-date: "Present",
)
- Working on the theoretical analysis of a weight- and reward-dependent spike-timing-dependent plasticity (W-R-STDP) rule, with an emphasis on deriving the governing equations and establishing rigorous stability and convergence conditions.
- Developed low level computational models, from neural encoding and decoding to multi-compartment models with synaptic inputs.

#work(
  position: "Undergraduate Researcher",
  details: "Otolaryngology",
  company: "Mount Sinai",
  location: "New York, NY",
  start-date: "Feb 2024",
  end-date: "Present",
)
- Evaluated the Gemini API for multi-modal surgical workflow analysis, using synced endoscopic and external operating room videos to detect and label surgical instruments and phases.
- Developed and validated a deep learning system using Ultralytics YOLO to recognize and label surgical instruments in endoscopic sinus and skull base procedures. Achieved overall precision of 96.4%, recall of 94.8%, and mAP50 of 96.6%.
- Designing and building an active assistive device to improve surgeon ergonomics during long procedures, evaluating performance with EMG fatigue analysis. 
- Evaluating the ergonomics of ENT surgeons using the Opal V2R system (IMU sensors) and FREEEMG (EMG sensors) to measure muscle fatigue during office and OR procedures.

#work(
  position: "Project Lead",
  details: "Dr. Shah's lab (miliLab)",
  company: "The Cooper Union",
  location: "New York, NY",
  start-date: "Sep 2023",
  end-date: "Present",
)
- MARVIN: Led development of an open-source robotic arm system for human-robot interaction, integrating ROS2, MoveIt2 for motion planning, and Mediapipe for real-time pose landmark detection.
- Designed a kinematic mapping system from human anatomical landmarks to the joint angles of the OpenMANIPULATOR-X robotic arm.
- ROSS: Building a small-scale spherical robot, designed in Fusion360 and controlled with an ESP32-CAM microcontroller.
- Designed and fabricated a PCB in Altium for an eTextile sensor, presented at the 2024 ASTM International Exo Games.
- Evaluation of passive exoskeleton using EMG fatigue assessment involving nonparametric analysis in Python.
- Mentored and trained 4 students in advanced topics Fusion360, ROS2, circuit design, soldering, and PCB design.

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

== Publications
// #bibliography("bib.bib", title: none, full: true, style: "ieee_cv.csl")

[1] C. Stonebraker, J. Cho et al., “Multi-modal Surgical Workflow Analysis with Gemini API,” *Submitted* to the _2026 American Rhinologic Society (ARS) at Combined Otolaryngology Spring Meetings (COSM)_ to be published in the _International Forum of Allergy & Rhinology_, 2026.

[2] J. Cho and S. Klymchuk, “MARVIN: Web-Based Teleoperation of a Dual-Arm Robot,” *Submitted* to the _TEI 2026 Student Design Competition_, 2026.

[3] C. Stonebraker, J. Cho et al., “Development of a Computer Vision System for Surgical Instrument Analysis During Endoscopic Sinus and Skull Base Surgery,” *Submitted* to the _2026 North American Skull Base Society (NASBS) Annual Meeting_ to be published in the _Journal of Neurological Surgery Part B: Skull Base_, 2026.


== Skills

- Programming: Python, MATLAB, Rust, C, C++, Verilog, VHDL, Git, Docker, JavaScript, SQL
- Software: Cadence Virtuoso, LTspice, Altium, Vivado, Fusion360, ROS2, Gazebo, Blender, Onshape