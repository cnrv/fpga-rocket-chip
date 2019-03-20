all: program.txt bootrom.hex 

bootrom.elf: linker.ld crt.S test.c uart.c myprintf.c spi.c diskio.c ff.c memory.c
	riscv64-unknown-elf-gcc -nostdlib -static -fno-builtin-printf -T linker.ld crt.S test.c uart.c myprintf.c spi.c diskio.c ff.c memory.c -o $@ 

program.txt: bootrom.elf
	riscv64-unknown-elf-objdump -D $< > $@

bootrom.bin: bootrom.elf
	riscv64-unknown-elf-objcopy -O binary $< $@

bootrom.hex: bootrom.bin
	od -t x8 -An -w8 -v $< > $@ && cp $@ .. && rm  bootrom.bin

clean:
	rm bootrom.hex bootrom.elf program.txt

refresh:
	make clean && make all