SECTIONS
{
    . = 0x60010000;
    .text : { *(.text) }
    . = 0x60010800;
    .sdata : { *(.sdata)}
}
