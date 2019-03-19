#include <stdint.h>
#include <stdarg.h>
#include "uart.h"

extern void printf(char*, ...);			
void putch(char);
void printNum(uint32_t, int); 
void printDeci(int);		
void printHex(uint32_t );				
void printAddr(uint32_t );
void printStr(char*);					
