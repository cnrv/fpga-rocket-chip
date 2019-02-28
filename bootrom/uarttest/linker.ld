SECTIONS
{
    . = 0x60010000;
    .text : { *(.text) }
    . = 0x60010400;
    .sdata : { *(.sdata)}
}
