SECTIONS
{
    ROM_BASE = 0x10000; 

    . = ROM_BASE;
    .text : { *(.text) }

}
