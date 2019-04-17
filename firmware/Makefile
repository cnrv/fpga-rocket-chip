all: firmware.hex #program.txt 


driver_dir = ./driver

c_driver =  				\
$(driver_dir)/uart.c 		\
$(driver_dir)/myprintf.c 	\
$(driver_dir)/elf.c 		\
$(driver_dir)/spi.c 		\
$(driver_dir)/diskio.c 		\
$(driver_dir)/ff.c 			\
$(driver_dir)/memory.c 


# currently we put dtb into the boot.elf image (in SD card) for debug convinence. generally it should be put into firmware.
# devicetree.dtb: devicetree.dts 
# 	dtc -I dts -O dtb -o $@ $<

firmware.elf: linker.ld head.S sdload.c $(c_driver) # devicetree.dtb
	riscv64-unknown-elf-gcc -nostdlib -static -fno-builtin-printf -T linker.ld -I $(driver_dir) head.S sdload.c $(c_driver) -o $@ # -DDEVICE_TREE='"devicetree.dtb"' 

# program.txt is used to check the instructions
# program.txt: firmware.elf
# 	riscv64-unknown-elf-objdump -D $< > $@

firmware.bin: firmware.elf
	riscv64-unknown-elf-objcopy -O binary $< $@

firmware.hex: firmware.bin
	od -t x8 -An -w8 -v $< > $@  

clean:
	-rm firmware.hex firmware.elf firmware.bin #program.txt devicetree.dtb

refresh:
	make clean && make all