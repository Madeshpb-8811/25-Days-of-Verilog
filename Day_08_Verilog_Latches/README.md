# Day 8 – Verilog Latches

## Objective

Learn and implement **level-sensitive latches** in Verilog, focusing on:

- SR Latch
- D Latch
- Latch memory behavior
- Level-sensitive operation
- Testbench creation
- Waveform analysis

---

## 1. SR Latch

An SR latch has two control inputs:

- **S – Set**
- **R – Reset**

### Truth Table

| S | R | Q |
|---|---|---|
| 0 | 0 | Hold / Memory |
| 0 | 1 | 0 |
| 1 | 0 | 1 |
| 1 | 1 | Invalid |

When both inputs are `0`, the latch retains its previous value.

When `S = 1`, the output is set to `1`.

When `R = 1`, the output is reset to `0`.

The `S = 1, R = 1` condition is treated as an invalid state in this RTL implementation.

### SR Latch Waveform

![SR Latch Waveform](https://github.com/Madeshpb-8811/25-Days-of-Verilog/blob/main/Day_08_Verilog_Latches/SR%20latch/sr_latch_wave.png?raw=true)

---

## 2. D Latch

The D latch uses a single data input and an enable signal.

### Inputs

- **D – Data**
- **EN – Enable**

### Truth Table

| EN | D | Q |
|---|---|---|
| 0 | X | Hold |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

### Working

When **EN = 1**, the latch is transparent:

```text
Q = D
```

Therefore, changes in `D` are reflected at `Q` while enable is active.

When **EN = 0**, the latch holds its previous value, even if `D` changes.

### D Latch Waveform

![D Latch Waveform](https://github.com/Madeshpb-8811/25-Days-of-Verilog/blob/main/Day_08_Verilog_Latches/d_latch/d_latch_wave.png?raw=true)

---

## 3. Important Concept

A **latch is level-sensitive**.

For the D latch implemented in this project:

```text
EN = 1 → Q follows D
EN = 0 → Q holds previous value
```

This is different from a flip-flop, which is **edge-sensitive** and changes its output only at a clock edge.

---

## 4. Verification

The testbenches apply different combinations of inputs and observe the output through simulation waveforms.

Important cases verified:

```text
D = 0, EN = 1 → Q = 0
D = 1, EN = 1 → Q = 1
D changes while EN = 0 → Q remains unchanged
```

The waveform confirms that the D latch correctly captures data when enabled and stores the previous value when disabled.

---

## Key Learning

- Latches are **level-sensitive storage elements**.
- SR latch has Set, Reset, and Memory conditions.
- `S = 1, R = 1` is treated as an invalid condition in this implementation.
- D latch provides a single data input.
- `EN = 1` allows data to pass to the output.
- `EN = 0` makes the latch hold its previous state.
- `always @(*)` is used for the latch RTL.
- A latch stores information without requiring a clock edge.

---

## Day 8 Status

- [x] SR Latch RTL
- [x] SR Latch Testbench
- [x] SR Latch Waveform
- [x] D Latch RTL
- [x] D Latch Testbench
- [x] D Latch Waveform
- [x] Latch concepts understood
