# Day 10 – Verilog Registers & Shift Registers

## 📌 Overview

Day 10 focused on understanding **registers and shift registers in Verilog HDL**. I learned how flip-flops can be combined to store multiple bits and how the same basic storage elements can be used for different types of data movement.

The main concepts implemented and simulated today were:

- 8-bit Register
- PIPO – Parallel In Parallel Out
- SISO – Serial In Serial Out
- SIPO – Serial In Parallel Out
- PISO – Parallel In Serial Out
- Universal Shift Register

Each design was written in Verilog RTL, tested using a separate testbench, simulated in ModelSim, and verified using waveform outputs.

---

## 1. 8-bit Register

An 8-bit register stores an 8-bit value and updates its contents on the active clock edge.

```text
posedge CLK:
    EN = 1 → Q loads D
    EN = 0 → Q holds its previous value
```

### Enable concept

```verilog
always @(posedge clk)
begin
    if(en)
        q <= d;
end
```

When `en = 1`, the input data is stored in `q` at the next positive clock edge.

When `en = 0`, the register retains its previous value.

### Without enable

```verilog
always @(posedge clk)
    q <= d;
```

The register loads the input on every positive clock edge.

```text
With enable:
EN = 1 → Load
EN = 0 → Hold

Without enable:
Every posedge → Load
```

### Waveform

![8-bit Register Waveform](https://github.com/Madeshpb-8811/25-Days-of-Verilog/blob/main/Day_10_Verilog_Registers/%208bit_register/register_8bit%20wave.png?raw=true)

---

## 2. PIPO – Parallel In Parallel Out

PIPO means **Parallel In Parallel Out**.

All input bits are provided simultaneously and all output bits are available simultaneously.

```text
D[3:0] → Register → Q[3:0]
              ↑
             CLK
```

At every positive clock edge:

```text
Q <= D
```

No shifting takes place. All bits are transferred together.

### Waveform

![PIPO Waveform](https://github.com/Madeshpb-8811/25-Days-of-Verilog/blob/main/Day_10_Verilog_Registers/PIPO/pipo%20wave.png?raw=true)

---

## 3. SISO – Serial In Serial Out

SISO means **Serial In Serial Out**.

One bit enters the register at every clock edge, and the stored bits move one position at a time.

The shift operation used was:

```verilog
q <= {serial_in, q[3], q[2], q[1]};
```

This means:

```text
New Q[3] = Serial In
New Q[2] = Old Q[3]
New Q[1] = Old Q[2]
New Q[0] = Old Q[1]
```

For example, starting from `0000` and applying:

```text
Serial In: 1 0 1 1
```

the register becomes:

```text
1000
0100
1010
1101
```

The serial output can be taken from `Q[0]`.

### Waveform

![SISO Waveform](https://github.com/Madeshpb-8811/25-Days-of-Verilog/blob/main/Day_10_Verilog_Registers/%20SISO/siso%20wave%20.png?raw=true)

---

## 4. SIPO – Serial In Parallel Out

SIPO means **Serial In Parallel Out**.

Data enters one bit at a time, but the complete stored value can be observed in parallel through `Q[3:0]`.

The same shift operation used for SISO was used:

```verilog
q <= {serial_in, q[3], q[2], q[1]};
```

The important distinction is the output usage:

```text
SISO → Serial output
SIPO → Parallel Q[3:0] output
```

### Waveform

![SIPO Waveform](https://github.com/Madeshpb-8811/25-Days-of-Verilog/blob/main/Day_10_Verilog_Registers/SIPO/sipo%20wave.png?raw=true)

---

## 5. PISO – Parallel In Serial Out

PISO means **Parallel In Serial Out**.

First, an entire parallel value is loaded into the register. After that, the stored bits are shifted out one at a time.

```text
LOAD = 1 → Parallel load
LOAD = 0 → Shift right
```

The shift operation was:

```verilog
register <= {1'b0, register[3], register[2], register[1]};
```

The serial output captures the bit being shifted out:

```verilog
serial_out <= register[0];
```

Because both statements use `<=` inside the same clocked `always` block, `serial_out` receives the **old `register[0]` value** while the register simultaneously shifts.

### Waveform

![PISO Waveform](https://github.com/Madeshpb-8811/25-Days-of-Verilog/blob/main/Day_10_Verilog_Registers/PISO/piso%20wave.png?raw=true)

---

## 6. Universal Shift Register

A **Universal Shift Register** combines multiple register operations into a single design. It can hold its current value, shift in either direction, or load data in parallel.

The operations are selected using a 2-bit control signal:

```text
SELECT = 00 → Hold
SELECT = 01 → Shift Right
SELECT = 10 → Shift Left
SELECT = 11 → Parallel Load
```

### RTL concept

```verilog
case(select)
    2'b01: q <= {serial_right,q[3],q[2],q[1]};
    2'b10: q <= {q[2],q[1],q[0],serial_left};
    2'b11: q <= parallel_in;
endcase
```

When `SELECT = 00`, no assignment is made to `q`, so the register holds its previous value.

### Operations

**Hold — `SELECT = 00`**

```text
Q → Q
```

**Shift Right — `SELECT = 01`**

```verilog
q <= {serial_right,q[3],q[2],q[1]};
```

Example:

```text
0110 → 1011 → 0101
```

**Shift Left — `SELECT = 10`**

```verilog
q <= {q[2],q[1],q[0],serial_left};
```

Example:

```text
0101 → 1011 → 0110
```

**Parallel Load — `SELECT = 11`**

```verilog
q <= parallel_in;
```

### Waveform

![Universal Shift Register Waveform](https://github.com/Madeshpb-8811/25-Days-of-Verilog/blob/main/Day_10_Verilog_Registers/Universal_Shift_Register/universal_shift_register%20wave.png?raw=true)

---

# 🧠 Important Concepts Learned Today

## 1. Positive-edge triggered storage

All of today's sequential designs were based around:

```verilog
always @(posedge clk)
```

The register or shift register updates only on the **rising edge of the clock**.

## 2. Non-blocking assignment

For sequential logic, I practiced:

```verilog
<=
```

instead of blocking assignment:

```verilog
=
```

Non-blocking assignments allow sequential state updates to occur together based on the values present before the clock edge.

## 3. Concatenation

I learned how `{}` combines bits into a vector:

```verilog
{serial_in, q[3], q[2], q[1]}
```

This is especially useful for shift registers.

## 4. Hold behavior

A register does not need an explicit `q <= q;` to hold its previous value when an enable condition is false.

```verilog
always @(posedge clk)
begin
    if(en)
        q <= d;
end
```

When `en = 0`, the register retains its previous value.

The same principle was used in the Universal Shift Register when `SELECT = 00`.

## 5. Enable vs no enable

```text
Enabled register:
EN = 1 → Load input
EN = 0 → Hold previous value

Register without enable:
Every posedge → Load input
```

## 6. Parallel vs Serial data movement

```text
Parallel → Multiple bits move together
Serial   → One bit moves per clock
```

| Register | Input | Output |
|---|---|---|
| PIPO | Parallel | Parallel |
| SISO | Serial | Serial |
| SIPO | Serial | Parallel |
| PISO | Parallel | Serial |
| Universal Shift Register | Serial / Parallel | Parallel |

## 7. Shift direction

For the shift registers implemented today:

```text
Serial In → Q3 → Q2 → Q1 → Q0
```

On every clock:

```text
Q3 ← Serial In
Q2 ← Old Q3
Q1 ← Old Q2
Q0 ← Old Q1
```

The Universal Shift Register extended this concept by allowing both left and right shifting.

## 8. Select-based control

The Universal Shift Register introduced a 2-bit control signal:

```text
SELECT[1:0]
```

```text
00 → Hold
01 → Shift Right
10 → Shift Left
11 → Parallel Load
```

This showed how multiple operations can be controlled using a small amount of control logic.

## 9. Testbench and waveform verification

I continued practicing the RTL workflow:

```text
Write RTL
   ↓
Write Testbench
   ↓
Compile
   ↓
Simulate
   ↓
Check Waveform
   ↓
Verify expected behavior
```

I also learned that testbench inputs should be changed away from the active clock edge when possible. Using `#10` stimulus intervals with a `#5` clock toggle makes the inputs change at the opposite clock edge and remain stable before the next `posedge`.

---

# 📚 Day 10 Summary

Today I moved from individual flip-flops to **multi-bit registers and different types of shift registers**. I learned how an 8-bit register stores data, how an enable controls loading, and how registers can be configured for serial and parallel data transfer.

I also implemented a **Universal Shift Register**, which combined the concepts learned from the individual shift registers into one design capable of holding, shifting left, shifting right, and parallel loading data.

The most important learning from today was understanding that **shift registers are built from storage elements and controlled movement of bits**, while control signals determine how the stored data should move.

All designs were implemented in Verilog and verified through ModelSim waveforms.

### Completed Today

- ✅ 8-bit Register
- ✅ Register with Enable
- ✅ Register without Enable
- ✅ PIPO
- ✅ SISO
- ✅ SIPO
- ✅ PISO
- ✅ Universal Shift Register
- ✅ Testbench writing
- ✅ ModelSim waveform verification
- ✅ Concatenation and shifting
- ✅ Non-blocking assignments in sequential logic
- ✅ Select-based control using `case`
- ✅ Hold, shift-left, shift-right and parallel-load operations

---

## 🎯 Day 10 Complete

**Registers → Shift Registers → Universal Shift Register**

The Universal Shift Register completes the register and shift-register portion of the learning plan.

### Next

**Day 11 – Verilog Counters**
