#set page(
  paper: "us-letter",
  margin: 1in,
)

#set text(
  font: "New Computer Modern",
  size: 11pt,
)

#set par(
  justify: true,
  leading: 1.13em,
  spacing: 1.13em,
)

#set enum(spacing: 1.5em)

*Prompt:* Please provide 3 concise examples highlighting your exceptional ability, using quantitative metrics and technical details to display the impact on a product or project related to the position you are applying for. Each example should capture the problem, solution, and result within a maximum of 3--4 sentences and start with an action word (e.g., built, led, launched).

#v(0.5em)

+ Designed a PCB for an ultra-low-cost mobile robot that integrates motor drive, IMU, camera interface, and power management on a single board, replacing four separate development boards. I took it from requirements through part selection, schematic, layout, assembly, and test, bringing per-robot electronics cost to approximately \$100. Two prototypes were assembled and now run ROS 2.

+ Designed a chopper-stabilized low-noise amplifier in 65 nm CMOS for brain--machine interfaces, targeting the microvolt-scale neural signals and ultra-low power budget required for implantable recording. Post-layout verification shows 41 dB gain from 0.6 Hz to 5 kHz, 3 μVrms input-referred noise, 93 dB CMRR, 1.6 μW total power, and a noise-efficiency factor of 1.7. The design is being prepared for tapeout as my master's thesis with Dr. Jabeom Koo.

+ Trained a YOLO object-detection model for surgical instrument recognition at Mount Sinai, labeling 3,241 frames across 9 instrument classes from 63 hours of endoscopic sinus and skull-base surgery footage. The end-to-end training and inference pipeline reaches 96.4% precision and 94.8% recall at 20 ms per frame, and is used by the surgical team for offline evaluation of a suction device under development. I spent time in the operating room with ENT surgeons to understand the instrument workflow firsthand, and that context shaped how I defined the classes and labeled the data.
