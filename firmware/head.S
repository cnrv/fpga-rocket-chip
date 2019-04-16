#define DDR_BASE 0x80000000

  .text
  .globl _start
_start:

  li  x1, 0
  li  x2, 0
  li  x3, 0
  li  x4, 0
  li  x5, 0
  li  x6, 0
  li  x7, 0
  li  x8, 0
  li  x9, 0
  li  x10,0
  li  x11,0
  li  x12,0
  li  x13,0
  li  x14,0
  li  x15,0
  li  x16,0
  li  x17,0
  li  x18,0
  li  x19,0
  li  x20,0
  li  x21,0
  li  x22,0
  li  x23,0
  li  x24,0
  li  x25,0
  li  x26,0
  li  x27,0
  li  x28,0
  li  x29,0
  li  x30,0
  li  x31,0

  la sp, _stack

  jal main

  li s0, DDR_BASE
  csrr a0, mhartid
# la a1, _dtb
  jr s0

  .section ".stack", "awx"
  .globl _stack
_stack:

# currently we put dtb into the boot.elf image for debug convinence. 
# generally it should be put into firmware, namely, here.
#   .section ".dtb", "ax"
#   .globl _dtb
# _dtb:
#   .incbin DEVICE_TREE
