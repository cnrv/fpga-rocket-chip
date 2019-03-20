#include <stdint.h>
#include "myprintf.h"
#include "uart.h"
#include "memory.h"

unsigned long long lfsr64(unsigned long long d) {
  // x^64 + x^63 + x^61 + x^60 + 1
  unsigned long long bit = 
    (d >> (64-64)) ^
    (d >> (64-63)) ^
    (d >> (64-61)) ^
    (d >> (64-60)) ^
    1;
  return (d >> 1) | (bit << 63);
}

//#define STEP_SIZE 4
#define STEP_SIZE 1024*16
//#define VERIFY_DISTANCE 2
#define VERIFY_DISTANCE 16


int main() {
  unsigned long waddr = 0;
  unsigned long raddr = 0;
  unsigned long long wkey = 0;
  unsigned long long rkey = 0;
  unsigned int i = 0;
  unsigned int error_cnt = 0;
  unsigned distance = 0;

  uart_init();
  printf("DRAM test program.\n\r", 0);

  while(1) {
    printf("Write block @%d ", waddr);
    printf("using key %d \n\r", wkey);

    for(i=0; i<STEP_SIZE; i++) {
      *(get_ddr_base() + waddr) = wkey;
      waddr = (waddr + 1) & 0x3ffffff;
      wkey = lfsr64(wkey);
    }
    
    if(distance < VERIFY_DISTANCE) distance++;

    if(distance == VERIFY_DISTANCE) {
      printf("Check block @%d ", raddr);
      printf("using key %d \n\r",  rkey);

      for(i=0; i<STEP_SIZE; i++) {
        unsigned long long rd = *(get_ddr_base() + raddr);
        if(rkey != rd) {
          printf("Error! key %d ", rd);
          printf("stored @%d ", raddr);
          printf("does not match with %d\n\r", rkey);
          error_cnt++;
          return 1;
        }
        raddr = (raddr + 1) & 0x3ffffff;
        rkey = lfsr64(rkey);
        if(error_cnt > 10) return 1;
      }
    }
  }
}
