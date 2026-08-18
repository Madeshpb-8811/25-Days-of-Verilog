# Day 6 – Advanced Combinational Circuits

## Overview

Day 6 focuses on advanced combinational logic design using Verilog RTL.

In this session, I worked on practical combinational circuits involving data shifting, code conversion, seven-segment decoding, and parity-based error detection.

## Topics Covered

### Theory
- Barrel Shifter
- Code Conversion
- Parity

### RTL Implementations
- Barrel Shifter
- Binary → Gray Code
- Gray → Binary Code
- BCD → 7-Segment Decoder
- Parity Generator
- Parity Checker

---

## 1. Barrel Shifter

A barrel shifter is a combinational circuit that can shift an input data word by a variable number of positions in a single operation.

### Inputs
- `data` – 8-bit input data
- `shift` – 3-bit shift amount
- `dir` – direction control

### Output
- `out` – shifted output

### Verilog Concepts Used
- Shift operators
- Variable shifting
- `always @(*)`
- Combinational RTL

### Simulation Waveforms

#### Right Shift

![Barrel Shifter Right Shift](Barrel_Shifter/barrel_shifter%20wave%201.png)

#### Left Shift

![Barrel Shifter Left Shift](Barrel_Shifter/barrel_shifter%20wave%202.png)

---

## 2. Binary to Gray Code

Gray code is a binary numeral system in which two consecutive values differ by only one bit.

For a 4-bit binary input:

```text
g[3] = b[3]
g[2] = b[3] ^ b[2]
g[1] = b[2] ^ b[1]
g[0] = b[1] ^ b[0]
```

### Verilog Concepts Used
- XOR operation
- Continuous assignment
- Bitwise operations
- Code conversion

### Simulation Waveform

![Binary to Gray Waveform](Binary_to_Gray/binary_to_gray%20wave.png)

---

## 3. Gray to Binary Code

Gray code can be converted back to binary using cumulative XOR operations.

For a 4-bit Gray input:

```text
b[3] = g[3]
b[2] = g[3] ^ g[2]
b[1] = g[3] ^ g[2] ^ g[1]
b[0] = g[3] ^ g[2] ^ g[1] ^ g[0]
```

### Verilog Concepts Used
- Cumulative XOR
- Code conversion
- Dataflow modeling

### Simulation Waveform

![Gray to Binary Waveform](Gray_to_Binary/gray_binary%20wave.png)

---

## 4. BCD to 7-Segment Decoder

A BCD-to-7-segment decoder converts a 4-bit BCD input into seven output signals used to control a seven-segment display.

### Valid BCD Inputs

| BCD | Decimal |
|---|---:|
| `0000` | 0 |
| `0001` | 1 |
| `0010` | 2 |
| `0011` | 3 |
| `0100` | 4 |
| `0101` | 5 |
| `0110` | 6 |
| `0111` | 7 |
| `1000` | 8 |
| `1001` | 9 |

Inputs from `1010` to `1111` are treated as invalid BCD inputs.

### Verilog Concepts Used
- `case` statement
- Decoder design
- Seven-segment encoding
- `default` case
- Combinational logic

### Simulation Waveform

![BCD to 7 Segment Waveform](BCD_to_7Segment/bcd_to_7seg%20wave.png)

---

## 5. Parity Generator

A parity generator produces a parity bit from the input data.

For the 4-bit implementation:

```text
parity = d[3] ^ d[2] ^ d[1] ^ d[0]
```

### Verilog Concepts Used
- XOR logic
- Continuous assignment
- Error detection fundamentals

### Simulation Waveform

![Parity Generator Waveform](Parity_Generator/parity_generator%20wave.png)

---

## 6. Parity Checker

A parity checker determines whether an error is present in the received data.

The calculated parity is XORed with the received parity:

```text
error = d[3] ^ d[2] ^ d[1] ^ d[0] ^ received_parity
```

### Error Interpretation

```text
error = 0 → No parity error detected
error = 1 → Parity error detected
```

### Verilog Concepts Used
- XOR-based error detection
- Parity checking
- Combinational logic
- Testbench verification

### Simulation Waveform

![Parity Checker Waveform](Parity_Checker/parity_checker%20wave.png)

---

# Verification

Each RTL design was tested using a dedicated Verilog testbench.

The designs were simulated using ModelSim and the resulting waveforms were analyzed to verify the expected outputs.

### Verification Techniques Used

- `$monitor`
- Multiple input combinations
- Waveform analysis
- Valid and invalid input testing
- Functional verification
- Boundary-condition testing

---

# Key Takeaways

Through Day 6, I strengthened my understanding of:

- Advanced combinational RTL design
- Barrel shifting
- Variable shift operations
- XOR-based logic
- Binary and Gray code conversion
- BCD decoding
- Seven-segment display encoding
- Parity generation
- Parity-based error detection
- Writing Verilog testbenches
- Reading and analyzing simulation waveforms

---

# Tools Used

- Verilog HDL
- ModelSim
- Git
- GitHub

---

# Progress

**Day 6 / 25 completed ✅**

Continuing the journey from Verilog fundamentals toward practical RTL design and verification.

