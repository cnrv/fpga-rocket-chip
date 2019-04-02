#include <stdint.h>
#include "dprintf.h"

void main(){
	uart_init();
	dprintf("nice work, neutrino\n\r", 0 );
	uintptr_t ptr = 0x80016000;
	int i, res;
	uint32_t * pointer = (uint32_t *) ptr;
	for (i = 0; i<20; i++){
		dprintf("%h: ", (uintptr_t) (pointer+i));
		dprintf("%h\n\r", *(pointer+i));
	}
}