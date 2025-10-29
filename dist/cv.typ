#import "@local/cv:0.1.0": conf, header, edu, work, extracurricular

#let name = "Jaeho Cho"

#show: conf.with(
  author: name,
  paper: "us-letter",
  accent-color: "#000000",
  font-size: 10pt,
  paragraph-leading: 0.59em,
  paragraph-spacing: 0.7em,
  section-heading-margin-top: 0.5em,
  section-heading-margin-bottom: 0.2em,
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
  end-date: "May 2026",
  degree: "Bachelor of Engineering in Electrical Engineering, Bioengineering Minor",
)
- Half Tuition Scholarship | Myron Coe Scholarship | Full Tuition Scholarship 2025-2026
- Courses: Frequentist Machine Learning, Digital Signal Processing, Communication Theory, Computer Architecture, Integrated Circuit Engineering, Theoretical Neuroscience, Medical Imaging, Bio-Instrumentation &amp; Sensing




== Work Experience


#work(
  position: "Research Intern",
  details: "Neuroscience",
  company: "NYU Langone Health",
  location: "New York, NY",
  start-date: "June 2025",
  end-date: "Present",
)
- Building a custom robotic bird to study vocal learning and social behavior in budgerigars, using ROS2 for robot control.
- Optimizing budgerigar vocalization analysis pipelines to extract acoustic features and cluster syllables.
- Developed a ROS2 system for automatic budgie tutoring and data collection, controlling a custom robotic bird optimized for tutoring.



#work(
  position: "Research Volunteer",
  details: "Ergonomics in Otolaryngology, Computer Vision in Operating Room",
  company: "Mount Sinai",
  location: "New York, NY",
  start-date: "Feb 2024",
  end-date: "Present",
)
- Applying deep learning and computer vision to classify surgical instruments and phases in endoscopic sinus surgeries.
- Developed data-processing pipelines to interpret raw data from Xsens IMUs, analyzing the ergonomic stress on joints.



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
- Built a Django service that automates article aggregation via private and public APIs, analytically integrating forecasts and market indicators to enhance LLM-driven sentiment analysis, ultimately delivering actionable insights to analysts.



#work(
  position: "Teacher Assistant",
  details: "Design and Drawing",
  company: "The Cooper Union",
  location: "New York, NY",
  start-date: "Jun 2023",
  end-date: "Aug 2023",
)
- Instructed 24 students in engineering design fundamentals, circuit design, Arduino programming, and Onshape CAD.
- Led workshops on Arduinos and circuit design, culminating in students building 3D-printed 4-DoF robotic arms.




== Extracurricular Activities


#extracurricular(
  position: "Founder/President",
  details: "The Pre-Medical &amp; Pre-Dental Society",
  company: "The Cooper Union",
  location: "New York, NY",
  start-date: "Sep 2024",
  end-date: "Present",
)
- Established a support network for pre-medical and pre-dental students, bridging gaps in guidance at Cooper Union.
- Organized and led events, including a blood drive that resulted in 37 whole blood donations, and alumni networking sessions that successfully connected students with current medical school students and healthcare professionals.



#extracurricular(
  position: "Project Lead",
  details: "Bioengineering Vertically Integrated Projects",
  company: "The Cooper Union",
  location: "New York, NY",
  start-date: "Sep 2022",
  end-date: "Present",
)
- Building open-source robotic arms for direct human-robot interaction, using Mediapipe and OpenCV Python libraries for pose landmark detection and ROS2 for the kinematic mapping of joint positions to the OpenMANIPULATOR-X system.
- Simulated real-time systems in Gazebo using MoveIt2 and ros2_control for collision detection and motion planning.
- Designed and fabricated a PCB in Altium for an eTextile sensor, presented at the 2024 ASTM International Exo Games.



#extracurricular(
  position: "Shadow",
  details: "Dr. Steve Doh (Anesthesiologist)",
  company: "St. Joseph&#39;s Medical Center",
  location: "Yonkers, NY",
  start-date: "Jun 2023",
  end-date: "Jul 2023",
)
- Observed medical procedures, including endoscopies, laparoscopies, lithotripsies, orthopedic, and open surgeries.
- Gained insight into medical equipment, from ultrasound and anesthesia machines to robotic-arm assisted surgeries.




== Skills

- Programming: Python, MATLAB, Rust, C, C++, Verilog, VHDL, Git, Docker, JavaScript, SQL
- Software: Virtuoso, LTspice, Altium, Vivado, ROS2, Gazebo, Blender, Onshape, Fusion360, Inventor
- Certification: NYS EMT, CPR