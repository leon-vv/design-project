# Task Two Report

## Status Register

### Design goal

* Input ports: D, CE, CLK
* Output ports: Q

The status register is a simple synchronous component which 'remembers' the value of D when CE is one. Using the port names we could specify the state transistions of the status register using the following pseudo code, which is hypothetically ran every clock cycle.
```javascript
if(CE) Q = D;
```
So whenever the Change Enable port is not set, the value of Q does not change. 

### Components used
* [SR Flip Flop](https://github.com/leon-vv/design-project/blob/old_stuff/shared/SR-flip-flop/SR-flip-flop.vhd)

### High level implementation
The Set port of the SR Flip Flop is connected to D. Furthermore D is inverted using a not gate and connected to the Reset port. The CE input is connected to the Enable port of the SR Flip Flop. We have no use for the RST port of the SR Flip Flop so we pass in zero.


### Simulation
The main [Readme file](https://github.com/leon-vv/design-project) contains information on how to simulate these components. A [status-reg-tb.vhd](https://github.com/leon-vv/design-project/blob/master/task2/status-reg/status-reg-tb.vhd) file is included. This file contains code which generates the four possible values for the D and CE inputs.

## ALU

### Design goal

* Input ports: A(3:0), B(3:0), S(1:0)
* Output ports: res(3:0), CO

The ALU is does all data manipulation in the processor, it supports four operations: add, shift right, shift left, (1's) complement.
The A and optionally also B inputs are used as operands and the S input is used to select one of the four operations. The result is presented on output port res(3:0). In the case of addition, the carry out bit is presented on the CO output port.

### Components used
* [Four Adder](https://github.com/leon-vv/design-project/tree/old_stuff/shared/four-adder) is used to perform addition.

### High level implementation
The four adder is used to calculate the sum of A and B. Shift left, shift right and complement operations are implemented as simple combinational logic circuits. The result of all four operations is calculated, and fed into a combinational logic function along with the S input to select the result of the desired operation.

### Simulation
The main [Readme file](https://github.com/leon-vv/design-project) contains information on how to simulate these components. A [alu-tb.vhd](https://github.com/leon-vv/design-project/blob/master/task2/alu/alu-tb.vhd) file is included. This file contains a loop which generates a few possible operand values and sets S for each of the four operations.
