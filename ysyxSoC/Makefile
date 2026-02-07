V_FILE_GEN   = build/ysyxSoCTop.sv
V_FILE_FINAL = build/ysyxSoCFull.v
SCALA_FILES = $(shell find src/ -name "*.scala")

# Firtool version
FIRTOOL_VERSION = 1.105.0
FIRTOOL_PATCH_DIR = $(shell pwd)/patch/firtool

$(V_FILE_FINAL): $(SCALA_FILES)
# Replace firtool with a newer version
# TODO: This can be removed after chisel publishes a new version
	@./patch/update-firtool.sh $(FIRTOOL_VERSION) $(FIRTOOL_PATCH_DIR)
	CHISEL_FIRTOOL_PATH=$(FIRTOOL_PATCH_DIR)/firtool-$(FIRTOOL_VERSION)/bin \
	mill -i ysyxsoc.runMain ysyx.Elaborate --target-dir $(@D)
	mv $(V_FILE_GEN) $@
	sed -i -e 's/_\(aw\|ar\|w\|r\|b\)_\(\|bits_\)/_\1/g' $@
	sed -i '/firrtl_black_box_resource_files.f/, $$d' $@
	sed -i -e 's/\[15:0\] sdram_dq/[31:0] sdram_dq/g' $@
	sed -i -e 's/\[1:0\] sdram_dqm/[3:0] sdram_dqm/g' $@
	sed -i -e 's/\[12:0\] sdram_a/[13:0] sdram_a/g' $@
	sed -i -e 's/\[12:0\] _asic_sdram_a/[13:0] _asic_sdram_a/g' $@
	sed -i -e 's/\[15:0\] _dq_wire/[31:0] _dq_wire/g' $@
	sed -i -e 's/\[1:0\]  _asic_sdram_dqm/[3:0]  _asic_sdram_dqm/g' $@
	sed -i -e 's/^                sdram_bundle_dqm,/  output [3:0]  sdram_bundle_dqm,/g' $@
	sed -i -e 's/\[15:0\] sdram_bundle_dq/[31:0] sdram_bundle_dq/g' $@
	sed -i -e 's/\[12:0\] sdram_bundle_a/[13:0] sdram_bundle_a/g' $@
	sed -i -e 's/^                sdram_dqm,/  output [3:0]  sdram_dqm,/g' $@
	sed -i -e 's/^                sdram_a,/  output [13:0] sdram_a,/g' $@
	sed -i -e 's/ysyx_00000000/ysyx_25010003/g' $@

verilog: $(V_FILE_FINAL)

clean:
	-rm -rf build/

dev-init:
	git submodule update --init --recursive
	cd rocket-chip && git apply ../patch/rocket-chip.patch

.PHONY: verilog clean dev-init
