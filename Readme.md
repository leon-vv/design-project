# Digital Techniques Design Project

### Structure

Files in this repository are grouped by task number. The deliverables that correspond to the task numbers can be found in the [project schedule](http://liacs.leidenuniv.nl/~stefanovtp/courses/DITE/project/Design_Project_DITE.pdf). Every major component has it's own testbench. These testbenches are standalone files with names ending on '-tb.vhd'.

### ISE environment

The repository contains a DITEProject.xise file. This file can be opened in the Xilinx ISE. To do this, simply use 'File -> Open Project' and select the supplied DITEProject.xise file.

### Simulating the components

These deliverables have been tested using the [GHDL](http://ghdl.free.fr/) tool on Linux. This tool is capable of producing [VCD](https://en.wikipedia.org/wiki/Value_change_dump) files which can be inspected using for example [GTKWave](http://gtkwave.sourceforge.net/). Producing these files has been automated using a python file that can be run using the [DoIt](http://pydoit.org/) program.

To install these tools on Debian use:
```
sudo apt-get install gtkwave ghdl python3-doit
```

Use `doit3 list` to see available tasks, `doit3 info <taskname>` for more information and `doit3 <taskname>` to produce the corresponding output file.

These files can also be produced manually. For example, for the "mux4-2to1" test bench the following should work:

```
ghdl_mcode -a ./task1/mux4-2to1/mux4-2to1/mux4-2to1.vhd
ghdl_mcode -a ./task1/mux4-2to1/mux4-2to1/mux4-2to1-tb.vhd
ghdl_mcode -a ./task1/mux1-2to1/mux1-2to1.vhd  
ghdl_mcode -r mux4_2to1_tb --vcd=output.vcd --stop-time=2000ns
```
