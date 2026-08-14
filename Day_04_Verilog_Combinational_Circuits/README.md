# Day 04 - Verilog Combinational Circuits

## Objective

To understand and implement fundamental combinational circuits using Verilog HDL and verify their functionality through simulation and waveform analysis.

## Circuits Implemented

1. 2-to-4 Decoder
2. 1-to-4 Demultiplexer
3. 2-to-1 Multiplexer
4. 4-to-1 Multiplexer
5. 8-to-1 Multiplexer
6. Priority Encoder

---

## 1. 2-to-4 Decoder

A decoder converts binary input information into one of several output lines.

For a 2-to-4 decoder:

- Inputs: 2
- Outputs: 4
- Select combinations: 4

### Truth Table

| Input | Output |
|---|---|
| 00 | 0001 |
| 01 | 0010 |
| 10 | 0100 |
| 11 | 1000 |

### Files

- `decoder.v` - RTL design
- `decoder_tb.v` - Testbench
- `decoder_wave.png` - Simulation waveform

### Waveform

![2-to-4 Decoder Waveform](decoder_wave.png)

---

## 2. 1-to-4 Demultiplexer

A demultiplexer routes a single input to one of several outputs depending on the select lines.

For a 1-to-4 DEMUX:

- Data input: 1
- Select lines: 2
- Outputs: 4

### Truth Table

| Select | Output |
|---|---|
| 00 | 000A |
| 01 | 00A0 |
| 10 | 0A00 |
| 11 | A000 |

Here, `A` represents the input data.

### Files

- `demux1x4.v` - RTL design
- `demux1x4_tb.v` - Testbench
- `demux1x4.wave.png` - Simulation waveform

### Waveform

![1-to-4 DEMUX Waveform](demux1x4.wave.png)

---

## 3. 2-to-1 Multiplexer

A multiplexer selects one input from multiple inputs and transfers it to a single output.

For a 2-to-1 MUX:

- Data inputs: 2
- Select lines: 1
- Output: 1

### Truth Table

| Select | Output |
|---|---|
| 0 | A |
| 1 | B |

### Files

- `mux_2x1.v` - RTL design
- `mux_2x1_tb.v` - Testbench
- `mux_2x1 wave.png` - Simulation waveform

### Waveform

![2-to-1 MUX Waveform](mux_2x1%20wave.png)

---

## 4. 4-to-1 Multiplexer

A 4-to-1 multiplexer selects one of four inputs based on two select lines.

### Truth Table

| Select | Output |
|---|---|
| 00 | A |
| 01 | B |
| 10 | C |
| 11 | D |

### Files

- `mux_4x1.v` - RTL design
- `mux_4x1_tb.v` - Testbench
- `mux_4x1 wave.png` - Simulation waveform

### Waveform

![4-to-1 MUX Waveform](mux_4x1%20wave.png)

---

## 5. 8-to-1 Multiplexer

An 8-to-1 multiplexer selects one input from eight inputs using three select lines.

### Truth Table

| Select | Output |
|---|---|
| 000 | A |
| 001 | B |
| 010 | C |
| 011 | D |
| 100 | E |
| 101 | F |
| 110 | G |
| 111 | H |

### Files

- `mux_8x1.v` - RTL design
- `mux_8x1_tb.v` - Testbench
- `mux_8x1 wave.png` - Simulation waveform

### Waveform

![8-to-1 MUX Waveform](mux_8x1%20wave.png)

---

## 6. Priority Encoder

A priority encoder converts multiple input signals into a binary output while giving priority to a particular input when multiple inputs are active simultaneously.

The highest-priority active input determines the output.

### Files

- `priority_encoder.v` - RTL design
- `priority_encoder_tb.v` - Testbench
- `priority_encoder_wave.png` - Simulation waveform

### Waveform

![Priority Encoder Waveform](priority_encoder_wave.png)

---

## Verilog Concepts Practiced

- Combinational logic
- `always @(*)`
- `case` statements
- Select lines
- Multiplexing
- Demultiplexing
- Decoding
- Priority logic
- Testbench development
- Simulation
- Waveform analysis

## Folder Structure

```text
Day_04_Verilog_Combinational_Circuits/
│
├── decoder/
│   ├── decoder.v
│   ├── decoder_tb.v
│   └── decoder_wave.png
│
├── demux1x4/
│   ├── demux1x4.v
│   ├── demux1x4_tb.v
│   └── demux1x4.wave.png
│
├── mux_2x1/
│   ├── mux_2x1.v
│   ├── mux_2x1_tb.v
│   └── mux_2x1 wave.png
│
├── mux_4x1/
│   ├── mux_4x1.v
│   ├── mux_4x1_tb.v
│   └── mux_4x1 wave.png
│
├── mux_8x1/
│   ├── mux_8x1.v
│   ├── mux_8x1_tb.v
│   └── mux_8x1 wave.png
│
└── priority_encoder/
    ├── priority_encoder.v
    ├── priority_encoder_tb.v
    └── priority_encoder_wave.png
