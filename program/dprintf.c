// See LICENSE for license details.

#include "dprintf.h"

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

}

void uart_send(uint8_t data) {
  // wait until THR empty
  while(! (*(uart_base_ptr + UART_LSR) & 0x40u));
  *(uart_base_ptr + UART_THR) = data;
}

////////////////////////////////////////////////////////////////////

static void dputch(uint8_t ch){
	uart_send(ch);
}

static void dprintNum(uint64_t num, uint64_t base)
{
  if (num == 0) return;
  dprintNum(num / base, base);
    dputch("0123456789abcdef"[num % base]);
}

// void printf(char *s, ...)
void dprintf(uint8_t *s, uint64_t num)
{
    int i = 0;
    // va_list va_ptr;
    // va_start(va_ptr, s);
    while (s[i] != '\0')
    {
		if (s[i] != '%') dputch(s[i++]);
		else
	       	switch (s[++i])  
    		{
    			case 'd': {
    						// printDeci(va_arg(va_ptr,int));           
                            if (num == 0) dputch('0');
                                else dprintNum(num,10); 
    			  		  	i++;
    			  		  	continue;
    			  		  	}
          case 'h': {
                // printDeci(va_arg(va_ptr,int));  
                            dputch('0');
                            dputch('x');         
                            if (num == 0) dputch('0');
                                else dprintNum(num,16); 
                    i++;
                    continue;
                    }
    			default : {
    						i++;
    						continue;
    						}
    		}

    }

    // va_end(va_ptr);
}


