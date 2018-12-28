.equ UART_BASE 0x61000000

.section .text
.globl _start
_start:
  li s0, UART_BASE
  li s1, 0x4848484848484848 
  sd s1, 0(s0)
  li s1, 0x6565656565656565
  sd s1, 0(s0)
  li s1, 0x6c6c6c6c6c6c6c6c
  sd s1, 0(s0)
  li s1, 0x6c6c6c6c6c6c6c6c
  sd s1, 0(s0)
  li s1, 0x6f6f6f6f6f6f6f6f
  sd s1, 0(s0)
  li s1, 0x2020202020202020
  sd s1, 0(s0)
  li s1, 0x5757575757575757
  sd s1, 0(s0)
  li s1, 0x6f6f6f6f6f6f6f6f
  sd s1, 0(s0)
  li s1, 0x7272727272727272
  sd s1, 0(s0)
  li s1, 0x6c6c6c6c6c6c6c6c
  sd s1, 0(s0)
  li s1, 0x6464646464646464
  sd s1, 0(s0)
  li s1, 0x2020202020202020



