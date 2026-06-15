/* =============================================================================
   data.js — the ONLY file you normally edit to update this site.

   ADD MEDIA TO A PROJECT
     1. Drop the file in  assets/projects/<id>/  (folders already exist).
     2. Reference it in that project's `media` array below.
     Until the file exists, a clean labelled placeholder shows in its place —
     so you can list intended figures now and fill them in over time.

   ADD A PROJECT
     Copy any object in PROJECTS, change `id` (must be unique, kebab-case),
     create assets/projects/<id>/, and fill in the fields. Set featured:true
     to give it the large case-study treatment up top.

   MEDIA ITEM SHAPES
     { type:"image", src:"assets/projects/x/fig.png", alt:"…", caption:"…" }
     { type:"video", src:"assets/projects/x/clip.mp4", poster:"…optional…", caption:"…" }

   LINKS  →  { label:"Paper", href:"https://…" }   (omit or leave [] for none)
============================================================================= */

const PROFILE = {
  name: "Jaeho Cho",
  email: "jaeho2025@gmail.com",
  links: [
    { label: "GitHub",   href: "https://github.com/jaehho" },
    { label: "LinkedIn", href: "https://www.linkedin.com/in/jaeho-cho" },
    { label: "Email",    href: "mailto:jaeho2025@gmail.com" },
    // { label: "Scholar", href: "https://scholar.google.com/…" },
  ],
};

const PUBLICATIONS = [
  {
    authors: "C. Stonebraker, J. Cho, K. Liu, L. Brame, R. Shrivastava, A. M. Iloreta",
    title: "Development of a Computer Vision System for Surgical Instrument Analysis During Endoscopic Sinus and Skull Base Surgery",
    venue: "J. Neurological Surgery Part B: Skull Base, 2026",
    note: "Accepted, 2026 North American Skull Base Society (NASBS) Annual Meeting",
    href: "",
  },
];

const PROJECTS = [
  /* ----------------------------- FEATURED ----------------------------- */
  {
    id: "neural-amp",
    featured: true,
    title: "A 0.8-Volt Ear for the Brain",
    tagline: "Chopper-stabilized neural recording amplifier in 65 nm CMOS",
    period: "2025 – 2026",
    role: "Master's Thesis · Dr. Jabeom Koo · Cooper Union",
    tags: ["Analog IC", "65 nm CMOS", "Low-power", "Neural interfaces"],
    summary:
      "Local field potentials are tiny — microvolts, buried under noise. To record them on an implant you need an amplifier that is both whisper-quiet and barely sips power. I designed one that runs on 0.8 volts, the lowest supply reported for its class.",
    body: [
      "The core is a fully-differential, capacitive-feedback chopper-stabilized pre-amplifier that cleanly passes the 1 Hz – 1 kHz band where LFP activity lives, while chopping away the flicker noise that normally swamps signals that slow.",
      "The 0.8 V supply came from a chain of deliberate choices: biasing every signal-path device in subthreshold, picking NMOS for the second stage to fit the stage-1 output common-mode, setting stage-2 current through common-mode-feedback equilibrium rather than a mirror ratio, and sizing the resistive CMFB against 65 nm gate leakage.",
      "The result is the lowest reported supply among published chopper capacitive-feedback amplifiers in this node — without giving up noise or gain.",
    ],
    highlights: ["24.6 dB gain", "2.96 µVrms noise", "0.8 V supply", "NEF 6.1 · 2.3 µW"],
    media: [
      { type: "image", fit: "contain", src: "assets/projects/neural-amp/signal-flow.png", alt: "Signal traced through the chopper amplifier chain", caption: "Signal through the chopper chain: modulate → amplify → demodulate" },
      { type: "image", fit: "contain", src: "assets/projects/neural-amp/ac-response.png", alt: "Open-loop AC magnitude and phase response", caption: "Open-loop AC response at 0.8 V (Cadence): 44.6 dB, UGB 2.11 MHz" },
      { type: "image", fit: "contain", src: "assets/projects/neural-amp/noise.png", alt: "Input-referred noise with and without chopping", caption: "Input-referred noise: 1/f suppression by chopping" },
      { type: "image", fit: "contain", src: "assets/projects/neural-amp/time-compare.png", alt: "Low-frequency output recovered with the chopper", caption: "Low-frequency signal recovery, with vs. without chopper" },
    ],
    links: [
      // { label: "Thesis (PDF)", href: "thesis.pdf" },
      // { label: "Code",         href: "https://github.com/jaehho/…" },
    ],
  },

  /* ------------------------------- GRID ------------------------------- */
  {
    id: "stdp",
    title: "Which Synapse Earned the Reward?",
    tagline: "Temporal credit assignment in three-factor STDP networks",
    period: "2025 – present",
    role: "Independent Research · Dr. Stanislav Mintchev, Dr. Brian Frost-Laplante",
    tags: ["Computational neuro", "Dynamical systems", "Learning rules"],
    summary:
      "A reward often arrives seconds after the activity that caused it — and is broadcast to every synapse at once. So how does a network strengthen only the connections that actually mattered?",
    body: [
      "Working from a minimal dynamical-systems model, I study neo-Hebbian three-factor STDP: spike-timing plasticity gated by a delayed, global neuromodulatory signal.",
      "The question is when selective strengthening succeeds. I map that across parameter space, initial conditions, and feedback regimes — looking for the boundaries between networks that learn the right thing and networks that don't.",
    ],
    highlights: [],
    media: [
      { type: "image", fit: "contain", src: "assets/projects/stdp/convergence-map.png", alt: "Convergence outcome classified across parameter space", caption: "Where learning converges across (α, r_pre) parameter space" },
      { type: "image", fit: "contain", src: "assets/projects/stdp/regimes.png", alt: "Weight, rate, eligibility, and modulation traces", caption: "Weight, rate, eligibility trace, and modulation signal" },
      { type: "image", fit: "contain", src: "assets/projects/stdp/target-convergence.png", alt: "Convergence under different target-rate functions", caption: "Convergence under different target-rate functions" },
    ],
    links: [],
  },
  {
    id: "surgical-cv",
    title: "Watching the Surgeon's Hands",
    tagline: "Computer vision for instrument analysis in endoscopic skull-base surgery",
    period: "2024 – present",
    role: "Research Volunteer · Mount Sinai · Dr. Dropkin, Dr. Iloreta",
    tags: ["Computer vision", "Object detection", "Surgical data"],
    summary:
      "Endoscopic sinus and skull-base procedures are recorded but rarely quantified. I built a detector that recognizes surgical instruments frame-by-frame, turning raw video into measurable surgical metrics.",
    body: [
      "An end-to-end training and inference pipeline detects and tracks instruments in operative video, reaching 96.4% precision and 94.8% recall.",
      "I'm extending it from detection to procedural analytics — instrument usage duration, swap frequency, and other workflow metrics that surgeons and trainees can actually act on.",
    ],
    highlights: ["96.4% precision", "94.8% recall"],
    media: [
      { type: "image", src: "assets/projects/surgical-cv/detection.png", alt: "Annotated endoscopic frame with detected instruments", caption: "Instrument detection on operative video" },
      { type: "image", src: "assets/projects/surgical-cv/pipeline.png",  alt: "Training and inference pipeline diagram",            caption: "End-to-end pipeline" },
    ],
    links: [
      { label: "Publication (NASBS 2026)", href: "" },
    ],
  },
  {
    id: "birdsong",
    title: "Teaching a Bird to Sing",
    tagline: "Vocalization analysis + an automated tutoring robot",
    period: "2025",
    role: "Research Volunteer · NYU Langone · Dr. Michael Long",
    tags: ["Signal processing", "ML", "ROS 2", "Neuroscience"],
    summary:
      "Songbirds learn to sing much like we learn to speak. I built the tools to measure that learning — and a robot to drive the experiments with minimal human supervision.",
    body: [
      "On the analysis side: signal-processing and ML pipelines for vocalization data — feature extraction, clustering, and deep models for segmenting and classifying syllables.",
      "On the hardware side: a ROS 2-based automated bird-tutoring robot that runs vocal-learning experiments with minimal supervision.",
    ],
    highlights: [],
    media: [
      { type: "image", fit: "cover", src: "assets/projects/birdsong/spectrograms.jpg", alt: "Spectrograms of bird vocalizations", caption: "Vocalization spectrograms" },
      { type: "image", src: "assets/projects/birdsong/clusters.png",    alt: "Clustering of syllable types",                    caption: "Unsupervised syllable clustering" },
      { type: "video", src: "assets/projects/birdsong/robot.mp4",       poster: "",                                             caption: "Automated tutoring robot" },
    ],
    links: [],
  },
  {
    id: "robots",
    title: "Robots That Are Meant to Be Left Behind",
    tagline: "Ultra-low-cost field robot + a teleoperated dual-arm platform",
    period: "2023 – 2026",
    role: "Undergraduate Researcher (team lead) · Dr. Mili Shah · Cooper Union",
    tags: ["Robotics", "ROS 2", "PCB design", "Mechatronics"],
    summary:
      "Leading a team of six, I work on robots at two extremes: one cheap enough to be disposable for field exploration, and one dexterous enough to be teleoperated through a browser.",
    body: [
      "For the low-cost robot I designed an integrated PCB combining motor control, IMU, camera, and power management — and mentor the team through ROS 2, electronics prototyping, and CAD.",
      "I also led a dual-arm robot with ROS 2 motion planning and web-based teleoperation, and earlier designed a wireless piezoresistive pressure-sensor PCB presented at the 2024 ASTM Exo Games.",
    ],
    highlights: [],
    media: [
      { type: "image", src: "assets/projects/robots/field-robot.png", alt: "The ultra-low-cost field robot",  caption: "Ultra-low-cost field robot" },
      { type: "video", src: "assets/projects/robots/teleop.mp4",      poster: "",                             caption: "Dual-arm web teleoperation" },
      { type: "image", src: "assets/projects/robots/pcb.png",         alt: "Integrated control PCB",          caption: "Integrated motor/IMU/camera/power PCB" },
    ],
    links: [],
  },
  {
    id: "ergonomics",
    title: "Holding the Surgeon Up",
    tagline: "Motorized, impedance-controlled arm support against surgical fatigue",
    period: "2024 – present",
    role: "Project · Mount Sinai collaboration",
    tags: ["Mechatronics", "Control", "EMG", "Computer vision"],
    summary:
      "Surgeons hold awkward static postures for hours. I'm prototyping an active arm support that takes some of that load — and proving it works by measuring the muscles themselves.",
    body: [
      "The device is a motorized, impedance-controlled arm support tuned to reduce muscle strain during long procedures.",
      "Validation pairs EMG muscle-fatigue measurement with computer-vision posture analysis, alongside IMU-based ergonomics studies of ENT surgeons.",
    ],
    highlights: [],
    media: [
      { type: "image", src: "assets/projects/ergonomics/prototype.png", alt: "Arm-support prototype", caption: "Impedance-controlled arm support" },
      { type: "image", src: "assets/projects/ergonomics/emg.png",       alt: "EMG fatigue measurement plot", caption: "EMG validation" },
    ],
    links: [],
  },
  {
    id: "vlsi-opamp",
    title: "2.4 GHz on a Power Budget",
    tagline: "Differential op-amp for Bluetooth Low Energy (65 nm)",
    period: "2024",
    role: "VLSI Project · Cooper Union",
    tags: ["Analog IC", "RF", "Cadence Virtuoso"],
    summary:
      "A differential-to-single-ended amplifier for BLE radios, designed and laid out clean in 65 nm — every spec met, no DRC or LVS errors.",
    body: [
      "Designed in Cadence Virtuoso (TSMC 65 nm) and taken all the way through layout across M1–M9.",
    ],
    highlights: ["24 dB @ 2.4 GHz", "<500 µW", "0 DRC / LVS errors"],
    media: [
      { type: "image", src: "assets/projects/vlsi-opamp/layout.png", alt: "Op-amp layout", caption: "Layout, M1–M9" },
      { type: "image", src: "assets/projects/vlsi-opamp/gain.png",   alt: "Gain and phase plot", caption: "Gain / phase response" },
    ],
    links: [],
  },
  {
    id: "rf-frontend",
    title: "Building a Radio from Parts",
    tagline: "Discrete RF front end: oscillator, mixer, filter",
    period: "2024",
    role: "RF Project · Cooper Union",
    tags: ["RF", "Analog", "LTspice"],
    summary:
      "A full receive front end built from discrete parts — a Colpitts local oscillator, an active mixer to down-convert, and a passive filter to clean up what's left.",
    body: [
      "Colpitts + RC oscillators generate a 4.1 MHz LO; a single-balanced active mixer down-converts a 3.63 MHz RF signal; a passive low-pass with a 1.6 MHz cutoff rejects the harmonics. Simulated end-to-end in LTspice.",
    ],
    highlights: [],
    media: [
      { type: "image", src: "assets/projects/rf-frontend/board.png",    alt: "RF front-end breadboard", caption: "Discrete RF front end" },
      { type: "image", src: "assets/projects/rf-frontend/spectrum.png", alt: "Output spectrum",         caption: "Down-converted output" },
    ],
    links: [],
  },
  {
    id: "theremin",
    title: "An Instrument You Never Touch",
    tagline: "Analog theremin from op-amps and oscillators",
    period: "2023",
    role: "Analog Project · Cooper Union",
    tags: ["Analog", "Audio", "Hardware"],
    summary:
      "A working theremin built entirely from op-amps and discrete parts — oscillators, voltage followers, envelope detectors, and amplifiers tuned by ear and oscilloscope.",
    body: [
      "Debugged on the bench to get clean, recognizable audio out with minimal noise.",
    ],
    highlights: [],
    media: [
      { type: "image", src: "assets/projects/theremin/build.png", alt: "Theremin build", caption: "The build" },
      { type: "video", src: "assets/projects/theremin/demo.mp4",  poster: "",            caption: "Playing it" },
    ],
    links: [],
  },
  {
    id: "fpga-games",
    title: "Arcade Logic",
    tagline: "Flappy Bird on an FPGA — and Tetris from raw chips",
    period: "2022 – 2024",
    role: "Digital Logic Projects · Cooper Union",
    tags: ["FPGA", "Verilog", "Digital logic"],
    summary:
      "Two games built from the gates up: Flappy Bird in Verilog on a ZedBoard, and Tetris assembled from discrete logic chips on breadboards.",
    body: [
      "Flappy Bird: collision detection and randomized pipe generation in combinational and sequential logic on a Xilinx ZedBoard.",
      "Tetris: RAM, flip-flops, multiplexers, and counters wired by hand — designed with truth tables, Boolean algebra, K-maps, and timing diagrams.",
    ],
    highlights: [],
    media: [
      { type: "image", src: "assets/projects/fpga-games/flappy.png", alt: "Flappy Bird running on a ZedBoard display", caption: "Flappy Bird on a ZedBoard" },
      { type: "image", src: "assets/projects/fpga-games/tetris.png", alt: "Tetris built from logic chips",             caption: "Tetris from discrete logic" },
    ],
    links: [],
  },
];
