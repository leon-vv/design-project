## Task Three Report

### Simulation
This directory contains two major entities: the Program Counter and the Rom_16x7. The main [Readme file](https://github.com/leon-vv/design-project) contains information on how to simulate these components. A DITEProject.xise file is also included so the components can be simulated easily using the Xilinx tools. This is also described in the main [Readme file](https://github.com/leon-vv/design-project).

### Program Counter Implementation

The [/shared/](https://github.com/leon-vv/design-project/tree/master/shared) folder contains the implementation of a simple Full Adder. This Full Adder is subsequently used to implement a component which we called a 'Four Adder' which simply adds two four bit numbers. This component includes a 'Carry-In' and 'Carry-Out' port. The  Four Adder is already used in the [ALU](https://github.com/leon-vv/design-project/tree/master/task2/alu). By supplying a '1' for the 'Carry-In' value and "0000" for B this Four Adder turns into a simple increment circuit.

Int the same [/shared/](https://github.com/leon-vv/design-project/tree/master/shared) folder a SR Flip Flop can be found. Four of these are used to represent the Program Counter state.

The new state is chosen using the Mux4_2to1 component of Task 1. The inputs to this Mux consists of the current state incremented by one, or the ROM data supplied at the input port.

### ROM Implementation
The ROM is implemented with a 4 to 16 decoder (which itself is implemented as a binary tree of 1 to 2 decoders with enable bits), a vector of bits to represent the data, and seven 16-input OR gates. The decoder is used to select the right memory cell, and uses the supplied address as its input. The data in each memory cell is AND'ed with the corresponding output bit from the decoder, the resulting bits (which can only be one for the selected cell) are then OR'ed together with the bits from the other cells to get each of the 7 bits of the output.
