# Sequence Detector Design

## Overview

This project implements a **Finite State Machine (FSM)-based sequence detector** using VHDL.

The detector monitors a serial binary input stream and asserts an output (`ERR`) when a predefined binary sequence is detected.

The project demonstrates the process of translating a digital design specification into an RTL hardware implementation.

---

## Objective

The objective of this project is to:

* Monitor a serial binary input stream
* Detect a predefined bit sequence
* Generate an output when the sequence is recognized
* Design and implement a finite state machine
* Develop a state transition table
* Encode FSM states into binary values
* Derive next-state logic
* Implement the design using VHDL
* Verify the design using simulation
* Analyze the synthesized RTL using Intel Quartus Prime

---

## Target Sequence

**Target Sequence:** `1110`

When the detector receives the complete sequence `1110`, the `ERR` output is asserted.

---

## Design Methodology

The design follows a structured RTL development process:

```text
Requirements
     ↓
State Diagram
     ↓
State Transition Table
     ↓
State Encoding
     ↓
Next-State Logic
     ↓
VHDL RTL
     ↓
Testbench
     ↓
Simulation
     ↓
Quartus Synthesis
```

Each stage of the design is documented separately.

---

## FSM Design

Each FSM state represents the portion of the target sequence that has been successfully matched.

Example state progression:

```text
S0 → S1 → S2 → S3 → S4
```

The complete state definitions and transitions are documented in:

* [`docs/state-diagram.png`](docs/state-diagram.png)
* [`docs/state-table.md`](docs/state-table.md)
* [`docs/state-encoding.md`](docs/state-encoding.md)

---

## RTL Implementation

The FSM is implemented using VHDL RTL.

```text
rtl/
└── sequence_detector.vhd
```

The design uses:

* Sequential logic for state storage
* Combinational logic for next-state determination
* D flip-flop-based state storage
* A synchronous clock
* A detection output (`ERR`)

---

## Verification

The design is verified using a VHDL testbench.

```text
tb/
└── sequence_detector_tb.vhd
```

The testbench verifies:

* Initial/reset behavior
* State transitions
* Input sequences
* Target sequ
