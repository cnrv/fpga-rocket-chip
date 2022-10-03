# neutrino 2019 summer
# IIE CAS
# Please have a look at README.md first

PROJ ?= nexys4ddr
#PROJ ?= nexysvideo

CONFIG ?= DefaultNexys4DDRConfig
#CONFIG ?= DefaultNexysVideoConfig

### vivado source
bootrom_img = rocket-chip/bootrom/bootrom.img
defaultconfig_v = rocket-chip/vsim/generated-src/freechips.rocketchip.system.$(CONFIG).v
firmware_hex = firmware/firmware.hex
vivado_project = $(PROJ)/$(PROJ).xpr

$(defaultconfig_v) : $(bootrom_img)
	CONFIG=$(CONFIG) $(MAKE) -C rocket-chip/vsim verilog
	@echo "#################################"
	@echo "##### DefaultConfig.v built #####"
	@echo "#################################"

$(bootrom_img) :
	$(MAKE) -C rocket-chip/bootrom
	@echo "#################################"
	@echo "#####   Bootrom.img built   #####"
	@echo "#################################"

$(firmware_hex) : 
	$(MAKE) -C firmware all
	@echo "#################################"
	@echo "#####  firmware.hex built   #####"
	@echo "#################################"

$(vivado_project): $(defaultconfig_v) $(firmware_hex)
	vivado -mode batch -source scripts/create_$(PROJ)_vivado_proj.tcl

vivado: $(vivado_project)
	vivado $< &

### sd_image
boot_elf = boot.elf

sd_image : $(boot_elf)

$(boot_elf) : $(VMLINUX)
ifndef VMLINUX
	$(error Please set VMLINUX. Please take a look at README)
endif
	VMLINUX=$(VMLINUX) $(MAKE) -C riscv-pk/build && cp bbl ../../boot.elf
	@echo "#################################"
	@echo "#####     boot.elf built    #####"
	@echo "#################################"

### clean
clean:
	$(MAKE) -C rocket-chip/vsim clean
	$(MAKE) -C firmware clean
	$(MAKE) -C riscv-pk/build clean
	-rm $(defaultconfig_v)
	-rm $(firmware_hex)
	-rm $(boot_elf)

cleanall:
	$(MAKE) clean
	-rm -r $(PROJ)
