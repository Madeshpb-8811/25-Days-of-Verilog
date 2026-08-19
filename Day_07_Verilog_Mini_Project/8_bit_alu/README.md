# Day 7 – 8-bit ALU Mini Project

## Objective

Design and verify an 8-bit Arithmetic Logic Unit (ALU) using Verilog RTL.

The ALU performs arithmetic and logical operations based on a 3-bit operation selector (`op`).

## ALU Operations

| OP Code | Operation | Description |
|---|---|---|
| `000` | ADD | `A + B` |
| `001` | SUBTRACT | `A - B` |
| `010` | AND | `A & B` |
| `011` | OR | `A \| B` |
| `100` | XOR | `A ^ B` |
| `101` | NOT | `~A` |
| `110` | SHIFT LEFT | `A << 1` |
| `111` | SHIFT RIGHT | `A >> 1` |

## Testbench Stimulus

The testbench applies different combinations of `A`, `B`, and `OP`.

### Test Case 1 – Normal Operations

For `A = 25` and `B = 23`:

| Operation | Expected Result |
|---|---:|
| `25 + 23` | `48` |
| `25 - 23` | `2` |
| `25 & 23` | `17` |
| `25 \| 23` | `31` |
| `25 ^ 23` | `14` |
| `~25` | `230` |
| `25 << 1` | `50` |
| `25 >> 1` | `12` |

### Test Case 2 – Larger Values

For `A = 200` and `B = 75`:

| Operation | Expected Result |
|---|---:|
| `200 + 75` | `19` |
| `200 - 75` | `125` |
| `200 & 75` | `72` |
| `200 \| 75` | `203` |
| `200 ^ 75` | `131` |
| `~200` | `55` |
| `200 << 1` | `144` |
| `200 >> 1` | `100` |

`200 + 75 = 275`, but the ALU output is only 8 bits. Therefore the overflow bit is discarded and the result becomes `00010011` (`19`).

## Edge Case Testing

Additional stimulus was added to verify boundary conditions:

- `0 + 0 = 0`
- `255 + 1 = 0` due to 8-bit overflow
- `0 - 255 = 1` due to 8-bit wraparound
- `11111111 & 00000000 = 00000000`
- `10101010 ^ 01010101 = 11111111`
- `10000001 << 1 = 00000010`
- `10000001 >> 1 = 01000000`

A `#10` delay is used between stimulus values so each operation can be clearly observed in simulation.

## Verification

The testbench uses `$monitor` to display:

```text
A, B, OPERATION, RESULT
```

The simulation waveforms confirm the expected results for all eight ALU operations and the additional edge cases.

## Simulation Waveforms

### Waveform 1 – Basic ALU Operations

![8-bit ALU Waveform 1](8_bit_alu%20wave1.png)

Shows the ALU operations using `A = 25` and `B = 23`.

### Waveform 2 – Edge Case Testing

![8-bit ALU Waveform 2](8_bit_alu%20wave2.png)

Shows boundary cases including zero, maximum 8-bit values, overflow, wraparound, bitwise operations, and shifts.

### Waveform 3 – ALU Verification

![8-bit ALU Waveform 3](8_bit_alu%20wave3.png)

Shows the stimulus and corresponding ALU results for the tested operations.

## Files

```text
8_bit_alu/
├── alu_8bit.v
├── alu_8bit_tb.v
├── 8_bit_alu wave1.png
├── 8_bit_alu wave2.png
└── 8_bit_alu wave3.png
```

## Key Learning

Through this mini project, I practiced:

- 8-bit combinational RTL design
- `always @(*)`
- `case` statements
- Arithmetic operations
- Bitwise operations
- Shift operations
- Testbench stimulus generation
- Boundary and edge-case testing
- Simulation waveform analysis
- 8-bit overflow and wraparound behavior
