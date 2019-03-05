#include <stdint.h>
// #include "mem_map.h"
#include "uart.h"
#define ASCII_MASK 0x000000ff

volatile uint32_t* data_in_ddr = (uint32_t *) (MEM_MAP_DDR_BASE) + 0x00000080;

void main(){
	uart_init();
	*data_in_ddr = 0x00000037;

	while (1) {
		*data_in_ddr = ((*data_in_ddr) + 1 ) & ASCII_MASK;
		uart_send(*data_in_ddr);
	}
}