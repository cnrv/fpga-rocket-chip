#include "uart.h"
#include <stdint.h>

void main(){
	uint8_t i;
	uart_init();
	while (1) 
		{
			for (i=(uint8_t)48;i++;i<(uint8_t)58) uart_send(i);
			
			uart_send((uint8_t)13);
		}
}