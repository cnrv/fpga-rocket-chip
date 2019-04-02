all: program.txt boot.elf

csrc = crt.S boot.c dprintf.c

boot.elf: linker.ld $(csrc)
	riscv64-unknown-elf-gcc -nostdlib -mcmodel=medany -static -fno-builtin-printf -T linker.ld $(csrc) -DDEVICE_TREE='"my_device_tree"' -o $@ 

program.txt: boot.elf
	riscv64-unknown-elf-objdump -D $< > $@

clean:
	rm boot.elf program.txt

refresh:
	make clean && make all