# Day 9 – Verilog Flip-Flops

## Overview

On Day 9, I learned the fundamentals of **flip-flops in Verilog HDL** and implemented four commonly used flip-flops:

- D Flip-Flop
- JK Flip-Flop
- T Flip-Flop
- SR Flip-Flop

I also learned about **positive-edge triggering, hold/memory behavior, synchronous reset, asynchronous reset, and the difference between latches and flip-flops**.

---

## 1. D Flip-Flop

The D flip-flop stores the value of `D` at the active clock edge.

### Characteristic Table

| Clock | D | Q(next) |
|---|---|---|
| ↑ | 0 | 0 |
| ↑ | 1 | 1 |

### Key Learning

- D flip-flop is **edge-triggered**.
- My implementation uses `posedge clk`.
- Q changes according to D only at the rising edge of the clock.
- Between clock edges, Q retains its previous value.
- Learned how to create a clock in the testbench and verify the output using ModelSim.

### Waveform

![D Flip-Flop Waveform](https://raw.githubusercontent.com/Madeshpb-8811/25-Days-of-Verilog/main/Day_09_Verilog_Flip_Flops/%20D_Flip_Flop/d_flip_flop_wave.png)

---

## 2. JK Flip-Flop

The JK flip-flop provides hold, set, reset, and toggle operations.

### Characteristic Table

| J | K | Q(next) | Operation |
|---|---|---|---|
| 0 | 0 | Q | Hold |
| 0 | 1 | 0 | Reset |
| 1 | 0 | 1 | Set |
| 1 | 1 | ~Q | Toggle |

### Key Learning

- `J=0, K=0` → Q holds its previous value.
- `J=0, K=1` → Q resets to 0.
- `J=1, K=0` → Q sets to 1.
- `J=1, K=1` → Q toggles.
- JK flip-flop does not have the invalid state of the basic SR flip-flop.
- Learned how feedback using `~Q` produces the toggle operation.

### Waveform

![JK Flip-Flop Waveform](https://raw.githubusercontent.com/Madeshpb-8811/25-Days-of-Verilog/main/Day_09_Verilog_Flip_Flops/JK_Flip_Flop/jk_flip_flop%20wave.png)

---

## 3. T Flip-Flop

The T flip-flop is mainly used for toggling, counting, and frequency-divider applications.

### Characteristic Table

| T | Q(next) | Operation |
|---|---|---|
| 0 | Q | Hold |
| 1 | ~Q | Toggle |

### Key Learning

- `T=0` → Q holds its previous value.
- `T=1` → Q toggles at every positive clock edge.
- A T flip-flop can be obtained from a JK flip-flop by connecting `J=K=T`.
- Learned how flip-flops can be used as building blocks for counters.

### Waveform

![T Flip-Flop Waveform](https://raw.githubusercontent.com/Madeshpb-8811/25-Days-of-Verilog/main/Day_09_Verilog_Flip_Flops/T_Flip_Flop/t_flip_flop%20wave.png)

---

## 4. SR Flip-Flop

The SR flip-flop has separate Set and Reset inputs.

### Characteristic Table

| S | R | Q(next) | Operation |
|---|---|---|---|
| 0 | 0 | Q | Hold / Memory |
| 0 | 1 | 0 | Reset |
| 1 | 0 | 1 | Set |
| 1 | 1 | X | Invalid |

### Key Learning

- `S=0, R=0` → Q retains its previous value.
- `S=0, R=1` → Q becomes 0.
- `S=1, R=0` → Q becomes 1.
- `S=1, R=1` → Invalid condition.
- The invalid condition was represented using `1'bx` during simulation.
- Learned that when a clocked `always @(posedge clk)` block does not assign Q, Q retains its previous state.
- This is a **flip-flop hold condition**, not a latch.

### Waveform

![SR Flip-Flop Waveform](https://raw.githubusercontent.com/Madeshpb-8811/25-Days-of-Verilog/main/Day_09_Verilog_Flip_Flops/SR_Flip_Flop/sr_flip_flop%20wave.png)

---

# Synchronous and Asynchronous Reset

One of the important concepts I learned on Day 9 was the difference between **synchronous and asynchronous reset**.

## Synchronous Reset

A synchronous reset is checked only at the active clock edge.

Example:

```verilog
always @(posedge clk)
begin
    if (rst)
        q <= 1'b0;
end
```

If `rst` becomes active between clock edges, Q does not immediately change. The reset takes effect at the next `posedge clk`.

### In simple terms

```text
RESET changes
      ↓
Wait for clock edge
      ↓
Q changes
```

---

## Asynchronous Reset

An asynchronous reset does not depend on the clock.

For an active-high asynchronous reset:

```verilog
always @(posedge clk or posedge rst)
begin
    if (rst)
        q <= 1'b0;
    else if (t)
        q <= ~q;
end
```

The important part is:

```verilog
or posedge rst
```

This adds the reset event to the sensitivity list.

If `rst` becomes `1` while the clock is not changing, Q can immediately become `0`.

### In simple terms

```text
RESET ↑
  ↓
Q immediately becomes 0
```

It does **not** wait for the next clock edge.

I implemented and verified this asynchronous-reset behavior while working with the T flip-flop.

---

# Are the Flip-Flops Synchronous?

The basic flip-flop implementations in this Day 9 work use:

```verilog
always @(posedge clk)
```

Therefore, they are **positive-edge-triggered flip-flops**.

| Flip-Flop | Triggering | Reset / Additional Concept |
|---|---|---|
| D | Positive-edge | Clocked operation |
| JK | Positive-edge | Hold, set, reset, toggle |
| T | Positive-edge | Asynchronous reset explored |
| SR | Positive-edge | Hold, set, reset, invalid state |

**Important:** A flip-flop being edge-triggered is different from saying that its reset is synchronous. The reset type depends on how reset is included in the sensitivity list.

---

# Latch vs Flip-Flop

I also learned the difference between a latch and a flip-flop.

### Latch

A latch is **level-sensitive**.

For example, a D latch responds while its enable signal is active.

```text
Latch → Level sensitive
```

### Flip-Flop

A flip-flop is **edge-sensitive**.

For example:

```verilog
always @(posedge clk)
```

responds only at the rising edge of the clock.

```text
Flip-Flop → Edge sensitive
```

### Main Difference

```text
Latch       → responds to a level
Flip-Flop   → responds to an edge
```

---

# Verilog Concepts Practiced

During Day 9, I practiced:

- Module declaration
- Input and output ports
- `reg` outputs for procedural assignments
- `always` blocks
- `posedge`
- Non-blocking assignment (`<=`)
- `if` / `else if`
- Clock generation in testbenches
- `$monitor`
- `$finish`
- DUT instantiation
- Testbench stimulus
- Waveform analysis in ModelSim
- `1'b0`
- `1'b1`
- `1'bx`
- Hold/memory behavior
- Synchronous reset
- Asynchronous reset

---

# Verification

Each flip-flop was tested using a dedicated Verilog testbench and simulated using **ModelSim**.

The testbenches were used to verify:

- Set
- Reset
- Hold
- Toggle
- Invalid SR condition
- Positive-edge triggering
- Reset behavior
- Previous-state retention

The generated waveforms were checked against the characteristic tables to confirm the RTL behavior.

---

# Flip-Flop Comparison

| Flip-Flop | Inputs | Hold | Set | Reset | Toggle | Invalid |
|---|---|---|---|---|---|---|
| D | D | — | D=1 | D=0 | — | None |
| JK | J, K | 00 | 10 | 01 | 11 | None |
| T | T | 0 | — | — | 1 | None |
| SR | S, R | 00 | 10 | 01 | — | 11 |

---

# Key Takeaways

1. **D flip-flop** stores one bit of data.
2. **JK flip-flop** provides hold, set, reset, and toggle operations.
3. **T flip-flop** toggles when `T=1` and holds when `T=0`.
4. **SR flip-flop** provides set, reset, and hold, but `S=R=1` is invalid.
5. `always @(posedge clk)` describes positive-edge-triggered sequential logic.
6. A clocked `always` block can retain the previous value when no assignment occurs.
7. A **synchronous reset** waits for the active clock edge.
8. An **asynchronous reset** can affect Q immediately when the reset event occurs.
9. Non-blocking assignment (`<=`) is used for sequential logic.
10. ModelSim waveforms can be used to verify RTL behavior.
11. Latches are level-sensitive, while flip-flops are edge-triggered.

---

# Day 9 Completed

**Topic:** Verilog Flip-Flops  
**Tools:** Verilog HDL, ModelSim  
**Simulation:** RTL functional simulation  
**Flip-Flops Covered:** D, JK, T, SR  
**Additional Concepts:** Synchronous Reset, Asynchronous Reset, Hold Behavior, Positive-Edge Triggering

Day 9 completes my study of the basic flip-flops and strengthens my understanding of sequential logic in Verilog.
