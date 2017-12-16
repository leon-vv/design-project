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
