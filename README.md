# Multi-bit Barrel Shifter using Verilog HDL (ModelSim)

## Overview
This project implements an **8-bit multi-bit barrel shifter** using **Verilog HDL** and verifies it through **ModelSim simulation**.  
The design supports **variable logical left and right shifts** controlled by a **3-bit shift amount (0–7)** and completes all shift operations in **a single combinational cycle**.

The goal of this project is to understand how **barrel shifters are implemented at the RTL level** using a **MUX-based structural architecture**, similar to what is used in real **VLSI and ASIC frontend designs**.

---

## Project Objectives
- Design an 8-bit barrel shifter using Verilog HDL  
- Support variable shift amounts from 0 to 7  
- Implement both logical left and logical right shifts  
- Follow structural and modular RTL design practices  
- Gain hands-on experience with ModelSim simulation and waveform analysis  

---

## Supported Operations
The barrel shifter operates on an **8-bit input** and supports:
- **Logical Left Shift (LSL)**
- **Logical Right Shift (LSR)**

A **3-bit shift control** selects the shift amount, while a **direction signal** selects left or right shift.

---

## Design Approach and Architecture
The design uses a **three-stage MUX-based barrel shifter architecture**, where the shift amount is interpreted in binary form:
Shift Amount = shamt[0] × 1 + shamt[1] × 2 + shamt[2] × 4


### Barrel Shifter Stages

| Stage | Control Bit | Shift Amount |
|------|------------|--------------|
| Stage 1 | shamt[0] | 1-bit |
| Stage 2 | shamt[1] | 2-bit |
| Stage 3 | shamt[2] | 4-bit |

Each stage consists of **eight parallel 2:1 multiplexers**, one for each data bit.  
Depending on the control signals, each stage either passes the data unchanged or shifts it by the corresponding amount.

Behavioral shift operators (`<<`, `>>`) are intentionally avoided to explicitly model the underlying hardware.

---

## Key Design Blocks
- **2:1 Multiplexer** – basic building block of the design  
- **Stage-wise shift logic** – precomputed left and right shifted data paths  
- **Generate blocks** – used to replicate identical MUX structures efficiently  
- **Top-level barrel shifter module** – integrates all stages and control logic  

---

## Project Directory Overview
- **rtl/** – Verilog RTL design files  
- **tb/** – Testbench for functional verification  
- **waveform snapshots**

---

## Verification and Simulation
- The testbench verifies:
  - Shift amounts from **0 to 7**
  - Both left and right shift operations
  - Proper zero padding at boundaries  
- Simulation is performed using **ModelSim**
- Waveforms confirm correct functionality for all test cases

---

## Example Test Case

Input:
Input Data = 10110011 (decimal 179)


| Operation | Shift Amount | Output |
|----------|--------------|--------|
| Left Shift | 3 | 10011000 |
| Right Shift | 2 | 00101100 |

---

## Tools and Technologies
- **Verilog HDL**
- **ModelSim (Intel / QuestaSim)**
- Digital Logic Design
- VLSI RTL Design Concepts

---

## Notes
- The design is purely **combinational**, enabling single-cycle operation.
- Structural modeling is used to reflect real hardware implementation.
- The design can be extended to higher bit-widths or parameterized versions.

---

## Author
**Avinash Tanti**
