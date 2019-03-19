SECTIONS
{
    . = 0x60010000;
    .text : { *(.text) }
    
    . = 0x6001a000;
    .rodata : { *(.rodata) }


    .bss : { *(.bss) }

    .sbss : { *(.sbss) }

    . = 0x6001ff00;
    .sdata : { *(.sdata) }
}
