all: program.txt boot.elf

csrc = crt.S boot.c uart.c myprintf.c

boot.elf: linker.ld $(csrc)
	riscv64-unknown-elf-gcc -nostdlib -mcmodel=medany -static -fno-builtin-printf -T linker.ld $(csrc) -o $@ 

program.txt: boot.elf
	riscv64-unknown-elf-objdump -D $< > $@

clean:
	rm boot.elf program.txt

refresh:
	make clean && make all