#include "memory.h"

volatile uint64_t * get_bram_base() {
#ifdef MEM_MAP_BRAM_BASE
  return (uint64_t *)(MEM_MAP_BRAM_BASE);
#else
  return (uint64_t *)0;         /* boot ROM, raise error */
#endif
}

volatile uint64_t * get_ddr_base() {
  return (uint64_t *)(MEM_MAP_DDR_BASE);
}

volatile uint64_t * get_flash_base() {
#ifdef MEM_MAP_FLASH_BASE
  return (uint64_t *)(MEM_MAP_FLASH_BASE);
#else
  return (uint64_t *)0;         /* boot ROM, raise error */
#endif
}