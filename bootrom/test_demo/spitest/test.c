// SD test program

#include <stddef.h>
#include "diskio.h"
#include "ff.h"
#include "uart.h"
#include "myprintf.h"
#include "spi.h"
/* Read a text file and display it */

FATFS FatFs;   /* Work area (file system object) for logical drive */

int main (void)
{
  FIL fil;                /* File object */
  uint8_t buffer[64];     /* File copy buffer */
  FRESULT fr;             /* FatFs return code */
  uint32_t br;            /* Read count */
  uint32_t i;

  uart_init();
  int num = 0x7fff;
  printf("uart start working, printf should be fine if 32767 = %d \n\r", num);
  /* Register work area to the default drive */
  if(f_mount(&FatFs, "", 1)) {
    printf("Fail to mount SD driver!\n\r", 0);
    return 1;
  }

  /* Open a text file */
  fr = f_open(&fil, "test.txt", FA_READ);
  if (fr) {
    printf("failed to open test.text!\n\r", 0);
    return (int)fr;
  } else {
    printf("test.txt opened\n\r", 0);
  }

  /* Read all lines and display it */
  uint32_t fsize = 0;
  for (;;) {
    fr = f_read(&fil, buffer, sizeof(buffer)-1, &br);  /* Read a chunk of source file */
    if (fr || br == 0) break; /* error or eof */
    buffer[br] = 0;
    printf(buffer, 0);
    fsize += br;
  }

  printf("file size %d\n", fsize);

  /* Close the file */
  if(f_close(&fil)) {
    printf("fail to close file!", 0);
    return 1;
  }
  if(f_mount(NULL, "", 1)) {         /* unmount it */
    printf("fail to umount disk!", 0);
    return 1;
  }

  printf("test.txt closed.\n", 0);

  return 0;
}
