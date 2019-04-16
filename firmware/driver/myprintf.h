#ifndef PRINTF_HEADER
#define PRINTF_HEADER

#include <stdint.h>
// #include <stdarg.h>
#include "uart.h"

// extern void printf(char*, ...);				
extern void printf(uint8_t *, uint64_t);
void printNum(uint64_t, int); 
void putch(uint8_t);

#endif
