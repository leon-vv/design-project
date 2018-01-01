..\..\ghdl\bin\ghdl.exe -a instruction-decoder.vhd
..\..\ghdl\bin\ghdl.exe -a instruction-decoder-tb.vhd
..\..\ghdl\bin\ghdl.exe -r instruction_decoder_tb --vcd=test.vcd --stop-time=6800ns
pause
