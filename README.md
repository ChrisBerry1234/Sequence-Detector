
# Sequence Detector Design
## Overview

This project implements a Finite State Machine (FSM) based sequence detector capable of identifying a predefined binary sequence from a serial input stream. The detector continuously monitors incoming bits and asserts an output(ERR) when the target sequence is identified and matches with the particular binary sequence. 

The design demonstrates fundamental digital design concepts including:

Finite State Machines (FSMs)
State encoding
State transitions
Combinational logic
Sequential logic
D Flip-Flops
Hardware implementation of pattern recognition


## Objective

The objective of this project is to design and implement a sequence detector that:

Monitors a serial binary input stream
Detects a specified bit pattern
Generates an output when the pattern is recognized
Utilizes a finite state machine architecture
Demonstrates the relationship between state diagrams, state tables, and hardware implementation
Differences between designing physical systems and designing FSM based on state memory

## Target Sequence

Example:

Target Sequence: 1110
When the detector receives the sequence 1110, the output signal is asserted.
