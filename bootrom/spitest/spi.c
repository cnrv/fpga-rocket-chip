// See LICENSE for license details.

#include "spi.h"

#define GetBit(r, p) (((r) & (1 <<p)) >> p)

volatile uint32_t *spi_base_ptr = (uint32_t *)(SPI_BASE);

void spi_init() {
  uint32_t resp;

  // power off SD
  *(spi_base_ptr) = 0x1;

  // software reset?
  *(spi_base_ptr + SPI_SRR) = 0xa;

  // set control register
  // MSB first, master, reset FIFOs, SPI disabled, clock 00 mode
  *(spi_base_ptr + SPI_CR) = 0xE4;
  
  // disable interrupt, full polling mode
  *(spi_base_ptr + SPI_GIER) = 0x0;

  // read status register
  //resp = (*(spi_base_ptr + SPI_SR)) & 0x7FF;
  //if(resp != 0x25)
  //  return SD_ERR_SPI; // SPI error!

  // enable spi
  *(spi_base_ptr + SPI_CR) = 0x86;

  // power on SD
   *(spi_base_ptr) = 0x0;

}


void spi_disable() {
  // power off SD
  *(spi_base_ptr) = 0x1;

  *(spi_base_ptr + SPI_CR) = 0xE4;
}

uint8_t spi_send(uint8_t dat) {
  *(spi_base_ptr + SPI_DTR) = dat;
  while(!GetBit(*(spi_base_ptr + SPI_SR), 2));
  return *(spi_base_ptr + SPI_DRR);
}

void spi_send_multi(const uint8_t* dat, uint8_t n) {
  uint8_t i;
  for(i=0; i<n; i++)
    *(spi_base_ptr + SPI_DTR) = *(dat++);
  while(!GetBit(*(spi_base_ptr + SPI_SR), 2));
  // reset recv FIFO
  *(spi_base_ptr + SPI_CR) = 0xC6;
}

void spi_recv_multi(uint8_t* dat, uint8_t n) {
  uint8_t i;
  for(i=0; i<n; i++)
    *(spi_base_ptr + SPI_DTR) = 0xff;
  while(!GetBit(*(spi_base_ptr + SPI_SR), 2));
  for(i=0; i<n; i++)
    *(dat++) = *(spi_base_ptr + SPI_DRR);
}

void spi_select_slave(uint8_t id) {
  *(spi_base_ptr + SPI_SSR) = 0xFFFFFFFE;
}

void spi_deselect_slave(uint8_t id) {
  *(spi_base_ptr + SPI_SSR) = 0xFFFFFFFF;
}

