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


clean:
	cd rocket-chip/vsim && $(MAKE) clean
	cd firmware && $(MAKE) clean
	-rm $(defaultconfig_v)
	-rm $(firmware_hex)
