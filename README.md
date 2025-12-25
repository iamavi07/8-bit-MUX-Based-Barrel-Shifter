# Multi-bit Barrel Shifter using Verilog HDL (ModelSim)

## Overview
This project presents the design and simulation of an **8-bit multi-bit barrel shifter** implemented using **Verilog HDL**.  
The barrel shifter supports **variable logical left and right shift operations** with a **3-bit shift amount (0–7)** and performs all shift operations in **a single combinational cycle**. The design is verified through simulation using **ModelSim**.

The primary focus of this project is to understand how **high-speed shift operations** are realized at the **hardware and register-transfer level (RTL)** using a **MUX-based structural architecture**, which closely follows **real VLSI and ASIC frontend design practices**.

---

## Project Objectives
- Design an 8-bit multi-bit barrel shifter using Verilog HDL
- Support variable shift amounts from 0 to 7 in a single cycle
- Implement both **logical left** and **logical right** shift operations
- Practice **structural and modular design methodology**
- Understand MUX-based barrel shifter architecture used in VLSI systems
- Gain hands-on experience with **ModelSim simulation and waveform analysis**
- Maintain a clean and professional project structure suitable for GitHub and academic submission

---

## Supported Operations
The barrel shifter operates on an **8-bit binary input** and supports the following operations:

- **Logical Left Shift (LSL)**
- **Logical Right Shift (LSR)**

The shift amount is controlled using a **3-bit control signal**, allowing shifts from **0 to 7 bit positions**.  
A direction control signal is used to select between left and right shift operations.

---

## Design Approach and Architecture

The barrel shifter is implemented using a **MUX-based multi-stage architecture**, which is a standard approach adopted in **high-performance processors and VLSI designs**.

### Key Architectural Concept

The shift amount is interpreted in binary form as:

Shift Amount = shamt[0] × 1 + shamt[1] × 2 + shamt[2] × 4


Based on this, the design is divided into **three combinational stages**, where each stage is responsible for shifting by a power of two.

### Barrel Shifter Stages

| Stage | Control Bit | Shift Amount |
|------|------------|--------------|
| Stage 1 | shamt[0] | 1-bit |
| Stage 2 | shamt[1] | 2-bit |
| Stage 3 | shamt[2] | 4-bit |

Each stage consists of **eight parallel 2:1 multiplexers**, one for each bit of the data path.  
Depending on the shift amount and direction, each stage either:
- Passes the data unchanged, or
- Shifts the data by the corresponding number of bit positions

This architecture ensures that **all shift operations are completed in a single combinational cycle**, which is the defining feature of a barrel shifter.

---

## Key Design Blocks

- **2:1 Multiplexer (MUX)**  
  The fundamental building block of the design. Each bit of the data path uses a multiplexer to select between shifted and unshifted inputs.

- **Stage-wise Shift Logic**  
  Left and right shifted versions of the data are generated using wire re-mapping and zero padding.

- **Generate Blocks**  
  Verilog `generate` constructs are used to replicate identical MUX structures efficiently, promoting scalable and clean RTL design.

- **Top-Level Barrel Shifter Module**  
  Integrates all stages and controls data flow based on the shift amount and direction.

Behavioral shift operators (`<<`, `>>`) are intentionally avoided to explicitly model the underlying hardware.

---

## Project Directory Overview

- **rtl/**  
  Contains the Verilog RTL design files, including the 2:1 multiplexer module and the top-level barrel shifter module.

- **tb/**  
  Contains the Verilog testbench used to verify the functional correctness of the barrel shifter.

- **sim/**  
  Contains simulation-related files and waveform outputs generated using ModelSim.

- **docs/**  
  Contains design documentation and waveform screenshots used for verification and explanation.

---

## Verification and Simulation
- A comprehensive testbench verifies:
  - Shift amounts from **0 to 7**
  - Both **left and right** shift operations
  - Correct zero-padding at boundary conditions
- Simulation is performed using **ModelSim**
- Waveforms confirm correct behavior for all test cases

---

## Example Test Case

For input value:

Based on this, the design is divided into **three combinational stages**, where each stage is responsible for shifting by a power of two.

### Barrel Shifter Stages

| Stage | Control Bit | Shift Amount |
|------|------------|--------------|
| Stage 1 | shamt[0] | 1-bit |
| Stage 2 | shamt[1] | 2-bit |
| Stage 3 | shamt[2] | 4-bit |

Each stage consists of **eight parallel 2:1 multiplexers**, one for each bit of the data path.  
Depending on the shift amount and direction, each stage either:
- Passes the data unchanged, or
- Shifts the data by the corresponding number of bit positions

This architecture ensures that **all shift operations are completed in a single combinational cycle**, which is the defining feature of a barrel shifter.

---

## Key Design Blocks

- **2:1 Multiplexer (MUX)**  
  The fundamental building block of the design. Each bit of the data path uses a multiplexer to select between shifted and unshifted inputs.

- **Stage-wise Shift Logic**  
  Left and right shifted versions of the data are generated using wire re-mapping and zero padding.

- **Generate Blocks**  
  Verilog `generate` constructs are used to replicate identical MUX structures efficiently, promoting scalable and clean RTL design.

- **Top-Level Barrel Shifter Module**  
  Integrates all stages and controls data flow based on the shift amount and direction.

Behavioral shift operators (`<<`, `>>`) are intentionally avoided to explicitly model the underlying hardware.

---

## Project Directory Overview

- **rtl/**  
  Contains the Verilog RTL design files, including the 2:1 multiplexer module and the top-level barrel shifter module.

- **tb/**  
  Contains the Verilog testbench used to verify the functional correctness of the barrel shifter.

- **sim/**  
  Contains simulation-related files and waveform outputs generated using ModelSim.

- **docs/**  
  Contains design documentation and waveform screenshots used for verification and explanation.

---

## Verification and Simulation
- A comprehensive testbench verifies:
  - Shift amounts from **0 to 7**
  - Both **left and right** shift operations
  - Correct zero-padding at boundary conditions
- Simulation is performed using **ModelSim**
- Waveforms confirm correct behavior for all test cases

---

## Example Test Case

For input value:
Input Data = 10110011 (decimal 179)


| Operation | Shift Amount | Output |
|----------|--------------|--------|
| Left Shift | 3 | 10011000 |
| Right Shift | 2 | 00101100 |

These results validate the correctness of the MUX-based barrel shifter design.

---

## Tools and Technologies
- **Verilog HDL**
- **ModelSim (Intel / QuestaSim)**
- Digital Logic Design
- VLSI RTL Design Concepts

---

## Notes
- Structural modeling is emphasized to reflect hardware-level implementation.
- The barrel shifter is purely **combinational**, enabling single-cycle operation.
- The design can be extended to higher bit-widths or parameterized architectures with minimal modifications.

---

## Author
**Avinash Tanti**
