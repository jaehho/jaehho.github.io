#set page(
  paper: "us-letter",
  margin: (x: 0.85in, top: 0.75in, bottom: 0.8in),
  numbering: "1 / 1",
)

#set text(
  font: "New Computer Modern",
  size: 10.5pt,
)

#set par(
  leading: 0.75em,
  spacing: 1.05em,
  justify: true,
)

#show heading.where(level: 1): it => block(below: 0.9em, above: 1.6em)[
  #set text(size: 15pt, weight: "bold")
  #it.body
  #v(-0.25em)
  #line(length: 100%, stroke: 0.8pt + rgb("#222"))
]

#show heading.where(level: 2): it => block(below: 0.6em, above: 1.15em)[
  #set text(size: 12pt, weight: "bold", fill: rgb("#1a1a1a"))
  #it.body
]

#show heading.where(level: 3): it => block(below: 0.35em, above: 0.85em)[
  #set text(size: 10.5pt, weight: "bold", style: "italic", fill: rgb("#333"))
  #it.body
]

#set list(spacing: 0.8em, indent: 0.9em)
#set enum(spacing: 0.8em, indent: 0.9em)

#let short(content) = block(
  fill: rgb("#f4f4f4"),
  stroke: (left: 2.5pt + rgb("#444")),
  inset: (left: 0.85em, right: 0.85em, top: 0.65em, bottom: 0.65em),
  width: 100%,
  radius: 2pt,
  spacing: 1.1em,
  content,
)

#let qa(q, a) = block(below: 1em, above: 0.5em)[
  *Q.* #q \
  *A.* #a
]

#align(center)[
  #text(15pt, weight: "bold")[SpaceX Starshield — Electrical Design Engineer]
  #v(-0.3em)
  #text(9pt, fill: rgb("#666"))[Read directly. Parenthetical glosses are quick reminders, not things to say aloud.]
]

= Tell me about yourself

I am on track to graduate with a joint bachelor's and master's in electrical engineering this month, and I successfully defended my master's thesis just last week, actually.

The thesis was a fully-differential chopper-stabilized amplifier in 65 nm CMOS. I achieved performance on par with most of the literature that uses similar topologies, and my main contribution was that it uses the lowest supply voltage out of the other designs. I got there by biasing all the signal-path devices in subthreshold, along with some other design choices I can go into further if you'd like.

On a similar note to the thesis, I have more project experience with high-frequency analog design, where I designed a 2.4 GHz BLE differential-to-single-ended op-amp in the same 65 nm process, as well as RF front-end work designing oscillators, mixers, and filters.

On the board side, I've designed a couple of PCBs for various projects, like a wireless pressure sensor and a fully integrated board for a low-cost mobile robot, and I've also worked with a Xilinx ZedBoard for some FPGA projects.

I'd be happy to elaborate on any one of the projects I just mentioned.

= Why SpaceX / Why Starshield

I learned more about Starshield and Starlink in a communication networks course I am taking, where I learned a bit more about Low earth orbit satellites and really what the technology is capable of and I thought that was really interesting and I didn't actually know about starshield until recently, and it really kind of clicked in my mind that the infrastructure that Starlink leverages would be very useful for high security applications that starshield does in fact take advantage of.

The honest answer is that I want to work on hardware where the *failure modes are unforgiving* and *iteration speed actually matters*, and Starshield gives me both. Most EE jobs only let you own a slice of the lifecycle, but the Starshield pitch — *blank-sheet design through bring-up and on-orbit debug* — is the full skill set I've been building toward.

*Mixed-signal communications hardware* also maps directly onto what I've been doing for years: *low-noise analog* in my thesis, *high-frequency analog* in my VLSI op-amp project, and *RF front-end work*. And on the velocity question, I've shipped real boards under *hard external deadlines* and *silicon-quality designs in 65 nm* — I work better under pressure than under ambiguity.

= Project deep-dives

== Master's thesis — chopper cap-feedback pre-amp (Dr. Jabeom Koo)

The chip is a *fully-differential chopper-stabilized capacitive-feedback pre-amp* in *TSMC 65-nm CMOS*, designed for *ECoG and LFP recording* — those are extracellular brain signals at the cortical surface and just below — over *1 Hz to 1 kHz*. It runs from a *0.8 V supply*, gives *26.7 dB of gain* with *1.60 µVrms input-referred noise*, and draws *2.30 µW*. That works out to an *NEF of 3.3* (noise efficiency factor — input noise normalized against an ideal bipolar-pair drawing the same current at the same bandwidth) and a *PEF of 8.7* (power efficiency factor — NEF squared times Vdd). The contribution is that it has the *lowest supply voltage* and the *lowest PEF* among published chopper cap-feedback amplifiers.

=== Key design choices (be ready to defend each)

The first one is *biasing all the signal-path devices in subthreshold*. That *maximizes gm/Id* (transconductance per unit current — basically how much amplification you get for the current you spend), which is what you want at fixed power if you care about noise efficiency. Above threshold, you keep burning current without buying much more gm.

The second is using *NMOS for the second stage* instead of PMOS. NMOS has *higher µ* (carrier mobility — electrons in silicon move faster than holes), so for the same current you get more gm, which translates to a *better noise-power tradeoff*.

The third is letting the *CMFB loop* (common-mode feedback — the loop that pins the output common-mode level at DC) *set the branch current through equilibrium*, instead of using a separate bias generator. That *removes mismatch sources* and *saves headroom*, which matters a lot at 0.8 V.

The fourth is the most subtle one. In 65 nm at low Vdd, the *gate leakage through the MOS pseudo-resistors* in the CMFB sense network ends up on the *same order as the loop's drive current*, so if you size the resistors too large the common-mode point drifts. I *sized them so the leakage is small relative to the CMFB drive*, and verified it across *PVT corners* (process-voltage-temperature — the standard sign-off variation sweep).

The last one is the *chopping itself*. You *modulate the input up past the 1/f corner* (the frequency where flicker noise rolls off and only thermal noise is left), *amplify it where the noise floor is clean*, then *demodulate back down to baseband*. The 1/f noise that lived at DC ends up at the chop frequency and gets filtered out. That's where the *PEF improvement* comes from.

=== Likely follow-ups

If they ask why *capacitive feedback rather than resistive*, the *input cap blocks DC offsets* coming from the electrodes, the *gain is set by the C1 over C2 ratio* (capacitor ratios match better than resistor ratios in CMOS), and the *feedback element doesn't add thermal noise* on its own.

If they ask for the NEF formula, it's $"NEF" = V_("rms,in") sqrt((2 I_"tot") / (pi V_T dot.c 4 k T dot.c "BW"))$ — *input-referred noise normalized against an ideal BJT pair* drawing the same current at the same bandwidth.

If they ask what I'd change, I'd look at *current-reuse or inverter-based input pairs* to push PEF lower, and I'd add *auto-zeroing alongside the chopping* for offset cancellation.

For verification, it was *schematic and extracted simulation in Cadence*, with *corner sweeps and Monte Carlo runs* for offset and CMRR (common-mode rejection ratio).

== VLSI 2.4 GHz BLE differential op-amp

This was a *differential-to-single-ended op-amp* targeted at the *BLE band* — Bluetooth Low Energy at 2.4 GHz — in the same *65 nm process*. It hits *24 dB of gain at 2.4 GHz* with a *10.2 GHz unity-gain frequency* under *500 µW*. The layout is *full M1 through M9* (using all nine metal layers in the stack) and it's both *LVS clean and DRC clean* — those are the layout-versus-schematic and design-rule checks, the two main sign-off verifications.

=== Be ready to discuss

The main design tradeoff is between *gain, GBW* (gain-bandwidth product, basically how fast and how much you can amplify), *and power*. GBW is roughly *gm divided by 2π times CL* (the load capacitance), so you push gm up by either driving more current or making the input transistors wider, and you push CL down by making the next stage or the output cap smaller.

On why differential-to-single-ended in particular: the differential input gives you *CMRR and supply-noise rejection*, and then you convert to single-ended for whatever block comes after.

The layout pain points were *matching the input pair* using *common-centroid placement and dummy devices*, putting *guard rings* around sensitive nodes, and dealing with *parasitic-extracted simulation shifting the pole locations* from where the schematic-only sim said they'd be.

For stability, I closed the loop in AC simulation and *checked phase margin* directly.

== RF front end (Colpitts + mixer + LPF)

This was a *discrete RF receive chain*. A *Colpitts oscillator* (an LC oscillator where a capacitive divider sets the feedback ratio) and an *RC oscillator* together generated a *4.1 MHz local oscillator* signal, which then went into a *single-balanced active mixer* to *down-convert a 3.63 MHz RF signal*. After the mixer, a *passive low-pass filter at 1.6 MHz* cleaned up the high-frequency harmonics. I simulated everything in *LTspice* with MOSFETs, op-amps, coupling caps, and a crystal model.

=== Be ready to discuss

I picked *Colpitts over Hartley* because the *capacitive divider is easier to bias* at low cost and the *tank Q ends up dominated by the inductor* either way.

On the mixer choice, *single-balanced rejects RF leakage* to the IF output but not LO leakage. *Double-balanced* (the Gilbert-cell topology) *rejects both*, at the cost of more devices and a higher noise figure. Single-balanced was sufficient for what we were building.

The figures of merit they're likely to ask about are *conversion gain*, *noise figure* (NF — how much noise the mixer adds on top of the input noise), and *IIP3* (input third-order intercept — how linear the mixer stays before two close-spaced tones start mixing into in-band products). *Gain and linearity trade off* against each other.

== Robot PCB (Mili Shah lab)

This was a single board integrating *motor control*, an *IMU* (inertial measurement unit — a gyro plus accelerometer chip), a *camera interface*, and *power management* for an *ultra-low-cost mobile robot*. Multi-rev, currently in use by the *six-person student team I lead*.

=== Be ready to discuss

For *power architecture*, the question is which rails are *LDO* (low-dropout linear regulator — clean output but lossy when you're stepping down a lot of voltage) and which are *buck* (a switching regulator — efficient but introduces switching noise). *Analog and noise-sensitive rails want LDOs*, *digital and high-current rails want switchers*, and you often *cascade the two* so the switcher drops the bulk efficiently and an LDO downstream cleans up the analog rail.

For *ground topology*, modern boards run a *solid plane* and let the *high-frequency return current flow under the trace through mutual inductance* — splitting the plane interrupts that path and usually causes more problems than it solves.

For *signal integrity*, the *I2C and SPI routing didn't need length matching* at the speeds we ran, but the *high-speed camera lines did*. *EMI containment* came from keeping return paths tight and shielding where it actually mattered.

For *bring-up*, I do *power rails first with a current-limited supply*, scoping each rail under no-load and load. Then *clocks and resets*, then the *comm interfaces*, then *functional bring-up of each subsystem* one at a time.

= Technical Q&A — high-probability topics

== Op-amps and analog basics

#qa[What is the GBW of an op-amp?][
GBW stands for *gain-bandwidth product*. For a single-pole op-amp, it's the *open-loop DC gain multiplied by the dominant pole frequency*, which also happens to *equal the unity-gain frequency* (the frequency where the open-loop gain crosses 1). In a closed-loop configuration, your *bandwidth is roughly GBW divided by your closed-loop gain* — so a 1 GHz GBW amp configured for a gain of 10 gives you about 100 MHz of bandwidth. *Slew rate is a separate thing* — that's a large-signal limit set by how much current the output stage can dump into the load capacitance.
]

#qa[What's the difference between being bandwidth-limited and slew-rate-limited?][
*GBW is small-signal* — it's the linear behavior set by the dominant pole. *Slew rate kicks in for big, fast signals*, when the dV/dt at the output exceeds the maximum current the output stage can source divided by the load capacitance. *Square waves with fast edges* hit the slew limit way before they hit GBW.
]

#qa[Why differential signaling?][
Three reasons. First, *common-mode noise rejection* — anything that couples equally onto both lines cancels at the receiver. Second, you *double the signal swing* for a given supply. And third, *lower EMI emission*, because if you route the pair tightly the return currents cancel out in the far field.
]

#qa[What is CMRR and why does it matter?][
CMRR is *common-mode rejection ratio* — the *differential gain divided by the common-mode gain*, usually quoted in dB. A high CMRR means the amp *ignores anything that appears equally on both inputs*, so *power-supply noise, ground bounce, and inductive pickup* all get suppressed. In a noisy environment, CMRR is what keeps your signal clean.
]

#qa[What kinds of noise show up in an analog circuit?][
Three big categories. *Thermal noise* is white and fundamental — for a resistor it's *4kTR*, for a MOSFET it's roughly *4kTγ over gm* — and you can only beat it by averaging or by burning more current to raise gm. *Flicker noise*, also called *1/f* because its power rolls off as 1 over frequency, is surface-related in MOSFETs and *dominates at low frequencies*; *chopping or auto-zeroing eliminates it* from the signal band. And *shot noise* comes from the Poisson statistics of discrete carriers crossing a junction — it's *dominant in BJTs* (bipolar junction transistors) and photodiodes.
]

#qa[What does chopper stabilization do, and why?][
You *modulate the input signal up to a frequency above the 1/f corner* (the frequency where flicker noise drops below thermal noise), *amplify it there where the noise floor is clean*, then *demodulate it back down to baseband*. The 1/f noise that lived at DC ends up at the chop frequency, where you filter it out. The catch is that *chopping injects switching spikes*, *demands bandwidth headroom* in the amplifier, and *creates offset from charge injection* at the switches.
]

== Power and PCB

#qa[LDO vs switching regulator?][
*LDOs* (low-dropout linear regulators) are *low-noise and have no switching ripple*, but their *efficiency is just Vout over Vin* — so if you're dropping a lot of voltage, you're burning that as heat. They go on *analog and RF rails where noise matters*. *Switching regulators* (*buck* for stepping down, *boost* for stepping up) are *efficient across wide voltage ratios*, but they *generate switching ripple and EMI* that you have to manage. Those go on *digital and high-current rails*. A common pattern is to *cascade them* — the switcher drops the bulk efficiently, then an LDO downstream cleans up the analog rail.
]

#qa[How do you choose decoupling capacitors?][
You want *low impedance across the frequency range where the load draws current*, and *no single cap covers everything* because each capacitor has a *self-resonance* — beyond that, *its inductance dominates* and it stops acting like a capacitor. The standard recipe is *bulk capacitance for low frequency* (10 to 100 µF tantalum or electrolytic), *mid-range capacitance* (1 to 10 µF ceramic), and *high-frequency capacitance* (100 nF and 10 nF *MLCCs* — multilayer ceramic capacitors — placed *as close to the IC pin as you can manage*). The *tighter the loop* between the cap, the pin, and the return path, the lower the inductance and the better the high-frequency decoupling.
]

#qa[Why does decoupling cap placement matter so much?][
Because the *loop inductance* between the cap, the IC pin, and the ground return sets the *impedance at high frequency*. A 100 nF cap five millimeters from the pin with a long via stub *looks inductive at 100 MHz* and does nothing for fast-edge transients. *Tight placement with short returns* is what makes the cap actually work.
]

#qa[Star ground vs ground plane?][
*Star ground* is for *low-frequency mixed-signal* where you want *explicit control over where return currents go* — one node ties analog and digital ground together. *Ground plane* is for *high-frequency*, because the *return current naturally flows underneath the trace through mutual inductance*, and you don't want to interrupt that path. Modern boards almost always use a *solid plane* and partition through *component placement* rather than slotting the plane.
]

#qa[What's controlled-impedance routing and when do you need it?][
Once the *trace's electrical length is a meaningful fraction of the signal's rise time*, the *trace acts like a transmission line*, and you have to *match the source and load impedance to the trace's characteristic impedance* to avoid reflections. The rule of thumb is that *if the propagation time down the trace is more than about a sixth of the rise time*, treat it as a transmission line. *Microstrip* is a trace over a plane, *stripline* is a trace sandwiched between two planes — the impedance is set by *trace width, dielectric thickness, and εr* (the dielectric constant of the board material).
]

== Digital / high-speed

#qa[What are setup and hold time? What causes a violation?][
*Setup* is how long the *data has to be stable before the clock edge*, and *hold* is how long it has to *stay stable after the edge*. *Setup violations* come from *too much combinational delay between flops* — the data hasn't arrived in time. *Hold violations* come from *too little delay* — the data races through and changes before the destination flop has captured the previous value. Both are *timing-closure problems*, and the synthesis tool flags them.
]

#qa[What is metastability and how do you handle it?][
When you *violate setup or hold* — typically by sampling an *asynchronous input* — the flop's output can *sit between a 0 and a 1 for an unbounded time* before resolving to one or the other. The standard mitigation is a *synchronizer chain*: *two or more flops in series in the destination clock domain*, so any metastable state has time to settle before downstream logic sees it. *MTBF* (mean time between failures) *improves exponentially with each added stage*. For *multi-bit data crossing domains*, you *never synchronize the bits independently* — you use a *handshake or an asynchronous FIFO* so the receiver only sees a stable snapshot.
]

#qa[How do you cross clock domains safely?][
*Single-bit control signals* get a *two-flop synchronizer*. *Multi-bit data* uses an *asynchronous FIFO with Gray-coded read and write pointers* — *Gray code only changes one bit per increment*, so even if you sample a pointer mid-transition you get either the old value or the new one, *never garbage*. The other option is a *full request-acknowledge handshake*, which is simpler but slower.
]

#qa[What's special about routing DDR4?][
*DDR4* — the fourth-generation double-data-rate DRAM interface — is *timing-tight*. Within a *byte lane*, the *data lines and the strobe (DQ and DQS)* need to be *length-matched to within tens of mils*; between byte lanes, the matching can be looser. The *command, address, and clock lines* use a *fly-by topology with on-die termination*, plus *write leveling* to compensate for the staggered arrival times at each chip. The *reference plane has to be solid* under the entire interface, the *impedance is controlled* (typically *40 Ω single-ended and 80 Ω differential*), and on stack-ups with a lot of layers you *back-drill the via stubs* to stop them from acting as resonators.
]

#qa[What's a SerDes? What problems does it solve?][
*SerDes* stands for *serializer/deserializer* — it *takes a wide parallel bus and turns it into a single high-rate serial differential pair*, then turns it back at the other end. It solves three things at once: *pin count goes way down*, *no skew between parallel lines*, and *EMI is easier to control on a single tight pair*. Inside, you have *line coding* (*8b/10b or 64b/66b* — schemes that keep the line *DC-balanced and embed a clock* you can recover), *CDR* (clock data recovery — the receiver locks its sampling clock to the incoming data edges), and *equalization* (*FFE and DFE* — feed-forward and decision-feedback equalizers that compensate for channel loss). The *eye diagram* is how you visualize whether the link is going to work.
]

#qa[What do you look for in an eye diagram?][
You want a *wide-open eye*. The vertical opening — *eye height* — is your *voltage margin against noise*. The horizontal opening — *eye width* — is your *timing margin against jitter*. Both *random and deterministic jitter* eat into the width. The *crossing point* tells you about duty-cycle symmetry. A *closed eye* means the channel and equalization can't meet your *BER target* (bit error rate).
]

#qa[Why terminate a transmission line, and how?][
You terminate to *absorb the incident wave* so it doesn't reflect off an impedance mismatch and come back as ringing. *Series termination at the source* matches the source impedance and kills reflections at the far end. *Parallel termination at the far end* matches the load to the line and is used for unidirectional point-to-point. *AC termination* is a cap in series with the resistor, which *saves DC power*. *Differential parallel termination* is a single resistor across the pair, which is what *LVDS* (low-voltage differential signaling) and *DDR* use. The right choice depends on *topology, power budget, and signal direction*.
]

== Communication interfaces

#qa[I2C basics?][
*Two wires* — *SCL* for clock, *SDA* for data — both *open-drain with pull-up resistors* that you size to trade *rise time against static current*. *Multi-master and multi-slave*, with *seven- or ten-bit addressing* and an *ACK or NACK after each byte*. The speeds are *100 kHz standard*, *400 kHz fast*, *1 MHz fast-plus*, and *3.4 MHz high-speed*. The big things to watch out for are *bus capacitance limiting your speed*, *address conflicts between devices*, and *recovery when a slave is stuck holding the line low*.
]

#qa[SPI basics?][
*Four wires* — *SCLK* (clock), *MOSI* (master-out-slave-in), *MISO* (master-in-slave-out), and *CS* (chip select). *Full-duplex, no addressing*, with *one chip select per slave*. The four modes are set by *CPOL* (clock polarity at idle) and *CPHA* (whether to sample on the leading or trailing edge). It's *a lot faster than I2C* and *doesn't need pull-ups*, but the *pin count grows linearly with the number of slaves*.
]

#qa[UART basics?][
*Asynchronous*, meaning there's *no shared clock line*. Just *transmit and receive single-ended*, with both ends *agreeing on the baud rate to within about five percent*. Each frame is a *start bit*, then the *data bits* (usually eight), an *optional parity bit*, and *one or two stop bits*. You use it when you have *just one peer* to talk to and don't want to spend a clock pin.
]

#qa[Ethernet at the board level?][
The *MAC* (media access controller — the digital block that handles packet framing) lives in the *SoC or FPGA*, and it talks to a *PHY* (the physical-layer chip — mixed-signal) over an interface like *MII, RMII, RGMII, or SGMII* depending on the speed. The PHY *drives the magnetics and the connector*. For *gigabit Ethernet*, *RGMII* is the common reduced-pin interface, but it's *sensitive to clock-data skew* and you usually have to *set an internal delay* (*RGMII-ID*) on either the MAC or the PHY side.
]

== FPGA / digital design

#qa[How does an FPGA work, at a high level?][
It's a *sea of LUTs* (lookup tables — small SRAM-based blocks that implement arbitrary combinational logic) and *flip-flops*, connected by a *routing fabric whose configuration is itself programmed by SRAM*. On top of that, the chip has *hard blocks* for things you don't want to implement in fabric — *BRAM* (block RAM), *DSP slices* for multipliers, *SerDes*, and *PLLs*. *Synthesis maps your HDL into LUTs and flops*, *place-and-route picks specific resources and routes the connections*, and the *bitstream programs all of it at power-on*.
]

#qa[Synchronous design rules you live by?][
*One clock per domain*, or *carefully controlled crossings* if you have more than one. *All flops in a domain share one edge*. *No combinational loops*. *No latches unless you really meant to* make a latch. And a *reset strategy that's declared and consistent* — usually *synchronous deassertion*, even if the assertion itself is asynchronous.
]

== Test, debug, bring-up

#qa[How do you bring up a new board?][
*Visual inspection first* — solder bridges, missing components, wrong polarities. Then *power rails, in sequence, with a current-limited supply* — *scope each rail under no load and under load*, and *verify the sequencing* if multiple rails come up in a specific order. Then *clocks and resets* — confirm frequency, edge quality, and that *resets release in the right order*. Then the *comm interfaces* — scope the handshakes and check for ACKs. Then *functional bring-up of each subsystem, one at a time*.
]

#qa[Walk me through how you'd debug an unexpected signal on a board.][
First step is to *make it deterministic* — if the failure is intermittent, force it to reproduce. Then *localize*: scope as close to the source as possible, and walk back toward the cause. *Hypothesize and falsify* — what could cause this signal? *Check the simplest things first*, like a loose connection, a bad solder joint, or a wrong-stuffed component. *Read the schematic and the datasheet*, not just the symptom on the scope. And *don't trust intermittent fixes* — if you don't understand why it works now, you don't actually know it works.
]

#qa[Scope probe choice?][
A *10× passive probe* is the default for general work — *high impedance*, but the *bandwidth tops out around 500 MHz*. For high-speed signals you want an *active probe*, which has *lower input capacitance* and loads the node less. *Differential probes* are for *floating or differential nodes*, and *current probes* (*Rogowski coils or clamps*) let you *measure current without breaking the loop*. The *probe bandwidth should be at least 5× the signal bandwidth*, or equivalently, the probe's rise time should be much shorter than the signal's.
]

== Space-environment basics (good to have)

#qa[What's the difference between SEU, SEL, and TID?][
*SEU* is *single-event upset* — a high-energy particle *flips a bit somewhere*. It's *soft, recoverable by re-writing the value*, and the standard mitigations are *ECC* (error-correcting codes), *memory scrubbing*, and *TMR* (triple-modular redundancy — three copies and a vote). *SEL* is *single-event latchup* — a particle *triggers a parasitic SCR in the silicon* and locks the device in a high-current state, which is *destructive if you don't power-cycle* in time. The mitigations there are *rad-hardened processes, current limiting, and watchdogs*. *TID* is *total ionizing dose* — *cumulative radiation damage* that *shifts threshold voltages and increases leakage* over the mission lifetime. The mitigations are *shielding, derating, and rad-tolerant parts*.
]

#qa[Why is thermal design different in space?][
There's *no convection*, so the only heat-transfer paths are *conduction through the chassis* and *radiation to space*. You have to *design the entire thermal path* from the *silicon die through the package, into the board, into the chassis, and out to a radiator*. *Thermal cycling between sun and eclipse* stresses solder joints, which makes *CTE matching* (coefficient of thermal expansion — how much different materials expand and contract with temperature) a *reliability issue*.
]

= Behavioral stories

== Extreme ownership — scaling the Mili Shah robot team

The team I lead in Dr. Shah's lab grew from *two students to nine in a single semester* after a new robot project kicked off. As *project lead*, I *split the work into parallel subteams* so people weren't blocking each other, and I changed how I onboarded the new students. The naive approach would have been to *teach them first and then hand them tasks*, but that would have stalled the project. What worked was a *fast tool tour and then folding them into the real work alongside me*. One freshman *learned PCB design by researching datasheets and circuit architectures with me on the actual robot board* — *the project moved forward at the same time he got trained*.

== Debug story — chopper amp CMFB at 0.8 V

At *0.8 V* with all the signal-path devices in *subthreshold*, the *common-mode point of the CMFB loop was drifting in extracted simulation*, even though the *schematic-only sim looked clean*. After working through it, the root cause turned out to be *gate leakage through the MOS pseudo-resistors in the CMFB sense network*. At that low Vdd, the *leakage current was on the same order as the loop's drive current*. The fix was *resizing those resistors so the leakage was small relative to the CMFB drive*, and I verified the fix *across PVT corners and with Monte Carlo runs*.

== Fast-paced delivery — Exo Games PCB

The *wireless piezoresistive pressure-sensor PCB* I designed for the *2024 ASTM Exo Games* had a *hard external deadline*. *Schematic, layout, fab, assembly, and bring-up* — all on a small student team. We *shipped working hardware to the demo on time*.

== Cross-functional — Mount Sinai surgical-instrument detection

At Mount Sinai's *ENT department*, I worked *directly with the surgeons* to label the data, define what counted as an *"instrument event" clinically*, and decide which procedural metrics actually mattered to them. The detection pipeline I built ended up at *96.4% precision and 94.8% recall*. The lesson I took away from that project was that *the bottleneck wasn't the model* — it was *making sure the spec matched what the surgeons actually wanted to measure*.

== Fast learner — picking up new stacks under deadline

At *PwC Seoul* on the *Hanwha TotalEnergies* engagement, I was put on a stack I hadn't used before — *Django* for the backend, *ClickHouse* for the database, and *GluonTS, Chronos, and Darts* for the time-series forecasting (those last three are open-source forecasting libraries from Amazon and others). *Three months, three deliverables*: forecasting models, a Mongo-to-ClickHouse pipeline migration, and an LLM-driven article-aggregation service. The pattern I trust is *reading the documentation, building a minimal end-to-end version fast, and then deepening it*.

= Questions to ask

What does the *full lifecycle of a Starshield board* look like, from blank-sheet to on-orbit, and *where does an entry-level designer typically pick up ownership first* — schematic, layout, bring-up, or test?

How does *on-orbit troubleshooting actually work in practice* for a board that's already deployed? What's the *loop between ground-side telemetry and the design team*?

What's the *design review cadence*? How often are you in front of peers defending decisions, versus *heads-down designing*?

What are the *biggest open hardware problems on Starshield right now* that you wish you had more people on?

What's the *team culture* like — *how autonomous is the work*, and *how often do designers cut across into firmware, mechanical, or manufacturing*?

= CV elaborations (in case asked)

== Master's thesis — Dr. Jabeom Koo, Cooper Union

A *chopper-stabilized capacitive-feedback pre-amp* in *TSMC 65-nm CMOS*, designed for *ECoG and LFP recording* over *1 Hz to 1 kHz*. *26.7 dB gain*, *1.60 µVrms input-referred noise*, *2.30 µW* from a *0.8 V supply*, *NEF of 3.3* and *PEF of 8.7*. The contribution is the *lowest supply voltage* and the *lowest PEF* among published chopper cap-feedback amplifiers, achieved by *biasing the signal path in subthreshold*, *using NMOS for the second stage*, *letting CMFB set the branch current through equilibrium*, and *sizing the CMFB resistors against gate leakage*.

== VLSI 2.4 GHz BLE op-amp

A *differential-to-single-ended op-amp* in *TSMC 65-nm*, designed in *Cadence Virtuoso*. *24 dB gain at 2.4 GHz*, *10.2 GHz unity-gain frequency*, *under 500 µW*. *Full M1 through M9 layout* — both *LVS and DRC clean*.

== RF front end

*Colpitts and RC oscillators* generating a *4.1 MHz local oscillator*, a *single-balanced active mixer* down-converting a *3.63 MHz RF signal*, and a *passive low-pass filter at 1.6 MHz* to clean up the harmonics. Simulated end-to-end in *LTspice* with MOSFETs, op-amps, coupling caps, and a crystal model.

== Mili Shah lab — PCBs and robotics, Cooper Union

I lead a *six-person team* on an *ultra-low-cost mobile robot* for disposable field exploration, and I designed its *integrated motor-control, IMU, camera, and power-management PCB*. Earlier work in the lab includes a *wireless piezoresistive pressure-sensor PCB* that we presented at the *2024 ASTM Exo Games*, and a *dual-arm robot* project with *ROS2 motion planning and browser-based teleoperation*.

== Flappy Bird FPGA

I built the game in *Verilog* on a *Xilinx ZedBoard* — *combinational and sequential logic for collision detection and randomized pipe generation*.

== Mount Sinai — Dr. Iloreta, surgical ML

I trained a *YOLO object-detection model* for *surgical instrument recognition in endoscopic sinus and skull-base procedures*, hitting *96.4% precision and 94.8% recall*. We're now extending that to *procedural metrics — instrument usage time and swap frequency*. I'm also conducting *quantitative ergonomics studies of ENT surgeons* using *IMU (Opal V2R inertial sensors)* and *EMG (FREEEMG muscle-activity sensors)* arrays.

== PwC Seoul — Hanwha TotalEnergies (summer 2024)

I built *time-series forecasting models* in *GluonTS, Chronos, and Darts* for *three-month petrochemical predictions*, *refactored Django pipelines for a Mongo-to-ClickHouse migration*, and built an *article-aggregation service that fed an LLM-driven sentiment pipeline*.

= If asked about gaps

== "Do you have professional EE experience?"

My *PwC internship was actually data and AI work, not EE*. My EE experience is *academic and research* — *silicon-quality design in 65 nm* for the thesis, *multiple PCBs that went to physical builds and demos*, and *FPGA bring-up*. The closest professional analog is the *velocity and deadline pressure* I shipped under at PwC and at the Exo Games — and *I'd carry that into hardware here*.

== "DDR4? Multi-GHz SerDes? Ethernet PHY?"

I *haven't designed a board with DDR4 or multi-GHz SerDes in production*. I do *understand the theory* — *length matching, fly-by topology, 8b/10b coding, eye diagrams, equalization* — and I've *worked at 2.4 GHz in Cadence* and on *RF down-conversion at MHz scale*. I'd *expect to ramp on those interfaces fast*; that's the *read-the-doc-and-build pattern* I default to.
