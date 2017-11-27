..\ghdl\bin\ghdl.exe -a reg.vhd
..\ghdl\bin\ghdl.exe -a reg-tb.vhd
..\ghdl\bin\ghdl.exe -r reg_tb --vcd=reg_test.vcd --stop-time=5000ns
pause
