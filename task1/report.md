# Task One Report

## Mux1_2to1

### Design goal

* Input ports: D(1:0), S, E
* Output ports: O

The Mux is an asynchronous component whose outputs is equal to one of its input ports. Which input port is used as the output is decided by a select line. Every input port is numbered starting from zero, and the number appearing on the select line 'chooses' the corresponding input. In this case there are only two inputs so the select line consists of a single bit. If the Enable port is zero the output will be zero. 

### Components used
This component is implemented entirely using And gates and  Or gates.

### High level implementation

This component is optimized using a Karnaugh map, which results in the expression found in the [VHDL file](https://github.com/leon-vv/design-project/blob/master/task1/mux1-2to1/mux1-2to1.vhd).


### Simulation
The main [Readme file](https://github.com/leon-vv/design-project) contains information on how to simulate these components. A [mux1-2to1-tb.vhd](https://github.com/leon-vv/design-project/blob/master/task1/mux1-2to1/mux1-2to1-tb.vhd) file is included. This file contains code which enumerates a few possible input values. D0 and D1 are given different values and after varying S we see whether the correct value appears at the output.

## Mux4_2to1

### Design goal

* Input ports: D0(3:0), D1(3:0), S
* Output ports: O(3:0)

This component is similar to the Mux1_2to1 but differs in that the data signals are four bits wide. Again a choice is made between two inputs so S needs only be one bit wide.

### Components used
* [Mux1_2to1](https://github.com/leon-vv/design-project/blob/master/task1/mux1-2to1/mux1-2to1.vhd): this component is explained above

### High level implementation

We use four Mux1_2to1 components. Since we need no Enable input this time we simply pass one for this input to each Mux1_2to1. For every bit in the data we use one Mux1_2to1. The select input to each of these component is simply S and thus the same for each.

### Simulation

The main [Readme file](https://github.com/leon-vv/design-project) contains information on how to simulate these components. A [mux4-2to1-tb.vhd](https://github.com/leon-vv/design-project/blob/master/task1/mux4-2to1/mux4-2to1-tb.vhd) file is included. This file contains code which enumerates a few possible input values. Again, D0 and D1 are given different values and after varying S we see whether the correct value appears at the output.

## Register

### Design goal
* Input ports: D(3:0), CE, C, R
* Output ports: Q(3:0)

The register is a component that can store a 4-bit value, and resets this value to "0000" if R = 1.
The D input is used to write a value on the next clock cycle (rising edge on C input) if CE = 1. The Q output gives the currently stored value.

### Components used
[SR-flip-flops](https://github.com/leon-vv/design-project/tree/old_stuff/shared/SR-flip-flop) are used to store the contents of the register.

### High level implementation
The clock and (async.) reset signals are directly mapped to the corresponding inputs of the four SR-flip-flops. The other inputs of the flipflops are driven by a combinational logic function of CE and D. The outputs of the flipflops are mapped directly to Q.

## Simulation
The main [Readme file](https://github.com/leon-vv/design-project) contains information on how to simulate these components. A [reg-tb.vhd](https://github.com/leon-vv/design-project/blob/master/task1/reg/reg-tb.vhd) file is included. This file contains code which tests storing and resetting the contents of the register.
