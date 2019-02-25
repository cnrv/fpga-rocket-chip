#include "uart.h"
#include <stdint.h>

void main(){
	uart_init();
	uart_send((uint8_t)7);
}