# Automotive-Grade Battery Management System (BMS) Using VLSI Design

## Overview

This project implements a Battery Management System (BMS) in
SystemVerilog RTL. It monitors voltage, temperature, and current,
detects faults, triggers alarms, and communicates status via CAN
messages. Verified using EDA Playground and EPWave.

## Features

-   Voltage, Temperature, Current Monitors
-   Fault Detector & Alarm Controller
-   Battery FSM (NORMAL, WARNING, FAULT)
-   CAN Transmitter (AA, BB, CC messages)
-   Battery Status (32-bit packed word)
-   Top Module (`bms_top`) integrating all components

## Simulation

-   Run in **EDA Playground** with `design.sv` and `testbench.sv`
-   View waveforms in **EPWave**
-   Console output shows state transitions and CAN messages

## Tools

-   SystemVerilog (EDA Playground)
-   Icarus Verilog / Verilator
-   EPWave waveform viewer

## Results

-   Correct fault detection and alarms
-   FSM transitions: NORMAL → WARNING → FAULT → NORMAL
-   CAN messages: AA, BB, CC
-   Status word reflects sensor values

## Future Scope

-   ISO 26262 compliance
-   FPGA prototyping
-   Real sensor interfacing
