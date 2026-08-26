# Day 12 -- Verilog Clock & Frequency Division

## 📌 Overview

Day 12 focused on **clock division and frequency division using Verilog
HDL**.

Today I learned how a clock signal can be divided into lower-frequency
signals using sequential logic. I started with a simple **Divide-by-2**
toggle circuit and then extended the idea using counters to implement
**Divide-by-4** and **Divide-by-8** circuits.

All three designs were written in Verilog RTL, tested with separate
testbenches, simulated in ModelSim, and verified using waveform outputs.

------------------------------------------------------------------------

## 🎯 What I Covered Today

### Coding

-   ✅ Divide-by-2
-   ✅ Divide-by-4
-   ✅ Divide-by-8
-   ✅ Synchronous reset
-   ✅ Counter-based frequency division
-   ✅ Toggle-based output generation
-   ✅ Testbench creation
-   ✅ Internal signal observation using hierarchical access
-   ✅ ModelSim waveform verification

### Main Concepts

-   Clock frequency vs. output frequency
-   Frequency division
-   Toggle operation
-   Counters
-   Counter width selection
-   Non-blocking assignments
-   Synchronous reset
-   Hierarchical signal access
-   Clock period and output period
-   Avoiding unnecessary generated clocks in RTL

------------------------------------------------------------------------

# 1. Divide-by-2

A Divide-by-2 circuit can be created by toggling the output on every
positive edge of the input clock.

The basic behavior is:

``` text
Reset → Q = 0

Every positive clock edge:
Q = ~Q
```

Therefore:

``` text
Q: 0 → 1 → 0 → 1 → 0 → ...
```

The output completes one full cycle for every two input clock cycles.

Therefore:

f_out = f_in / 2

### Key Learning

A single toggle-based sequential element can act as a **divide-by-2
frequency divider**.

### Waveform

![Divide-by-2
Waveform](https://github.com/Madeshpb-8811/25-Days-of-Verilog/blob/main/Day_12_Verilog_Clock_Division/Divide_by_2/divide_by_2%20wave.png?raw=true)

------------------------------------------------------------------------

# 2. Divide-by-4

For Divide-by-4, I used the **original clock together with a small
counter** instead of using the first divided signal as another clock.

For Divide-by-4:

``` text
Counter width = 1 bit
```

The counter cycles between:

``` text
0 → 1 → 0 → 1 → ...
```

When the counter reaches `1`, the output toggles and the counter returns
to `0`.

Conceptually:

``` text
count = 0
    ↓
1st clock edge
    ↓
count = 1
    ↓
2nd clock edge
    ↓
toggle Q
count = 0
```

This produces a Divide-by-4 output.

### Important RTL Learning

I learned that it is generally better to keep using the **original
clock** and use counter/control logic rather than creating another clock
from ordinary logic.

### Waveform

![Divide-by-4
Waveform](https://github.com/Madeshpb-8811/25-Days-of-Verilog/blob/main/Day_12_Verilog_Clock_Division/Divide_by_4/divide_by_4%20wave.png?raw=true)

------------------------------------------------------------------------

# 3. Divide-by-8

For Divide-by-8, the same counter-based idea was extended.

The output needs to toggle after every **4 positive edges** of the
original clock.

Therefore:

``` text
Counter width = 2 bits
```

The counter represents:

``` text
00 → 01 → 10 → 11
```

When the counter reaches `11`, the output toggles and the counter
returns to `00`.

The resulting output pattern is:

``` text
0000111100001111...
```

Therefore:

f_out = f_in / 8

### Waveform

![Divide-by-8
Waveform](https://github.com/Madeshpb-8811/25-Days-of-Verilog/blob/main/Day_12_Verilog_Clock_Division/Divide_by_8/divide_by_8%20wave%20.png?raw=true)

------------------------------------------------------------------------

# 🧠 Important Concepts Learned Today

## 1. Frequency Division

Frequency division means producing a periodic output signal with a lower
frequency than the input clock.

  Circuit         Frequency
  ------------- -----------
  Divide-by-2      f_in / 2
  Divide-by-4      f_in / 4
  Divide-by-8      f_in / 8

## 2. Toggle Logic

The expression:

``` verilog
q <= ~q;
```

inside a clocked block changes the output state on every active clock
edge.

This naturally creates a Divide-by-2 output.

## 3. Counter-Based Division

For higher division ratios, I learned to use a counter:

``` text
Original Clock
      ↓
    Counter
      ↓
Reach required count
      ↓
  Toggle output
      ↓
 Reset counter
```

For the circuits implemented today:

``` text
Divide-by-4 → toggle every 2 input clock cycles
Divide-by-8 → toggle every 4 input clock cycles
```

## 4. Choosing Counter Width

I learned that the counter width depends on the number of states
required.

``` text
Divide-by-4:
Need 0 and 1
→ 1-bit counter

Divide-by-8:
Need 0, 1, 2, 3
→ 2-bit counter
```

## 5. Synchronous Reset

The designs use:

``` verilog
always @(posedge clk)
```

with reset handled inside the block, making the reset **synchronous**.

## 6. Non-Blocking Assignments

I continued using:

``` verilog
<=
```

for sequential logic.

I also learned that conditions inside a clocked block see the **old
value** of a register when non-blocking assignments are used.

This helped me understand why the counter can be reset and the output
toggled correctly on the same clock edge.

## 7. Hierarchical Signal Access

While writing the testbench, I learned that an internal DUT signal can
be observed using its instance hierarchy.

For example:

``` text
dut.count
```

This allowed me to monitor the internal counter without making it an
output port of the DUT.

## 8. Clock Period and Frequency

I practiced relating waveform periods to frequency division.

For a 10 ns input clock period:

``` text
Divide-by-2 → 20 ns output period
Divide-by-4 → 40 ns output period
Divide-by-8 → 80 ns output period
```

This gives a practical way to verify the divider in ModelSim.

------------------------------------------------------------------------

# 🔬 Verification Workflow

For each circuit I followed:

``` text
Write RTL
   ↓
Write Testbench
   ↓
Compile
   ↓
Simulate in ModelSim
   ↓
Observe waveform
   ↓
Compare with expected behavior
   ↓
Verify frequency division
```

I also monitored internal counter state where useful.

------------------------------------------------------------------------

# 📊 Day 12 Results

  Design        Counter        Toggle Condition      Expected Division   Status
  ------------- -------------- --------------------- ------------------- -------------
  Divide-by-2   Not required   Every positive edge   ÷2                  ✅ Verified
  Divide-by-4   1-bit          count = 1             ÷4                  ✅ Verified
  Divide-by-8   2-bit          count = 3             ÷8                  ✅ Verified

------------------------------------------------------------------------

# 💡 What I Learned Beyond Basic Coding

The main learning today was how to **design the divider from the
required frequency**, rather than simply memorizing code.

For example:

``` text
Required: ÷8
        ↓
Output toggles every 4 input clock edges
        ↓
Counter must count 0, 1, 2, 3
        ↓
2-bit counter
```

I also learned the difference between using a signal as another clock
and using the original clock with counter-based control. The latter is
the better approach for this RTL exercise and avoids unnecessarily
creating derived clocks from ordinary logic.

------------------------------------------------------------------------

# 📁 Day 12 Folder Structure

``` text
Day_12_Verilog_Clock_Division/
│
├── Divide_by_2/
│   ├── divide_by_2.v
│   ├── divide_by_2_tb.v
│   └── divide_by_2 wave.png
│
├── Divide_by_4/
│   ├── divide_by_4.v
│   ├── divide_by_4_tb.v
│   └── divide_by_4 wave.png
│
└── Divide_by_8/
    ├── divide_by_8.v
    ├── divide_by_8_tb.v
    └── divide_by_8 wave .png
```

------------------------------------------------------------------------

# 📚 Day 12 Summary

Today I learned the fundamentals of **clock and frequency division in
Verilog**.

I implemented and verified:

-   Divide-by-2
-   Divide-by-4
-   Divide-by-8
-   Counter-based frequency division
-   Synchronous reset
-   Counter width selection
-   Toggle-based frequency division
-   Testbench development
-   Hierarchical signal monitoring
-   ModelSim waveform verification
-   Frequency and period analysis

The three designs were successfully simulated and their expected
frequency-division behavior was verified through ModelSim waveforms.

------------------------------------------------------------------------

# 🔜 Next -- Day 13

According to the learning plan, the next topic is:

## FSM Basics

Topics:

-   Moore FSM
-   Mealy FSM
-   State encoding
-   State diagram
-   State table
-   Simple FSM coding
-   LED controller FSM

The focus now moves from counters and clock division to **designing
systems that move between defined states based on inputs and clock
events**.
