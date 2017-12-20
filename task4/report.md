# Task Four Report

## Instruction Decoder

### Design goal

* Input ports: OPC(2:0)
* Ouput ports: Control(7:0)

The Instruction Decoder is a combination circuit that maps the value of the OPC to the correct output signals. By looking at the schema of the processor supplied with the assignment we can deduce the meaning of every bit in the control output. We define the instruction format as follows:

* Instruction set:
* 0xx		ALU operation xx stored in register A
* 000		ADDAB
* 001		SHRA
* 010		SHLA
* 011		NOTA
* 100		LDA
* 101		LDB
* 110		MAB
* 111		JC

Since we know the meaning of each opcode we can deduce the following table:

![Truth table for Instruction Decoder](https://raw.githubusercontent.com/leon-vv/design-project/master/task4/truth-table.jpg)

### Components used

No components have been used except the standard logic gates.

### High level implementation

Each bit in the Control output only depends on the three OPC bits. Therefore we can use Karnaugh maps to find an expression for every bit. This results in the expressions found in [instruction-decoder.vhd](https://github.com/leon-vv/design-project/blob/master/task4/instruction-decoder/instruction-decoder.vhd). 

### Simulation
The main [Readme file](https://github.com/leon-vv/design-project) contains information on how to simulate these components. A [instruction-decoder-tb.vhd](https://github.com/leon-vv/design-project/blob/master/task4/instruction-decoder-tb.vhd) file is included. This file contains a loop which generates all the eight possible values for the OPC input. By inspecting the output signals we can determine if the values agree with the table in the picture above.



