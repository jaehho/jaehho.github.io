#set page(
  paper: "us-letter",
  margin: (x: 0.7in, top: 0.55in, bottom: 0.6in),
  numbering: "1 / 1",
)

#set text(
  font: "New Computer Modern",
  size: 10pt,
)

#set par(
  leading: 0.55em,
  spacing: 0.65em,
  justify: true,
)

#show heading.where(level: 1): it => block(below: 0.5em, above: 0.8em)[
  #set text(size: 13pt, weight: "bold")
  #it.body
  #v(-0.4em)
  #line(length: 100%, stroke: 0.6pt + rgb("#444"))
]

#show heading.where(level: 2): it => block(below: 0.3em, above: 0.55em)[
  #set text(size: 10.5pt, weight: "bold")
  #it.body
]

#show heading.where(level: 3): it => block(below: 0.15em, above: 0.4em)[
  #set text(size: 10pt, weight: "bold", style: "italic", fill: rgb("#333"))
  #it.body
]

#set list(spacing: 0.5em, indent: 0.8em)
#set enum(spacing: 0.5em, indent: 0.8em)

#let short(content) = block(
  fill: rgb("#f4f4f4"),
  stroke: (left: 2pt + rgb("#444")),
  inset: (left: 0.6em, right: 0.6em, top: 0.45em, bottom: 0.45em),
  width: 100%,
  radius: 2pt,
  content,
)

#let label(name) = text(weight: "bold", fill: rgb("#444"), size: 9pt)[#upper(name)]

#align(center)[
  #text(15pt, weight: "bold")[Chiappe Lab Interview Reference]
  #v(-0.3em)
  #text(9pt, fill: rgb("#666"))[Glance, do not read aloud. Bolded phrases anchor the structure.]
]

= Tell me about yourself

I'm on track to graduate this May with a *joint bachelor's and master's in electrical engineering*, and my *master's thesis* is designing a *low-power neural amplifier chip for recording local field potentials*.

On the neuroscience side, I studied *Dayan and Abbott's "Theoretical Neuroscience"* through an *independent study*, and I try to keep up with neuroscience papers as much as I can. That independent study is what really drew me to the field, and afterwards I wanted to be more involved hands-on, so I was grateful for the opportunity to work with *Dr. Michael Long at NYU Langone, who I believe you're familiar with*. I worked on *computational models for processing birdsong* and a *robotic budgerigar for behavioral studies*.

The *Long Lab is a big part of why I want to work in a neuroscience lab specifically*. It showed me what the day-to-day culture of a lab is like, and I really valued *how close I felt to the application of the research*, compared to a lot of electrical engineering work I've done, which often feels like building tools for research. I still enjoy that side of things, but the proximity to the science is what I want more of.

Continuing on the neuroscience side, I'm currently working with *one of my math professors* on the *modeling of small neural networks*, like *two to four neurons*, trying to *fully characterize the dynamical-systems behavior* across parameters like time constants and reward rules like *covariance or gated Hebbian*.

I also have some computer-vision experience with the *ENT department at Mount Sinai* if you'd like to hear more about that.

== If she asks about Mount Sinai

We're using *YOLO*, a deep learning architecture for *fast object detection*, to extract *procedural metrics like instrument usage duration and swap frequency* from surgical video. The metrics feed into a study evaluating the effectiveness of a *novel suction device*.

== How you came to apply (if asked)

#short[
*Dr. Mili Shah* at Cooper Union, who I've worked with for almost four years, was the one who recommended I reach out. *She also referred me to Dr. Long*, and I understand the three of you are *long-time friends*. After my time at the Long Lab, applying here felt like the natural next step.
]

// == If she asks how the thesis connects to her work
//
// The chip targets *ECoG and LFP*, which are *extracellular, population-scale signals*, mostly relevant to *mammalian preparations*. Your lab's recordings are *whole-cell patch on individually identified neurons* and *two-photon calcium imaging*, which are different modalities at a different scale. *I'm not pitching the chip as a direct tool transfer.* The transferable side is the *analog-design skill set*: low-noise design, signal conditioning, low-power operation under tight constraints. And the reason I'm pursuing neuroscience is the *science itself*, which is what the Long Lab and the Mintchev work have been about.

= What you'd want to do in the lab

I think there are two things I would be very interested in.

First, on the *hardware side*, I'd want to contribute to *building or extending behavioral apparatuses*. The *robot tutor bird I built at the Long Lab* was exactly that kind of work: a custom rig designed around a specific experimental need, with *PCBs, embedded systems, ROS2, and mechanical design* all interacting with the actual experimental protocol. I'd want to do similar things here, whether that's *extending FlyVRena*, building a new closed-loop rig, real-time tracking, or custom optomechanical setups.

Second, and probably more important to me, *I want to be hands-on with the experimental work*. I've studied *two-photon imaging and patch clamp* in coursework but I've never done either myself. *Calcium imaging in head-fixed flies, and eventually whole-cell patch on the tangential cells you work with*, are the kinds of things I want to learn here, not as supporting skills around an engineering project but as the actual work.

= Difficult work situation

I've been working with *Dr. Mili Shah* for almost four years. For the first three, the team was usually just me and one other student, but this year the project scaled up quickly. I started a *new robot project* with Dr. Shah over the summer, picked up a few *new students at the start of the fall*, and by this spring the team had grown to *nine*. As *project lead*, I was suddenly responsible for keeping nine people productive on a project that was itself new.

The first challenge was *structural*. I *split the team into subteams* with tasks that could run in parallel, so people weren't blocking each other.

The second was *teaching*. Most of the new students were *freshmen*, with no background in CAD, PCB design, soldering, or electronics, and I couldn't just hand them tasks I would do myself. The naive approach would have been to *teach them first and let them contribute later*, but that would have stalled the project. What worked better was *giving a quick demo of the tool and then folding them into the actual work alongside me*. For example, when teaching a student *PCB design*, I gave him a brief tour of the software and then had him *help me research datasheets and circuit architectures*. He learned the workflow by participating in it, and the project moved forward at the same time.

= Questions to ask Dr. Chiappe

#short[
"I was reading one of your papers on *gaze stabilization* and I was actually wondering how sensitive the *visual feedback preventing reflex-driven turns* is to the *loop latency of FlyVRena* I think its called?. Has there been any evaluation of how *different latencies affect the fly's behavior*? Or any efforts to *improve the latency of the system* — I think the paper mentioned it's *dominated by the projector itself*?"
]

*Why it works.* Anchored to the *Cruz 2021* paper's specific *40 ms* spec. The two-part follow-up gives her two natural answers: either latency tolerance has been characterized, or there's an *open engineering problem you can plausibly help with* — without pitching directly. Signals *embedded-systems and closed-loop background*.

#short[
"I was reading the *Erginkaya 2025* disinhibitory network paper and noticed the *connection weights were manually selected across six simulations* to match the experimental responses. *Dr. Mintchev and I have been mapping how small disinhibitory networks behave across parameter space*, so I was wondering — *how sensitive is the model's behavior to those weight choices?* Has there been any exploration of that, or is it something that could benefit from a systematic sweep?"
]

*Connection to Mintchev work.* They fit *one set of weights* by hand. My Mintchev work *systematically maps* how small disinhibitory networks behave across parameter space. *Same kind of network* — they just never tested how the weights themselves matter.

#short[
"What is the *lab culture* like here? I really enjoyed my time at *Dr. Long's lab* — everyone was *friendly and open to help* — and I'd love to hear how that compares."
]

#short[
"Are there *new directions* the lab is heading towards that aren't reflected in your *recent papers or website*?"
]

= CV elaborations (in case she asks)

== Mintchev. Theoretical neuroscience.

#short[
- *Temporal credit assignment* in small networks (*2–4 neurons*) with *three-factor reward-modulated STDP*
- Reward arrives *seconds after activity* and is broadcast to every synapse
- Mapping where selective strengthening succeeds vs fails across *disinhibitory network parameters*, *time constants*, and *reward rules* (covariance, gated Hebbian)
]

== Master's thesis. Dr. Koo, Cooper Union.

#short[
- *Chopper-stabilized capacitive-feedback preamp* in *TSMC 65nm* for *ECoG and LFP recording* (*1 Hz–1 kHz*)
- *26.7 dB gain*, *1.6 µVrms noise*, *2.3 µW at 0.8 V*
- *PEF 8.7*: lowest among published chopper capacitive-feedback amplifiers
]

== NYU Long Lab. Vocal learning in budgerigars.

#short[
- *Signal processing and ML pipelines* for budgerigar vocalizations
- *ROS2-based robotic tutor bird* for *minimally supervised vocal learning experiments*
]

== Mount Sinai. Dr. Iloreta, surgical ML.

#short[
- *YOLO surgical instrument detection* in endoscopic sinus and skull-base procedures (*96.4% precision, 94.8% recall*)
- Extending to *procedural metrics* (instrument usage time, swap frequency) for a *novel suction device* study
- *Ergonomics studies of ENT surgeons* with *IMU and EMG arrays*
]

== Mili Shah. Robotics lab.

#short[
- Lead a *nine-person team* on an *ultra-low-cost mobile robot* for disposable field exploration
- Designed its *integrated motor-control, IMU, camera, and power PCB*
- Previously led a *dual-arm robot* with *ROS2 motion planning and browser teleoperation*
]

== PwC. Summer 2024.

#short[
- *PwC Seoul*, *Hanwha TotalEnergies* engagement
- *Time-series forecasting* for three-month petrochemical predictions
- *Django pipeline refactor* for *MongoDB to ClickHouse migration*
- *Article aggregation service* feeding an *LLM sentiment pipeline*
]
