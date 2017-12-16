# Task Three Report

## Program counter

### Design goal

The Program Counter is a component which contains a state of 4-bits. These bits represent the next instruction to be executed. The instruction address encoded in the 4-bits is increment every clock cycle but can also be updated by a value read from the memory.

* Input ports: Data(3:0), Carry, Load, CLK, RST
* Output ports: Q(3:0) 

Using these port names we could specify the state transistions of the program counter using the following pseudo code, which is hypothetically ran every clock cycle.
```javascript
if(Carry && Load) Q = Data;
else Q = Q + 1;
```

The RST input is asynchronous and resets the state to zero (Q = 0).

### Components used
* [Four Adder:](https://github.com/leon-vv/design-project/blob/master/shared/four-adder/four-adder.vhd) add two four bit numbers, implemented using four [Full Adders](https://github.com/leon-vv/design-project/blob/master/shared/full-adder/full-adder.vhd).
* [SR Flip Flop](https://github.com/leon-vv/design-project/tree/master/shared/SR-flip-flop)
* [Mux4_2to1:](https://github.com/leon-vv/design-project/blob/master/task1/mux4-2to1/mux4-2to1.vhd) see the report for task 1 for a full description of this component

### High level implementation

Four SR Flip Flops are used to represent the Program Counter state. The new state is chosen using the Mux4_2to1 component. By supplying a '1' for the 'Carry-In' value and "0000" for the second number the Four Adder turns into a simple increment circuit. The inputs to the Mux consist of the current state incremented by one and the ROM data supplied at port D(3:0). The select line of the MUX is the output of an And gate whose inputs are the Carry and Load input ports.


### Simulation
The main [Readme file](https://github.com/leon-vv/design-project) contains information on how to simulate these components. A [program-counter-tb.vhd](https://github.com/leon-vv/design-project/blob/master/task3/program-counter/program-counter-tb.vhd) file is included. This file contains a loop which generates many possible input signals. By inspecting the outputs we can be sure the component is bug free for these inputs.



## Read only memory (ROM)
### Design goal
### Components used
### High Level implementation
### Simulation

The ROM is implemented with a 4 to 16 decoder (which itself is implemented as a binary tree of 1 to 2 decoders with enable bits), a vector of bits to represent the data, and seven 16-input OR gates. The decoder is used to select the right memory cell, and uses the supplied address as its input. The data in each memory cell is AND'ed with the corresponding output bit from the decoder, the resulting bits (which can only be one for the selected cell) are then OR'ed together with the bits from the other cells to get each of the 7 bits of the output.
