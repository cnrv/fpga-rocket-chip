
#include "myprintf.h"

void putch(uint8_t ch){
	uart_send(ch);
}

// void printf(char *s, ...)
void printf(uint8_t *s, uint64_t num)
{
    int i = 0;
    // va_list va_ptr;
    // va_start(va_ptr, s);
    while (s[i] != '\0')
    {
		if (s[i] != '%') putch(s[i++]);
		else
	       	switch (s[++i])  
    		{
    			case 'd': {
    						// printDeci(va_arg(va_ptr,int));           
                            if (num == 0) putch('0');
                                else printNum(num, 10); 
    			  		  	i++;
    			  		  	continue;
    			  		  	}
                case 'h': {
                            // printDeci(va_arg(va_ptr,int));
                            putch('0');
                            putch('x');           
                            if (num == 0) putch('0');
                                else printNum(num, 16); 
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

void printNum(uint64_t num, int base)
{
	if (num == 0) return;
	printNum(num / base, base);
    putch("0123456789abcdef"[num % base]);
}