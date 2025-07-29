VSRC = $(wildcard ./vsrc/*.v)
CSRC = $(wildcard ./csrc/*.cpp) 
all:
	@echo "Write this Makefile by your self."

sim:
	$(call git_commit, "sim RTL") # DO NOT REMOVE THIS LINE!!!
	@echo $(VSRC)
	@echo $(CSRC)
	verilator --cc --exe --build -Wall --trace-fst $(VSRC) $(CSRC)
	./obj_dir/Vexample
include ../Makefile
