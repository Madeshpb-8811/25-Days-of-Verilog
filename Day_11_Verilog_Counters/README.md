# Day 11 – Verilog Counters

## 📌 Overview

Day 11 focused on understanding **counters and feedback-based sequential circuits in Verilog HDL**. I learned how clocked registers can be used to create different types of counters, how reset and control signals affect counting, and how feedback can create cyclic counting sequences.

The main designs implemented and simulated today were:

- Up Counter
- Down Counter
- Up/Down Counter
- MOD-6 Counter
- Ring Counter
- Johnson Counter

Each design was written in Verilog RTL, tested using a separate testbench, simulated in ModelSim, and verified using waveform outputs.

---

## 1. Up Counter

The 4-bit Up Counter increments its value on every positive clock edge.

The basic counting sequence is:

```text
0000 → 0001 → 0010 → 0011 → ... → 1111 → 0000
```

The counter uses a synchronous reset:

```text
RESET = 1 → Q = 0000
RESET = 0 → Count upward
```

The wrap-around condition is:

```text
1111 → 0000
```

### Waveform

![Up Counter Waveform](https://github.com/Madeshpb-8811/25-Days-of-Verilog/blob/main/Day_11_Verilog_Counters/Up_Counter/up_counter%20wave.png?raw=true)

---

## 2. Down Counter

The 4-bit Down Counter decrements its value on every positive clock edge.

The counting sequence is:

```text
1111 → 1110 → 1101 → ... → 0001 → 0000 → 1111
```

The synchronous reset initializes the counter to:

```text
Q = 1111
```

The wrap-around condition is:

```text
0000 → 1111
```

### Waveform

![Down Counter Waveform](https://github.com/Madeshpb-8811/25-Days-of-Verilog/blob/main/Day_11_Verilog_Counters/Down_Counter/down_counter%20wave.png?raw=true)

---

## 3. Up/Down Counter

The Up/Down Counter combines both counting directions in one design.

A `select` signal controls the direction:

```text
SELECT = 0 → Down Count
SELECT = 1 → Up Count
```

The design uses a `case` statement to select the required counting operation.

### Down mode

```text
0000 → 1111 → 1110 → 1101 → ...
```

### Up mode

```text
0000 → 0001 → 0010 → 0011 → ...
```

Both directions have wrap-around behavior:

```text
Down:
0000 → 1111

Up:
1111 → 0000
```

### Waveforms

![Up Down Counter Waveform 1](https://github.com/Madeshpb-8811/25-Days-of-Verilog/blob/main/Day_11_Verilog_Counters/Up_Down_Counter/up_down_counter%20wave%201.png?raw=true)

![Up Down Counter Waveform 2](https://github.com/Madeshpb-8811/25-Days-of-Verilog/blob/main/Day_11_Verilog_Counters/Up_Down_Counter/up_down_counter%20wave%202.png?raw=true)

---

## 4. MOD-6 Counter

A MOD-6 counter has exactly **6 valid states**.

Since:

```text
2³ = 8
```

a 3-bit register is sufficient to implement the counter.

The valid sequence is:

```text
000 → 001 → 010 → 011 → 100 → 101 → 000
 0     1     2     3     4     5     0
```

The counter detects the highest valid state:

```text
101
```

and returns to:

```text
000
```

Therefore, states `110` and `111` are not part of the normal counting sequence.

### Important MOD-N concept

For a MOD-N counter:

```text
Valid states = 0 to N-1
```

For MOD-6:

```text
N - 1 = 5
5 = 101
```

### Waveform

![MOD-6 Counter Waveform](https://github.com/Madeshpb-8811/25-Days-of-Verilog/blob/main/Day_11_Verilog_Counters/MOD_6_Counter/mod_6_counter%20wave.png?raw=true)

---

## 5. Ring Counter

A Ring Counter is based on a shift register with feedback.

For the 4-bit Ring Counter, reset initializes the register to:

```text
1000
```

The feedback operation used was:

```verilog
q <= {q[0],q[3],q[2],q[1]};
```

This produces a circulating `1`:

```text
1000
0100
0010
0001
1000
```

A 4-bit Ring Counter therefore has **4 valid one-hot states**.

### One-hot concept

Only one bit is `1` at a time:

```text
1000
0100
0010
0001
```

### Waveform

![Ring Counter Waveform](https://github.com/Madeshpb-8811/25-Days-of-Verilog/blob/main/Day_11_Verilog_Counters/Ring_Counter/ring_counter%20wave.png?raw=true)

---

## 6. Johnson Counter

A Johnson Counter is another feedback-based shift register, but unlike the Ring Counter, it feeds back the **inverted** output bit.

The feedback operation used was:

```verilog
q <= {~q[0],q[3],q[2],q[1]};
```

Starting from `0000`, the sequence is:

```text
0000
1000
1100
1110
1111
0111
0011
0001
0000
```

A 4-bit Johnson Counter produces:

```text
2 × N = 2 × 4 = 8 states
```

### Ring vs Johnson

| Counter | Feedback | States for 4 bits |
|---|---|---:|
| Ring Counter | `q[0]` | 4 |
| Johnson Counter | `~q[0]` | 8 |

The important difference is:

```text
Ring:
Direct feedback

Johnson:
Inverted feedback
```

### Waveform

![Johnson Counter Waveform](https://github.com/Madeshpb-8811/25-Days-of-Verilog/blob/main/Day_11_Verilog_Counters/Johnson_Counter/johnson_counter%20wave.png?raw=true)

---

# 🧠 Important Concepts Learned Today

## 1. Synchronous Reset

All the counters practiced today used reset inside:

```verilog
always @(posedge clk)
```

Therefore, the reset is checked at the positive clock edge.

The general structure is:

```verilog
always @(posedge clk)
begin
    if(rst)
        q <= reset_value;
    else
        q <= next_value;
end
```

---

## 2. Counter Wrap-Around

Counters need a defined behavior when they reach their boundary.

### Up Counter

```text
1111 → 0000
```

### Down Counter

```text
0000 → 1111
```

### MOD-6 Counter

```text
101 → 000
```

Understanding wrap-around is important when designing counters with a fixed number of states.

---

## 3. Direction Control

The Up/Down Counter introduced a control signal:

```text
SELECT = 0 → Down
SELECT = 1 → Up
```

This showed how one sequential circuit can perform different operations depending on a control input.

---

## 4. MOD-N Counters

A MOD-N counter contains exactly **N valid states**.

Examples:

```text
MOD-6  → 6 states
MOD-10 → 10 states
MOD-16 → 16 states
```

The number of bits required can be determined using:

```text
2^n ≥ N
```

For MOD-6:

```text
2³ = 8 ≥ 6
```

Therefore, 3 bits are sufficient.

---

## 5. Feedback in Sequential Circuits

Ring and Johnson counters introduced feedback-based sequential logic.

### Ring Counter

```verilog
q <= {q[0],q[3],q[2],q[1]};
```

The feedback bit is used directly.

### Johnson Counter

```verilog
q <= {~q[0],q[3],q[2],q[1]};
```

The feedback bit is inverted before entering the register.

This demonstrated how a shift register can be turned into a cyclic counter using feedback.

---

## 6. One-Hot States

The Ring Counter uses one-hot states:

```text
1000
0100
0010
0001
```

Only one bit is active at a time.

This is different from a normal binary counter where multiple bits may change between states.

---

## 7. State Count in Ring and Johnson Counters

For an N-bit register:

```text
Ring Counter:
N states

Johnson Counter:
2N states
```

For 4 bits:

```text
Ring    → 4 states
Johnson → 8 states
```

---

## 8. Non-blocking Assignment

I continued using non-blocking assignments for sequential logic:

```verilog
q <= ...
```

This is important because the next state is calculated from the values that existed before the clock edge.

---

## 9. Case-Based Control

The Up/Down Counter used:

```verilog
case(select)
```

to select between two different counting operations.

This helped reinforce how control signals can select different sequential behaviors.

---

## 10. Testbench and Waveform Verification

I continued practicing the RTL development workflow:

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
Compare with expected sequence
```

I verified each counter by observing its state transitions in ModelSim.

---

# 📊 Day 11 – What I Covered

### Basic Counters

- ✅ 4-bit Up Counter
- ✅ 4-bit Down Counter
- ✅ 4-bit Up/Down Counter

### Modulo Counter

- ✅ MOD-6 Counter
- ✅ State-limit detection
- ✅ Counter wrap-around

### Feedback-Based Counters

- ✅ 4-bit Ring Counter
- ✅ 4-bit Johnson Counter
- ✅ Direct feedback
- ✅ Inverted feedback
- ✅ One-hot sequence
- ✅ 2N-state Johnson sequence

### RTL and Verification

- ✅ Synchronous reset
- ✅ Clocked sequential logic
- ✅ Non-blocking assignments
- ✅ `case`-based control
- ✅ Testbench development
- ✅ ModelSim simulation
- ✅ Waveform verification

---

# 📚 Day 11 Summary

Today I learned how sequential registers can be extended into different types of counters.

I started with conventional binary counting using Up and Down Counters, then combined both operations using an Up/Down Counter. I then implemented a MOD-6 counter to understand how a counter can be restricted to a specific number of states.

Finally, I moved to feedback-based counters. The Ring Counter demonstrated direct feedback and one-hot state circulation, while the Johnson Counter demonstrated inverted feedback and twice as many states.

The main learning from today was that **counters are sequential circuits whose next state is determined by the current state, clock, reset, and control inputs**.

All designs were implemented in Verilog RTL and verified using ModelSim waveforms.

---

# 🎯 Day 11 Complete

```text
Up Counter        ✅
Down Counter      ✅
Up/Down Counter   ✅
MOD-6 Counter     ✅
Ring Counter      ✅
Johnson Counter   ✅
Testbenches       ✅
Waveform Testing  ✅
```

