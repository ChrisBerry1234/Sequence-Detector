# Sequence Detector Requirements

## 1. Purpose

The purpose of this design is to implement a synchronous finite state machine capable of detecting a predefined binary sequence from a serial input stream.

The design shall assert the `ERR` output when the complete target sequence has been received.

---

## 2. Functional Requirements

The sequence detector shall:

1. Accept a serial 1-bit input `Din`.
2. Monitor `Din` synchronously with the system clock.
3. Maintain an internal FSM state representing the input sequence history.
4. Transition between states based on the current state and value of `Din`.
5. Assert `ERR` when the target sequence is detected.
6. Keep `ERR` deasserted when the target sequence has not been detected.
7. Return to the appropriate FSM state following sequence detection.

---

## 3. Target Sequence

The target sequence for this implementation is:

```text
1110
```

The detector shall recognize the four-bit sequence:

```text
1 → 1 → 1 → 0
```

Upon detection of the complete sequence, the detector shall assert:

```text
ERR = 1
```

---

## 4. Interface Requirements

### Inputs

| Signal | Width | Description         |
| ------ | ----: | ------------------- |
| `CLK`  | 1 bit | System clock        |
| `Din`  | 1 bit | Serial binary input |

### Outputs

| Signal | Width | Description               |
| ------ | ----: | ------------------------- |
| `ERR`  | 1 bit | Sequence detection output |

---

## 5. FSM Requirements

The detector shall be implemented as a finite state machine.

Each state shall represent the amount of the target sequence that has been matched.

The FSM shall include states representing:

| State | Description                               |
| ----- | ----------------------------------------- |
| `S0`  | No portion of the target sequence matched |
| `S1`  | First bit matched                         |
| `S2`  | First two bits matched                    |
| `S3`  | First three bits matched                  |
| `S4`  | Target sequence detected                  |

The final state names and encoding shall be documented in:

* [`state-table.md`](state-table.md)
* [`state-encoding.md`](state-encoding.md)

---

## 6. State Transition Requirements

For every possible combination of:

* Current FSM state
* `Din = 0`
* `Din = 1`

there shall be a defined next state.

The complete transition behavior shall be documented in:

[`state-table.md`](state-table.md)

The state diagram shall provide a graphical representation of the same FSM behavior.

---

## 7. Sequential Logic Requirements

The FSM state shall be stored using sequential logic.

State changes shall occur synchronously with the active edge of `CLK`.

Conceptually:

```text
Current State
     │
     │
     ▼
Next-State Logic ◄──── Din
     │
     ▼
Next State
     │
     ▼
D Flip-Flops
     │
     ▼
Current State
```

---

## 8. Output Requirements

`ERR` shall indicate whether the target sequence has been detected.

Normal operation:

```text
ERR = 0
```

When the target sequence is detected:

```text
ERR = 1
```

The expected timing and duration of the `ERR` signal shall be verified through simulation.

---

## 9. Reset Requirements

The FSM shall have a defined initial state.

Following reset, the FSM shall begin operation from the initial/start state.

The reset behavior shall be verified in the testbench.

---

## 10. Verification Requirements

The testbench shall verify:

* Reset behavior
* Initial FSM state
* Every state transition for `Din = 0`
* Every state transition for `Din = 1`
* Correct detection of `1110`
* Correct `ERR` behavior
* Non-target sequences
* Multiple consecutive input sequences
* Clock-synchronous state changes

Simulation results shall be captured as waveform evidence.

---

## 11. Synthesis Requirements

The VHDL design shall:

* Compile successfully
* Elaborate successfully
* Synthesize successfully in Intel Quartus Prime
* Produce an RTL representation consistent with the intended FSM
* Produce a valid synthesized hardware implementation

Quartus RTL and State Machine viewers may be used to inspect the synthesized design.

---

## 12. Acceptance Criteria

The design shall be considered complete when:

* The requirements are documented.
* The FSM state diagram is complete.
* The state transition table is complete.
* State encoding is defined.
* Next-state logic is derived.
* VHDL RTL compiles successfully.
* The testbench executes successfully.
* The target sequence is correctly detected in simulation.
* The `ERR` output behaves as specified.
* Quartus successfully synthesizes the design.
* The synthesized RTL can be compared against the intended FSM architecture.
