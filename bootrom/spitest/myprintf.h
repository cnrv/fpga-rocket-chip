#ifndef PRINTF_HEADER
#define PRINTF_HEADER

#include <stdint.h>
// #include <stdarg.h>
#include "uart.h"

// extern void printf(char*, ...);				
extern void printf(uint8_t *, uint32_t);
void printNum(uint32_t); 
void putch(uint8_t);

#endif
