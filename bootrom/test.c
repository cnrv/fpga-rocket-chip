
#include <stdint.h>
#include <stddef.h>
#include "myprintf.h"
#include "bits.h"
#include "diskio.h"
#include "ff.h"
#include "uart.h"
#include "elf.h"
#include "memory.h"
#include "spi.h"

FATFS FatFs;   // Work area (file system object) for logical drive

// max size of file image is 16M
#define MAX_FILE_SIZE 0x1000000

// size of DDR RAM (128M for NEXYS4-DDR) 
#define DDR_SIZE 0x8000000

// 4K size read burst
#define SD_READ_SIZE 4096

int main (void)
{
  FIL fil;                // File object
  FRESULT fr;             // FatFs return code
  uint8_t *boot_file_buf = (uint8_t *)(get_ddr_base()) + DDR_SIZE - MAX_FILE_SIZE; // at the end of DDR space
  uint8_t *memory_base = (uint8_t *)(get_ddr_base());

  uart_init();

  printf("rocket_trans boot program\n=====================================\n", 0);

  // Register work area to the default drive
  if(f_mount(&FatFs, "", 1)) {
    printf("Fail to mount SD driver!\n", 0);
    return 1;
  }

  // Open a file
  printf("Load boot.elf into memory\n", 0);
  fr = f_open(&fil, "boot.elf", FA_READ);
  if (fr) {
    printf("Failed to open boot!\n", 0);
    return (int)fr;
  }

  // Read file into memory
  uint8_t *buf = boot_file_buf;
  uint32_t fsize = 0;           // file size count
  uint32_t br;                  // Read count
  do {
    fr = f_read(&fil, buf, SD_READ_SIZE, &br);  // Read a chunk of source file
    buf += br;
    fsize += br;
  } while(!(fr || br == 0));

  printf("Load %d bytes to memory address ", fsize);
  printf("%d from boot.bin of ", (uint64_t)boot_file_buf);
  printf("%d bytes.\n\r", fil.fsize);

  // read elf
  printf("load elf to DDR memory\n", 0);
  if(br = load_elf(boot_file_buf, fil.fsize))
    printf("elf read failed with code %d", br);

  // Close the file
  if(f_close(&fil)) {
    printf("fail to close file!", 0);
    return 1;
  }
  if(f_mount(NULL, "", 1)) {         // unmount it
    printf("fail to umount disk!", 0);
    return 1;
  }

  spi_disable();

  printf("Boot the loaded program...\n", 0);
}