# Task five report

## Processor

### Design goal
* Input ports: data(111:0), CLK, RST
* Output ports: register_a(3:0), register_b(3:0)

The processor is a circuit that combines all previously developed components into a small computer, using the schematics as provided in the [Project Spec Appendix](http://liacs.leidenuniv.nl/~stefanovtp/courses/DITE/project/myProcessor.pdf).

### Components used
All components from previous tasks have been used.

### High level implementation
The processor has been implemented by connecting all components accoring to the previously mentioned [schematic](http://liacs.leidenuniv.nl/~stefanovtp/courses/DITE/project/myProcessor.pdf), and by adding three new ports to the ports already specified in the schematic (CLK and RST): 'data' for setting the ROM, 'register_a' and 'register_b' to output the two register values. 

### Negative values and substraction in our processor
The processor doesn't support subtraction or sign change by itself, but the instruction sequence: NOTA, LDB 1, ADDAB can be used to flip the sign of register A in signed two's complement notation, which can then be used to do subtraction.

### Simulation
The main [Readme file](https://github.com/leon-vv/design-project) contains information on how to simulate the processor. A [processor-tb.vhd](https://github.com/leon-vv/design-project/blob/master/task5/processor/processor-tb.vhd) file is included. This file contains code to load the two variants of the program specified in the [Project Spec, Task 5](http://liacs.leidenuniv.nl/~stefanovtp/courses/DITE/project/Design_Project_DITE.pdf) in ROM, to reset the processor and to generate a clock signal. By inspecting the output in register_b we can check if the calculated numbers match the expected values 1 and -6 (or 1010b in signed two's complement notation).
