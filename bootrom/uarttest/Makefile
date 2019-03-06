all: program.txt bootrom.hex 

bootrom.elf: linker.ld crt.S test.c uart.c 
	riscv64-unknown-elf-gcc -nostdlib -static -T linker.ld crt.S test.c uart.c -o $@ 

program.txt: bootrom.elf
	riscv64-unknown-elf-objdump -S $< > $@

bootrom.bin: bootrom.elf
	riscv64-unknown-elf-objcopy -O binary $< $@

bootrom.hex: bootrom.bin
	od -t x8 -An -w8 -v $< > $@ && cp $@ .. && rm  bootrom.bin
