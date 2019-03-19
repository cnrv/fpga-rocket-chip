SECTIONS
{
    . = 0x60010000;
    .text : { *(.text) }
    . = 0x60011000;
    .rodata : { *(.rodata) }
    . = 0x60012000;
    .sdata : { *(.sdata)}
}
