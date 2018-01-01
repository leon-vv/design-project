..\..\ghdl\bin\ghdl.exe -a ..\..\shared\four-adder\four-adder.vhd
..\..\ghdl\bin\ghdl.exe -a ..\..\shared\full-adder\full-adder.vhd
..\..\ghdl\bin\ghdl.exe -a ..\..\shared\SR-flip-flop\SR-flip-flop.vhd
..\..\ghdl\bin\ghdl.exe -a ..\..\task1\mux1-2to1\mux1-2to1.vhd
..\..\ghdl\bin\ghdl.exe -a ..\..\task1\mux4-2to1\mux4-2to1.vhd
..\..\ghdl\bin\ghdl.exe -a ..\..\task1\reg\reg.vhd
..\..\ghdl\bin\ghdl.exe -a ..\..\task2\alu\alu.vhd
..\..\ghdl\bin\ghdl.exe -a ..\..\task2\status-reg\status-reg.vhd
..\..\ghdl\bin\ghdl.exe -a ..\..\task3\program-counter\program-counter.vhd
..\..\ghdl\bin\ghdl.exe -a ..\..\task3\rom-16x7\rom-16x7.vhd
..\..\ghdl\bin\ghdl.exe -a ..\..\task4\instruction-decoder\instruction-decoder.vhd
..\..\ghdl\bin\ghdl.exe -a processor.vhd
..\..\ghdl\bin\ghdl.exe -a processor-tb.vhd
..\..\ghdl\bin\ghdl.exe -r processor_tb --vcd=test.vcd --stop-time=6800ns
pause
