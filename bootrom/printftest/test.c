#include <stdint.h>
#include "myprintf.h"
#include "uart.h"

void main(){
	uart_init();
	int i = 555;
	// printf("5", 5);
	printf("%d", i);
}