#define DDR_BASE  0x80000000
#define UART_BASE 0x60000000
#define BRAM_BASE 0x60010000
#define SPI_BASE  0x60020000

.section .text.start, "ax", @progbits
.globl _start
_start:
  csrwi 0x7c1, 0 // disable chicken bits
  li s0, DDR_BASE
  csrr a0, mhartid
  jr s0

.section .text.hang, "ax", @progbits
.globl _hang
_hang:
  csrwi 0x7c1, 0 // disable chicken bits
  li s0, BRAM_BASE
  csrr a0, mhartid
  jr s0

# after poweron, the PC will be set to .text.hang(@0x10040) instead of _start