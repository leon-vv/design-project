..\ghdl\bin\ghdl.exe -a alu.vhd
..\ghdl\bin\ghdl.exe -a alu-tb.vhd
..\ghdl\bin\ghdl.exe -r alu_tb --vcd=alu_test.vcd --stop-time=5000ns
pause
