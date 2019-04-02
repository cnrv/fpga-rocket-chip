// See LICENSE for license details.

#ifndef SPI_HEADER_H
#define SPI_HEADER_H

#include <stdint.h>
#include "mem_map.h"

// Xilinx AXI_QUAD_SPI

#ifdef MEM_MAP_SPI_BASE
  #define SPI_BASE ((uint32_t)MEM_MAP_SPI_BASE)
#else
  #define SPI_BASE 0
#endif

// Global interrupt enable register [Write]
#define SPI_GIER 0x07u

// IP interrupt status register [Read/Toggle to write]
#define SPI_ISR 0x08u

// IP interrupt enable register [Read/Write]
#define SPI_IER 0x0Au

// Software reset register [Write]
#define SPI_SRR 0x10u

// SPI control register [Read/Write]
#define SPI_CR 0x18u

// SPI status register [Read]
#define SPI_SR 0x19u

// SPI data transmit register, FIFO-16 [Write]
#define SPI_DTR 0x1Au

// SPI data receive register, FIFO-16 [Read]
#define SPI_DRR 0x1Bu

// SPI Slave select register, [Read/Write]
#define SPI_SSR 0x1Cu

// Transmit FIFO occupancy register [Read]
#define SPI_TFOR 0x1Du

// Receive FIFO occupancy register [Read]
#define SPI_RFROR 0x1Eu

/////////////////////////////
// SPI APIs

// start spi
void spi_init();

// disable spi
void spi_disable();

// send a byte
uint8_t spi_send(uint8_t dat);

// send multiple byte, n<=16
void spi_send_multi(const uint8_t* dat, uint8_t n);

// recv multiple byte, n<=16
void spi_recv_multi(uint8_t* dat, uint8_t n);

// select slave device
void spi_select_slave(uint8_t id);

// deselect slave device
void spi_deselect_slave(uint8_t id);

#endif
