VERILATOR = verilator
IVERILOG = iverilog$(ICARUS_SUFFIX)
VVP = vvp$(ICARUS_SUFFIX)


test: testbench.vvp firmware.hex
	$(VVP) -N $< 

testbench.vvp: testbench.v picorv32.v
	$(IVERILOG) -o $@ $(subst C,-DCOMPRESSED_ISA,$(COMPRESSED_ISA)) $^
	chmod -x $@

clean:
	rm ./testbench.vvp
