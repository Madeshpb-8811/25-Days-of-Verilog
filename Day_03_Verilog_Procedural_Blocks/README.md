# Day 3 – Procedural Combinational Logic

## Overview

Day 3 focused on describing combinational logic using Verilog procedural blocks. The main focus was on `always @(*)`, `if-else` statements, blocking assignments, `reg` outputs, and writing testbenches to verify RTL behavior.

---

## Topics Covered

- `always @(*)` procedural block
- Sensitivity list
- Blocking assignment (`=`)
- `if`, `else if`, and `else`
- `begin` and `end`
- `reg` vs `wire`
- Combinational logic
- Latch inference and incomplete assignments
- Independent `if` statements
- MSB-first comparison
- LSB-based even/odd detection
- Testbench writing
- Waveform verification

---

## 1. One-Bit Comparator

### Description

The one-bit comparator compares two 1-bit inputs, `A` and `B`, and produces three outputs:

- `greater = 1` when `A > B`
- `equal = 1` when `A = B`
- `less = 1` when `A < B`

### Truth Table

| A | B | Greater | Equal | Less |
|---|---|---:|---:|---:|
| 0 | 0 | 0 | 1 | 0 |
| 0 | 1 | 0 | 0 | 1 |
| 1 | 0 | 1 | 0 | 0 |
| 1 | 1 | 0 | 1 | 0 |

### Files

- `one_bit_comparator.v`
- `one_bit_comparator_tb.v`
- `one_bit_comparator_wave.png`

### Waveform

![One-Bit Comparator Waveform](one_bit_comparator_wave.png)

---

## 2. Four-Bit Magnitude Comparator

### Description

The four-bit magnitude comparator compares two 4-bit binary numbers and determines whether:

- `A > B`
- `A = B`
- `A < B`

The comparison concept was studied using the **MSB-first principle**: the first differing bit from the most significant bit determines the result.

### Example

```text
A = 1010
B = 1001
```

The first differing bit determines the result:

```text
A > B
```

### Files

- `four_bit_magnitude_comparator.v`
- `four_bit_magnitude_comparator_tb.v`
- `four_bit_magnitude_comparator_wave.png`

### Waveform

![Four-Bit Magnitude Comparator Waveform](four_bit_magnitude_comparator_wave.png)

---

## 3. Maximum of Four Numbers

### Description

This design finds the maximum value among four 4-bit inputs:

```text
A, B, C, D
```

A temporary variable is initialized with `A` and then updated whenever a larger value is found.

### Algorithm

```text
temp = A

if B > temp
    temp = B

if C > temp
    temp = C

if D > temp
    temp = D

max = temp
```

Independent `if` statements are used so that every input is compared with the latest value of `temp`.

### Files

- `four_number_max.v`
- `four_number_max_tb.v`

No waveform was included because this design was verified logically rather than simulated.

---

## 4. Even/Odd Detector

### Description

The even/odd detector determines whether a 4-bit binary number is even or odd.

The key observation is that only the **least significant bit (LSB)** is required.

```text
LSB = 0 → Even
LSB = 1 → Odd
```

### Truth Table

| LSB | Even | Odd |
|---:|---:|---:|
| 0 | 1 | 0 |
| 1 | 0 | 1 |

### Files

- `even_odd_detector.v`
- `even_odd_detector_tb.v`

No waveform was included because this design was verified logically rather than simulated.

---

## Key Learning

The main learning from Day 3 was how to describe combinational circuits using procedural Verilog.

I learned that:

- `always @(*)` is suitable for combinational procedural logic.
- Signals assigned inside an `always` block are declared as `reg` in Verilog.
- Blocking assignment (`=`) is commonly used for combinational procedural logic.
- Every output should be assigned for all possible conditions to avoid unintended latch inference.
- `begin` and `end` are required when multiple statements belong to an `if`, `else if`, or `else` branch.
- Multi-bit comparison follows the significance of the bits, with the MSB having higher priority.
- The LSB alone can determine whether a binary number is even or odd.
- Testbenches are used to apply inputs and verify the behavior of the RTL.

---

## Day 3 Summary

| Design | RTL | Testbench | Waveform |
|---|---|---|---|
| One-Bit Comparator | ✅ | ✅ | ✅ |
| Four-Bit Magnitude Comparator | ✅ | ✅ | ✅ |
| Maximum of Four Numbers | ✅ | ✅ | — |
| Even/Odd Detector | ✅ | ✅ | — |

### Status

**Day 3 Completed ✅**
