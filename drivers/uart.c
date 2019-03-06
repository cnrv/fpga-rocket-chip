// See LICENSE for license details.

#include "uart.h"

volatile uint32_t *uart_base_ptr = (uint32_t *)(UART_BASE);

void uart_init() {
  // set 0x0080 to UART.LCR to enable DLL and DLM write
  // configure baud rate
  *(uart_base_ptr + UART_LCR) = 0x0080;

  // System clock 30 MHz, 115200 baud rate
  // divisor = clk_freq / (16 * Baud)
  *(uart_base_ptr + UART_DLL) = 30*1000*1000u / (16u * 115200u) % 0x100u;
  *(uart_base_ptr + UART_DLM) = 30*1000*1000u / (16u * 115200u) >> 8;

  // 8-bit data, 1-bit odd parity
  *(uart_base_ptr + UART_LCR) = 0x000Bu;

  // Enable read IRQ
  *(uart_base_ptr + UART_IER) = 0x0001u;

  // print "uart is working ..."

    while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
  *(uart_base_ptr + UART_THR) = 0x00000075;
    while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
  *(uart_base_ptr + UART_THR) = 0x00000061;
    while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
  *(uart_base_ptr + UART_THR) = 0x00000072;
    while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
  *(uart_base_ptr + UART_THR) = 0x00000074;
    while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
  *(uart_base_ptr + UART_THR) = 0x00000020;
    while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
  *(uart_base_ptr + UART_THR) = 0x00000069;
    while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
  *(uart_base_ptr + UART_THR) = 0x00000073;
    while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
  *(uart_base_ptr + UART_THR) = 0x00000020;
    while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
  *(uart_base_ptr + UART_THR) = 0x00000077;
    while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
  *(uart_base_ptr + UART_THR) = 0x0000006f;
    while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
  *(uart_base_ptr + UART_THR) = 0x00000072;
    while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
  *(uart_base_ptr + UART_THR) = 0x0000006b;
    while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
  *(uart_base_ptr + UART_THR) = 0x00000069;
    while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
  *(uart_base_ptr + UART_THR) = 0x0000006e;
    while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
  *(uart_base_ptr + UART_THR) = 0x00000067;
    while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
  *(uart_base_ptr + UART_THR) = 0x0000000a;

  //

}

void uart_send(uint8_t data) {
  // wait until THR empty
  while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
  *(uart_base_ptr + UART_THR) = data;
}

void uart_send_string(const char *str) {
  while(*str != 0) {
    while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
    *(uart_base_ptr + UART_THR) = *(str++);
  }
}

void uart_send_buf(const char *buf, const int32_t len) {
  int32_t i;
  for(i=0; i<len; i++) {
    while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
    *(uart_base_ptr + UART_THR) = *(buf + i);
  }
}

uint8_t uart_recv() {
  // wait until RBR has data
  while(! (*(uart_base_ptr + UART_LSR) & 0x01u));

  return *(uart_base_ptr + UART_RBR);

}

// IRQ triggered read
uint8_t uart_read_irq() {
  return *(uart_base_ptr + UART_RBR);
}

// check uart IRQ for read
uint8_t uart_check_read_irq() {
  return (*(uart_base_ptr + UART_LSR) & 0x01u);
}

// enable uart read IRQ
void uart_enable_read_irq() {
  *(uart_base_ptr + UART_IER) = 0x0001u;
}

// disable uart read IRQ
void uart_disable_read_irq() {
  *(uart_base_ptr + UART_IER) = 0x0000u;
}
