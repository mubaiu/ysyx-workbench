# Makefile for Bitrev Simulation

# Verilator configuration
VERILATOR = verilator
VERILATOR_FLAGS = -Wall -Wno-fatal --trace --cc --exe --build

# Icarus Verilog configuration
IVERILOG = iverilog
VVP = vvp
IVERILOG_FLAGS = -g2012

# Source files
VERILOG_SRC = bitrev.v
CPP_TB = tb_bitrev.cpp
VERILOG_TB = bitrev_tb.v

# Output files
TARGET = obj_dir/Vbitrev
VVP_TARGET = bitrev_tb.vvp

# Default target - run Verilog testbench
all: sim-verilog

# Verilator targets
verilator: $(TARGET)

# Build Verilator simulation
$(TARGET): $(VERILOG_SRC) $(CPP_TB)
	$(VERILATOR) $(VERILATOR_FLAGS) $(VERILOG_SRC) $(CPP_TB)

# Run Verilator simulation
run-verilator: $(TARGET)
	./$(TARGET)

# Compile Verilog testbench with iverilog
$(VVP_TARGET): $(VERILOG_SRC) $(VERILOG_TB)
	$(IVERILOG) $(IVERILOG_FLAGS) -o $(VVP_TARGET) $(VERILOG_SRC) $(VERILOG_TB)

# Run Verilog testbench simulation
sim-verilog: $(VVP_TARGET)
	$(VVP) $(VVP_TARGET)

# View waveform with GTKWave (Verilog testbench)
wave: bitrev_tb.vcd
	gtkwave bitrev_tb.vcd

# View waveform with GTKWave (Verilator testbench)
wave-verilator: bitrev.vcd
	gtkwave bitrev.vcd

# Clean build artifacts
clean:
	rm -rf obj_dir
	rm -f bitrev.vcd bitrev_tb.vcd $(VVP_TARGET)

.PHONY: all verilator run-verilator sim-verilog wave wave-verilator clean
