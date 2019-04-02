SECTIONS
{
    . = 0x60010000;
    .text : { *(.text) }
    
  	. = ALIGN(0x1000);
    .rodata : { *(.rodata) }
    .bss : { *(.bss) }
    .sbss : { *(.sbss) }

  	. = ALIGN(0x1000);
  	.dtb : { *(.dtb) }

    . = 0x6001f000;
    .stack : { *(.stack) }

    . = 0x6001ff00;
    .sdata : { *(.sdata) }
}
