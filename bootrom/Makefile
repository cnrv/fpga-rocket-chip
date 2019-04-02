all: program.txt bootrom.hex 

cdrive = uart.c myprintf.c elf.c spi.c diskio.c ff.c memory.c 

devicetree.dtb: devicetree.dts
	dtc -I dts -O dtb -o $@ $<

bootrom.elf: linker.ld head.S test.c $(cdrive) devicetree.dtb
	riscv64-unknown-elf-gcc -nostdlib -static -fno-builtin-printf -T linker.ld -DDEVICE_TREE='"devicetree.dtb"' head.S test.c $(cdrive) -o $@ 

program.txt: bootrom.elf
	riscv64-unknown-elf-objdump -D $< > $@

bootrom.bin: bootrom.elf
	riscv64-unknown-elf-objcopy -O binary $< $@

bootrom.hex: bootrom.bin
	od -t x8 -An -w8 -v $< > $@ && cp $@ .. && rm  bootrom.bin

clean:
	rm bootrom.hex bootrom.elf program.txt devicetree.dtb

refresh:
	make clean && make all