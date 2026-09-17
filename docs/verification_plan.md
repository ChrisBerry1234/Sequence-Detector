# Sequence Detector Verification Plan

## 1. Purpose

The purpose of this verification plan is to define how the VHDL sequence detector will be tested to ensure that its behavior matches the documented requirements and FSM design.

Verification will be performed through behavioral simulation using a VHDL testbench.

---

## 2. Verification Objectives

The verification process shall confirm that:

* The FSM initializes correctly.
* The FSM transitions correctly for `Din = 0`.
* The FSM transitions correctly for `Din = 1`.
* The target sequence is correctly detected.
* `ERR` asserts when the target sequence is detected.
* `ERR` does not assert for incorrect sequences.
* State transitions occur synchronously with the clock.
* The detector can process multiple input sequences.

---

## 3. Verification Method

The design will be verified using:

* VHDL testbench
* Clock generation
* Reset stimulus
* Serial input stimulus
* Expected output checking
* Simulation waveform analysis

The testbench will apply known input sequences to the DUT (Device Under Test) and compare the observed behavior against the expected FSM behavior.

---

## 4. Device Under Test

The Device Under Test (DUT) is:

```text
rtl/sequence_detector.vhd
```

The testbench will connect to the DUT through its defined interface:

```text
             ┌─────────────────────────┐
             │                         │
    CLK ────►│                         │
    Din ────►│   Sequence Detector     │────► ERR
             │                         │
             └─────────────────────────┘
                        DUT
```

---

## 5. Test Cases

### Test Case 1 — Reset

**Purpose:** Verify that the FSM initializes to the defined starting state.

**Stimulus:**

1. Assert reset.
2. Apply a clock cycle.
3. Release reset.
4. Observe the FSM behavior.

**Expected Result:**

The FSM begins operation from the defined initial state.

---

### Test Case 2 — First Input Bit

**Purpose:** Verify the FSM response to the first input bit of the target sequence.

**Stimulus:**

Apply:

```text
Din = 1
```

**Expected Result:**

The FSM transitions from the initial state to the state representing the first matched bit.

---

### Test Case 3 — Partial Sequence

**Purpose:** Verify that the FSM correctly tracks a partially matched sequence.

**Stimulus:**

Apply:

```text
Din = 1 → 1 → 1
```

**Expected Result:**

The FSM progresses through the states representing the first, second, and third matched bits.

`ERR` shall remain deasserted.

---

### Test Case 4 — Complete Target Sequence

**Purpose:** Verify detection of the target sequence.

**Stimulus:**

Apply:

```text
Din = 1 → 1 → 1 → 0
```

**Expected Result:**

The FSM recognizes the complete target sequence and asserts:

```text
ERR = 1
```

---

### Test Case 5 — Incorrect Sequence

**Purpose:** Verify that an incorrect sequence does not generate a false detection.

**Stimulus:**

Apply sequences that do not contain the target pattern.

Example:

```text
0000
1010
1101
```

**Expected Result:**

`ERR` shall remain deasserted unless the target sequence is actually detected.

---

### Test Case 6 — Partial Match Followed by Incorrect Bit

**Purpose:** Verify that the FSM correctly handles a partial sequence that is interrupted by an incorrect input.

**Stimulus:**

Example:

```text
1 → 1 → 0
```

**Expected Result:**

The FSM shall transition according to the documented state transition table and shall not assert `ERR`.

---

### Test Case 7 — Multiple Sequences

**Purpose:** Verify that the detector can continue processing input after a detection.

**Stimulus:**

Apply multiple sequences consecutively.

Example:

```text
1110 → 0000 → 1110
```

**Expected Result:**

The detector shall correctly identify each occurrence of the target sequence.

---

## 6. Verification Matrix

| Requirement                  | Test Case | Expected Result               |
| ---------------------------- | --------- | ----------------------------- |
| Correct reset behavior       | TC-01     | FSM enters initial state      |
| Correct first-bit transition | TC-02     | FSM enters first-match state  |
| Correct partial matching     | TC-03     | FSM follows expected states   |
| Target sequence detection    | TC-04     | `ERR = 1`                     |
| No false detection           | TC-05     | `ERR = 0`                     |
| Incorrect partial sequence   | TC-06     | FSM recovers correctly        |
| Multiple detections          | TC-07     | Each target sequence detected |

---

## 7. Waveform Verification

The simulation waveform shall be inspected to verify:

* `CLK`
* `Din`
* FSM state
* `ERR`

The waveform should demonstrate that state changes occur on the appropriate clock edge and that `ERR` corresponds to the detection of the target sequence.

Example:

```text
CLK    ─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐
        └─┘ └─┘ └─┘ └─┘

Din    ──1──1──1──0────────

State  S0 S1 S2 S3 S4

ERR    ─────────────1──────
```

---

## 8. Pass Criteria

The design passes verification when:

* All required state transitions behave as specified.
* The target sequence is detected correctly.
* `ERR` asserts at the expected time.
* Incorrect sequences do not produce false detections.
* Reset behavior is correct.
* Multiple input sequences can be processed correctly.
* Simulation results agree with the documented state transition table.

---

## 9. Verification Environment

Simulation will be performed using a VHDL-compatible simulator such as ModelSim or Questa.

The RTL may subsequently be synthesized and analyzed using Intel Quartus Prime.

---

## 10. Verification Artifacts

The following artifacts will be produced:

```text
tb/
└── sequence_detector_tb.vhd

sim/
└── waveforms/
    └── sequence_detector_waveform.png
```

These artifacts provide executable and visual evidence that the RTL implementation satisfies the design requirements.
