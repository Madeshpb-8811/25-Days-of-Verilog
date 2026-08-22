# Day 9 – Verilog Flip-Flops

## Overview

On Day 9, I learned the fundamentals of **flip-flops in Verilog HDL** and implemented the four commonly used flip-flops:

- D Flip-Flop
- JK Flip-Flop
- T Flip-Flop
- SR Flip-Flop

I also learned how flip-flops differ from latches, how **positive-edge triggering** works, how a flip-flop holds its previous state, and the difference between **synchronous and asynchronous reset**.

---

## 1. D Flip-Flop

The D (Data) flip-flop stores the value of `D` at the active clock edge.

### Characteristic behavior

| Clock | D | Q(next) |
|------|---|---------|
| ↑ | 0 | 0 |
| ↑ | 1 | 1 |

### RTL concept

The D flip-flop was implemented using:

```verilog
always @(posedge clk)
```

Therefore, the output changes only at the **positive edge of the clock**.

### What I learned

- Positive-edge triggered storage
- `Q` follows `D` only at `posedge clk`
- Between clock edges, `Q` retains its previous value
- Difference between a D latch and D flip-flop
- Writing a Verilog testbench
- Generating a clock using `always #5 clk = ~clk`
- Observing `D`, `CLK`, and `Q` in ModelSim

### Waveform

![D Flip-Flop Waveform](D_Flip_Flop/d_flip_flop_wave.png)

---

## 2. JK Flip-Flop

The JK flip-flop removes the invalid condition of the basic SR flip-flop.

### Characteristic table

| J | K | Q(next) | Operation |
|---|---|---------|-----------|
| 0 | 0 | Q | Hold |
| 0 | 1 | 0 | Reset |
| 1 | 0 | 1 | Set |
| 1 | 1 | ~Q | Toggle |

### What I learned

- `J=0, K=0` → previous Q is retained
- `J=0, K=1` → reset
- `J=1, K=0` → set
- `J=1, K=1` → toggle
- JK flip-flop is edge-triggered in my implementation
- How feedback through `~Q` produces the toggle operation

### Waveform

![JK Flip-Flop Waveform](JK_Flip_Flop/jk_flip_flop_wave.png)

---

## 3. T Flip-Flop

The T (Toggle) flip-flop is mainly used for toggling and counting applications.

### Characteristic table

| T | Q(next) | Operation |
|---|---------|-----------|
| 0 | Q | Hold |
| 1 | ~Q | Toggle |

### What I learned

- `T=0` → Q holds its previous value
- `T=1` → Q toggles on every positive clock edge
- A T flip-flop can be derived from a JK flip-flop by setting `J=K=T`
- Flip-flops can be used to build counters and frequency-divider circuits
- Implemented reset behavior and verified it using ModelSim

### Waveform

![T Flip-Flop Waveform](T_Flip_Flop/t_flip_flop_wave.png)

---

## 4. SR Flip-Flop

The SR (Set-Reset) flip-flop has separate Set and Reset inputs.

### Characteristic table

| S | R | Q(next) | Operation |
|---|---|---------|-----------|
| 0 | 0 | Q | Hold / Memory |
| 0 | 1 | 0 | Reset |
| 1 | 0 | 1 | Set |
| 1 | 1 | X | Invalid |

### What I learned

- `S=0, R=0` → Q retains its previous value
- `S=0, R=1` → Reset Q to 0
- `S=1, R=0` → Set Q to 1
- `S=1, R=1` → Invalid/forbidden condition
- The SR flip-flop is positive-edge triggered in my implementation
- An unassigned Q inside a clocked `always` block can retain its previous state
- The invalid condition was represented as `1'bx` for simulation

### Waveform

![SR Flip-Flop Waveform](SR_Flip_Flop/sr_flip_flop_wave.png)

---

# Synchronous vs Asynchronous Operation

## Synchronous

A synchronous reset or control signal is acted upon **only at the active clock edge**.

For example:

```verilog
always @(posedge clk)
begin
    if (rst)
        q <= 1'b0;
end
```

Here, even if `rst` changes between clock edges, Q changes only when the next `posedge clk` occurs.

## Asynchronous Reset

An asynchronous reset does **not wait for the clock**.

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

This makes the reset sensitive to the rising edge of `rst`.

### What I understood

If `rst` becomes `1` while the clock is not changing:

```text
RST ↑
 ↓
Q immediately becomes 0
```

It does **not** wait for the next `posedge clk`.

I implemented and verified this asynchronous-reset behavior while working with the T flip-flop.

---

# Are These Flip-Flops Synchronous?

The basic flip-flop RTL implementations in this Day 9 work are **positive-edge triggered**:

```verilog
always @(posedge clk)
```

Therefore:

| Flip-Flop | Triggering | Reset in current basic implementation |
|-----------|------------|----------------------------------------|
| D | Positive-edge (`posedge clk`) | Reset concepts explored separately |
| JK | Positive-edge (`posedge clk`) | No reset in basic RTL |
| T | Positive-edge (`posedge clk`) | Asynchronous reset explored/implemented |
| SR | Positive-edge (`posedge clk`) | No reset in basic RTL |

**Important:** "Synchronous" here refers to a reset/control action being evaluated with the clock. The flip-flops themselves are **edge-triggered**, not level-sensitive like latches.

---

# Flip-Flop Comparison

| Flip-Flop | Inputs | Hold | Set | Reset | Toggle | Invalid |
|-----------|--------|------|-----|-------|--------|---------|
| D | D | — | D=1 | D=0 | — | None |
| JK | J, K | 00 | 10 | 01 | 11 | None |
| T | T | 0 | — | — | 1 | None |
| SR | S, R | 00 | 10 | 01 | — | 11 |

---

# Latch vs Flip-Flop

One of the important concepts I learned is the difference between a latch and a flip-flop.

### Latch

A latch is **level-sensitive**.

Example:

```verilog
always @(*)
```

or a sensitivity condition involving an enable signal.

The output can respond while the enable level is active.

### Flip-Flop

A flip-flop is **edge-triggered**.

Example:

```verilog
always @(posedge clk)
```

The output changes only at the specified clock edge.

### Main difference

```text
Latch       → Level sensitive
Flip-Flop   → Edge sensitive
```

---

# Verilog Concepts Practiced

During Day 9, I practiced:

- Module declaration
- Input and output ports
- `reg` output for procedural assignments
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
- `1'b0`, `1'b1`, and `1'bx`
- Hold/memory behavior
- Synchronous reset
- Asynchronous reset

---

# Verification

Each flip-flop was tested using a dedicated Verilog testbench and simulated using **ModelSim**.

The testbenches generated a clock and applied different input combinations to verify:

- Set
- Reset
- Hold
- Toggle
- Invalid condition for SR
- Reset behavior
- Positive-edge triggering

The waveforms were inspected manually to confirm that the RTL behaved according to the characteristic tables.

---

# Key Takeaways

1. A **D flip-flop** stores one data bit.
2. A **JK flip-flop** provides set, reset, hold, and toggle operations without an invalid input combination.
3. A **T flip-flop** toggles when `T=1` and holds when `T=0`.
4. An **SR flip-flop** has set, reset, hold, and an invalid `S=R=1` condition.
5. `always @(posedge clk)` describes positive-edge-triggered behavior.
6. A clocked block can retain the previous value when no assignment occurs.
7. A **synchronous reset** waits for the clock edge.
8. An **asynchronous reset** can change Q immediately when the reset event occurs.
9. Non-blocking assignment (`<=`) is used for sequential logic.
10. ModelSim waveforms are useful for verifying RTL behavior.

---

## Day 9 Completed

**Topic:** Verilog Flip-Flops  
**Tools:** Verilog HDL, ModelSim  
**Simulation:** Functional RTL simulation  
**Flip-Flops Covered:** D, JK, T, SR

This completes my Day 9 study of sequential logic and flip-flops.
