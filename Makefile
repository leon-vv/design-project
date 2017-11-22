#.SECONDEXPANSION:
#$(foreach name, $(NAMES), build/$(name).vcd) : build/%.vcd : %/$$(notdir $(basename $$@)).vhd  | $(dir build/%)
#	ghdl_mcode -a %.vhd 
#	ghdl_mcode -r $(notdir $@) --vcd=$@ --stop-time=1000ns

.SECONDEXPANSION:
build/task1/%.vcd: task1/$$*/$$*.vhd | build/task1
	ghdl_mcode -a $<
	ghdl_mcode -r $(subst -,_,$*) --vcd=$@ --stop-time=1000ns

build/task1: | build
	mkdir -p build/task1
	
build:
	mkdir -p build
