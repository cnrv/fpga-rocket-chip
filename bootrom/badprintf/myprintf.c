#include "myprintf.h"


void putch(char ch){
    uart_send((uint8_t)ch);
}

void printf(char *s, ...)
{
    int i = 0;
    va_list va_ptr;
    va_start(va_ptr, s);

    while (s[i] != '\0')
    {
		if (s[i] != '%')
		{
    	    putch(s[i++]);
			continue;
		}
		switch (s[++i])   
		{
			case 'd': printDeci(va_arg(va_ptr,int));           
			  		  break; 
		    case 'x': printHex(va_arg(va_ptr,uint32_t));  
			  		  break;
		    case 'p': printAddr(va_arg(va_ptr,uint32_t));
			  		  break;
		    case 's': printStr(va_arg(va_ptr,char *));
					  break;
			default : break;
		}

		i++; 
    }
    va_end(va_ptr);
}

void printNum(uint32_t num, int base)
{
	if (num == 0)
    {
        return;
    }
    
	printNum(num/base, base);
    putch("0123456789abcdef"[num%base]);
}

void printDeci(int dec)
{
    int num;

	if (dec < 0)
    {
        putch('-');
		dec = -dec;  	   
    }

    if (dec == 0)
    {
        putch('0');
		return;
    }
    else
    {
        printNum(dec, 10); 
    }
}

void printHex(uint32_t hex)
{
    if (hex == 0)			
    {
        putch('0');
		return;
    }
    else
    {
        printNum(hex,16);	
    }
}

void printAddr(uint32_t addr)
{
	putch('0');
    putch('x');
    printNum(addr, 16);
}


void printStr(char *str)
{
    int i = 0;

    while (str[i] != '\0')
    {
        putch(str[i++]);
    }
}

