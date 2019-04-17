# neutrino 2019 summer
# IIE CAS


### vivado source
defaultconfig_v = verilog/DefaultConfig.v
firmware_hex = verilog/firmware.hex

bootrom_img = rocket-chip/bootrom/bootrom.img
bootrom_s = rocket-chip/bootrom/bootrom.S

vivado_source : $(defaultconfig_v) $(firmware_hex)

$(defaultconfig_v) : $(bootrom_img)
	cd rocket-chip/vsim && $(MAKE) verilog && cp generated-src/freechips.rocketchip.system.DefaultConfig.v ../verilog/DefaultConfig.v
	@echo "##### DefaultConfig.v built #####"

$(bootrom_img) : $(bootrom_s)
	cd rocket-chip/bootrom && $(MAKE)
	@echo "#####   Bootrom.img built   #####"

$(firmware_hex) : 
	cd firmware && $(MAKE) all
	@echo "#####  firmware.hex built   #####"




### sd_image
vmlinux_path ?= /home/neutrino/Desktop/linux/riscv-linux/vmlinux
boot_elf = boot.elf

sd_image : $(boot_elf)

$(boot_elf) : $(vmlinux_path)
	cd riscv-pk/build && $(MAKE) VMLINUX=$(vmlinux_path) && cp bbl ../../boot.elf
	@echo "#####     boot.elf built    #####"

clean:
	cd rocket-chip/vsim && $(MAKE) clean
	cd firmware && $(MAKE) clean
	cd riscv-pk/build && $(MAKE) clean
	-rm $(defaultconfig_v)
	-rm $(firmware_hex)
	-rm $(boot_elf)