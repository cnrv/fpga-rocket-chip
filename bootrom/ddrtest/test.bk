#include "uart.h"
#include <stdint.h>

volatile uint32_t* data_in_ddr = (uint32_t *) (MEM_MAP_DDR_BASE);
void helloworld(){
	uart_send(0x68);
	uart_send(0x65);
	uart_send(0x6c);
	uart_send(0x6c);
	uart_send(0x6f);
	uart_send(0x77);
	uart_send(0x6f);
	uart_send(0x72);
	uart_send(0x6c);
	uart_send(0x64);
	uart_send(0x21);
}

void main(){
	uint8_t i;
	uart_init();
	helloworld();
	*data_in_ddr = 0x00000037;
	uint32_t fetch_32 = *data_in_ddr;
	// uint8_t fetch_8 = fetch_32 & 0xff;
	while(1) uart_send(fetch_32); 
}