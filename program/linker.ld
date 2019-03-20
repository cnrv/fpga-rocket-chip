SECTIONS
{
    . = 0x80000000;
    .text : { *(.text) }
    
    .rodata : { *(.rodata) }


    .bss : { *(.bss) }

    .sbss : { *(.sbss) }

    . = 0x80002000;
    .sdata : { *(.sdata) }
}
