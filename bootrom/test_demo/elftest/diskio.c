/*-----------------------------------------------------------------------*/
/* MMCv3/SDv1/SDv2/SDHC (in SPI mode) control module                     */
/*-----------------------------------------------------------------------*/
/*
 *  Copyright (C) 2014, ChaN, all right reserved.
 *
 * * This software is a free software and there is NO WARRANTY.
 * * No restriction on use. You can use, modify and redistribute it for
 *   personal, non-profit or commercial products UNDER YOUR RESPONSIBILITY.
 * * Redistributions of source code must retain the above copyright notice.
 *
 * Copyright (c) 2015, University of Cambridge.
 * All Rights Reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the University of Cambridge nor the
 *    names of its contributors may be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * IN NO EVENT SHALL UNIVERSITY OF CAMBRIDGE BE LIABLE TO ANY PARTY FOR DIRECT,
 * INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS,
 * ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF REGENTS
 * HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * UNIVERSITY OF CAMBRIDGE SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT
 * NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 * PARTICULAR PURPOSE. THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY,
 * PROVIDED HEREUNDER IS PROVIDED "AS IS". UNIVERSITY OF CAMBRIDGE HAS NO
 * OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR
 * MODIFICATIONS.
 */
/*------------------------------------------------------------------------*/

#include "diskio.h"
#include "spi.h"
#include "myprintf.h"
/*--------------------------------------------------------------------------

  Module Private Functions

  ---------------------------------------------------------------------------*/

/* Definitions for MMC/SDC command */
#define CMD0    (0)         /* GO_IDLE_STATE */
#define CMD1    (1)         /* SEND_OP_COND (MMC) */
#define ACMD41  (0x80+41)   /* SEND_OP_COND (SDC) */
#define CMD8    (8)         /* SEND_IF_COND */
#define CMD9    (9)         /* SEND_CSD */
#define CMD10   (10)        /* SEND_CID */
#define CMD12   (12)        /* STOP_TRANSMISSION */
#define ACMD13  (0x80+13)   /* SD_STATUS (SDC) */
#define CMD16   (16)        /* SET_BLOCKLEN */
#define CMD17   (17)        /* READ_SINGLE_BLOCK */
#define CMD18   (18)        /* READ_MULTIPLE_BLOCK */
#define CMD23   (23)        /* SET_BLOCK_COUNT (MMC) */
#define ACMD23  (0x80+23)   /* SET_WR_BLK_ERASE_COUNT (SDC) */
#define CMD24   (24)        /* WRITE_BLOCK */
#define CMD25   (25)        /* WRITE_MULTIPLE_BLOCK */
#define CMD32   (32)        /* ERASE_ER_BLK_START */
#define CMD33   (33)        /* ERASE_ER_BLK_END */
#define CMD38   (38)        /* ERASE */
#define CMD55   (55)        /* APP_CMD */
#define CMD58   (58)        /* READ_OCR */


static volatile
DSTATUS Stat = STA_NOINIT;  /* Disk status */

static
uint8_t CardType;          /* Card type flags */


/*-----------------------------------------------------------------------*/
/* Power Control  (Platform dependent)                                   */
/*-----------------------------------------------------------------------*/
/* When the target system does not support socket power control, there   */
/* is nothing to do in these functions and chk_power always returns 1.   */

static
void power_on (void)
{
  uint32_t timeout = 100*1000;
  spi_init();
  while(timeout--);
}

static
void power_off (void)
{
  spi_disable();
}



/*-----------------------------------------------------------------------*/
/* Transmit/Receive data from/to MMC via SPI  (Platform dependent)       */
/*-----------------------------------------------------------------------*/

/* Exchange a byte */
static
uint8_t xchg_spi (                /* Returns received data */
                  uint8_t dat     /* Data to be sent */
                                  )
{
  return spi_send(dat);
}

/* Send a data block fast */
static
void xmit_spi_multi (
                     const uint8_t *p,  /* Data block to be sent */
                     uint32_t cnt       /* Size of data block (must be multiple of 2) */
                     )
{
  int i = 0;
  for(i=0; i<cnt; i=i+16) {
    if(cnt >= i+16)
      spi_send_multi(p+i, 16);
    else
      spi_send_multi(p+i, cnt-i);
  }
}

/* Receive a data block fast */
static
void rcvr_spi_multi (
                     uint8_t *p,    /* Data buffer */
                     uint32_t cnt   /* Size of data block (must be multiple of 2) */
                     )
{
  int i = 0;
  for(i=0; i<cnt; i=i+16) {
    if(cnt >= i+16)
      spi_recv_multi(p+i, 16);
    else
      spi_recv_multi(p+i, cnt-i);
  }
}

/*-----------------------------------------------------------------------*/
/* Wait for card ready                                                   */
/*-----------------------------------------------------------------------*/

static
int wait_ready (                /* 1:Ready, 0:Timeout */
                uint32_t wt     /* Timeout [ms] */
                                )
{
  uint8_t d;
  uint32_t timeout = wt*5000;

  do {
    d = xchg_spi(0xFF);
    timeout--;
  } while (d != 0xFF && timeout);

  return (d == 0xFF) ? 1 : 0;
}



/*-----------------------------------------------------------------------*/
/* Deselect the card and release SPI bus                                 */
/*-----------------------------------------------------------------------*/

static
void deselect (void)
{
  spi_deselect_slave(0);
}

/*-----------------------------------------------------------------------*/
/* Select the card and wait for ready                                    */
/*-----------------------------------------------------------------------*/

static
int select (void)   /* 1:Successful, 0:Timeout */
{
  spi_select_slave(0);
  if (wait_ready(500)) return 1;  /* Wait for card ready */

  deselect();
  return 0;   /* Timeout */
}

/*-----------------------------------------------------------------------*/
/* Receive a data packet from MMC                                        */
/*-----------------------------------------------------------------------*/

static
int rcvr_datablock (
                    uint8_t *buff,         /* Data buffer to store received data */
                    uint32_t btr            /* Byte count (must be multiple of 4) */
                    )
{
  uint8_t token;

  uint32_t timeout=200*5000;
  do {                            /* Wait for data packet in timeout of 200ms */
    token = xchg_spi(0xFF);
    timeout--;
  } while ((token == 0xFF) && timeout);
  if (token != 0xFE) return 0;    /* If not valid data token, retutn with error */

  rcvr_spi_multi(buff, btr);      /* Receive the data block into buffer */
  xchg_spi(0xFF);                 /* Discard CRC */
  xchg_spi(0xFF);

  return 1;                       /* Return with success */
}



/*-----------------------------------------------------------------------*/
/* Send a data packet to MMC                                             */
/*-----------------------------------------------------------------------*/

#if _USE_WRITE
static
int xmit_datablock (
                    const uint8_t *buff,   /* 512 byte data block to be transmitted */
                    uint8_t token          /* Data/Stop token */
                    )
{
  uint8_t resp;


  if (!wait_ready(500)) return 0;

  xchg_spi(token);                    /* Xmit data token */
  if (token != 0xFD) {    /* Is data token */
    xmit_spi_multi(buff, 512);      /* Xmit the data block to the MMC */
    while(xchg_spi(0xFF) == 0x00);  /* CRC (Dummy) */
    while(xchg_spi(0xFF) == 0x00);  /* CRC (Dummy) */
    resp = xchg_spi(0xFF);          /* Reveive data response */
    if ((resp & 0x1F) != 0x05)      /* If not accepted, return with error */
      return 0;
  }

  wait_ready(500);
  return 1;
}
#endif



/*-----------------------------------------------------------------------*/
/* Send a command packet to MMC                                          */
/*-----------------------------------------------------------------------*/

static
uint8_t send_cmd (     /* Returns R1 resp (bit7==1:Send failed) */
                  uint8_t cmd,       /* Command index */
                  uint32_t arg       /* Argument */
                       )
{
  uint8_t n, res;
  uint32_t timeout = 100*1000;

  if (cmd & 0x80) {   /* ACMD<n> is the command sequense of CMD55-CMD<n> */
    cmd &= 0x7F;
    res = send_cmd(CMD55, 0);
    if (res > 1) return res;
  }

  // enforce a wait between CMD55 and CMD41
  if(cmd == ACMD41 & 0x7F)
    while(timeout--);

  /* Select the card and wait for ready except to stop multiple block read */
  if (cmd != CMD12) {
    deselect();
    if (!select()) return 0xFF;
  }

  /* Send command packet */
  // printf("    - cmd %d is sending ... ", cmd);
  // printf("Argument is %d ... ", arg );
  xchg_spi(0x40 | cmd);               /* Start + Command index */
  xchg_spi((uint8_t)(arg >> 24));     /* Argument[31..24] */
  xchg_spi((uint8_t)(arg >> 16));     /* Argument[23..16] */
  xchg_spi((uint8_t)(arg >> 8));      /* Argument[15..8] */
  xchg_spi((uint8_t)arg);             /* Argument[7..0] */
  n = 0x01;                           /* Dummy CRC + Stop */
  if (cmd == CMD0) n = 0x95;          /* Valid CRC for CMD0(0) + Stop */
  if (cmd == CMD8) n = 0x87;          /* Valid CRC for CMD8(0x1AA) Stop */
  xchg_spi(n);

  /* Receive command response */
  if (cmd == CMD12) xchg_spi(0xFF);   /* Skip a stuff byte when stop reading */
  n = 10;                             /* Wait for a valid response in timeout of 10 attempts */
  do
    res = xchg_spi(0xFF);
  while ((res & 0x80) && --n);

  // printf("Finished, res is : %d \n\r", res);

  return res;         /* Return with the response value */
}



/*--------------------------------------------------------------------------

  Public Functions

  ---------------------------------------------------------------------------*/


/*-----------------------------------------------------------------------*/
/* Initialize Disk Drive                                                 */
/*-----------------------------------------------------------------------*/

DSTATUS disk_initialize (
                         uint8_t pdrv       /* Physical drive nmuber (0) */
                         )
{
  uint8_t n, cmd, ty, ocr[4];
  uint32_t timeout;
  uint32_t acmd_delay = 100*1000;
  // printf("[DISK_INIT]disk init starts ... \n\r", 0);

  if (pdrv) return STA_NOINIT;        /* Supports only single drive */
  power_off();                        /* Turn off the socket power to reset the card */
  if (Stat & STA_NODISK) return Stat; /* No card in the socket */
  power_on();                         /* Turn on the socket power */
  for (n = 10; n; n--) xchg_spi(0xFF); /* 80 dummy clocks */

  ty = 0;
  if (send_cmd(CMD0, 0) == 1) {      /* Enter Idle state */
    timeout = 1000*1000;             /* Initialization timeout of 1000 msec */
    if (timeout-- && send_cmd(CMD8, 0x1AA) == 1) {   /* SDv2? */
      for (n = 0; n < 4; n++) ocr[n] = xchg_spi(0xFF);  /* Get trailing return value of R7 resp */
      if (ocr[2] == 0x01 && ocr[3] == 0xAA) {           /* The card can work at vdd range of 2.7-3.6V */
        while (timeout-- && send_cmd(ACMD41, 1UL << 30)) { /* Wait for leaving idle state (ACMD41 with HCS bit) */
          while(acmd_delay--);
          acmd_delay = 100*1000;
        }
        if (timeout-- && send_cmd(CMD58, 0) == 0) {     /* Check CCS bit in the OCR */
          for (n = 0; n < 4; n++) ocr[n] = xchg_spi(0xFF);
          ty = (ocr[0] & 0x40) ? CT_SD2 | CT_BLOCK : CT_SD2; /* SDv2 */
        }
      }
    } else {                        /* SDv1 or MMCv3 */
      if (timeout-- && send_cmd(ACMD41, 0) <= 1)   {
        ty = CT_SD1; cmd = ACMD41;  /* SDv1 */
      } else {
        ty = CT_MMC; cmd = CMD1;    /* MMCv3 */
      }
      while (timeout-- && send_cmd(cmd, 0));      /* Wait for leaving idle state */
      if (timeout-- || send_cmd(CMD16, 512) != 0)   /* Set R/W block length to 512 */
        ty = 0;
    }
  }
  CardType = ty;
  deselect();

  if (ty) {              /* Initialization succeded */
    Stat &= ~STA_NOINIT; /* Clear STA_NOINIT */

    // printf("[DISK_INIT]disk init successes!\n\r", 0);

  } else {               /* Initialization failed */
    // printf("[DISK_INIT]disk init failed ...\n\r", 0);
  }

  return Stat;
}



/*-----------------------------------------------------------------------*/
/* Get Disk Status                                                       */
/*-----------------------------------------------------------------------*/

DSTATUS disk_status (
                     uint8_t pdrv       /* Physical drive nmuber (0) */
                     )
{
  if (pdrv) return STA_NOINIT;    /* Supports only single drive */
  return Stat;
}



/*-----------------------------------------------------------------------*/
/* Read Sector(s)                                                        */
/*-----------------------------------------------------------------------*/

DRESULT disk_read (
                   uint8_t pdrv,          /* Physical drive nmuber (0) */
                   uint8_t *buff,         /* Pointer to the data buffer to store read data */
                   uint32_t sector,       /* Start sector number (LBA) */
                   uint32_t count          /* Sector count (1..128) */
                   )
{
  uint8_t cmd;


  if (pdrv || !count) return RES_PARERR;
  if (Stat & STA_NOINIT) return RES_NOTRDY;

  if (!(CardType & CT_BLOCK)) sector *= 512;  /* Convert to byte address if needed */
 
  // printf("[DISK_READ]reading starts at sector %d \n\r", sector);
  // printf("[DISK_READ]totally %d sectors to be read\n\r", count);

  cmd = count > 1 ? CMD18 : CMD17;            /*  READ_MULTIPLE_BLOCK : READ_SINGLE_BLOCK */
  if (send_cmd(cmd, sector) == 0) {
    do {
      if (!rcvr_datablock(buff, 512)) break;
      buff += 512;
        // printf("    - %d sectors left to be read\n\r", count-1);

    } while (--count);
    if (cmd == CMD18) send_cmd(CMD12, 0);   /* STOP_TRANSMISSION */
  }
  deselect();
  // printf("[DISK_READ]reading finished\n\r", 0);

  return count ? RES_ERROR : RES_OK;
}



/*-----------------------------------------------------------------------*/
/* Write Sector(s)                                                       */
/*-----------------------------------------------------------------------*/

#if _USE_WRITE
DRESULT disk_write (
                    uint8_t pdrv,          /* Physical drive nmuber (0) */
                    const uint8_t *buff,   /* Pointer to the data to be written */
                    uint32_t sector,       /* Start sector number (LBA) */
                    uint32_t count          /* Sector count (1..128) */
                    )
{
  if (pdrv || !count) return RES_PARERR;
  if (Stat & STA_NOINIT) return RES_NOTRDY;
  if (Stat & STA_PROTECT) return RES_WRPRT;
  // printf("[DISK_WRITE]reading starts at sector = %d \n\r", sector);

  if (!(CardType & CT_BLOCK)) sector *= 512;  /* Convert to byte address if needed */

  if (count == 1) {   /* Single block write */
    if ((send_cmd(CMD24, sector) == 0)  /* WRITE_BLOCK */
        && xmit_datablock(buff, 0xFE))
      count = 0;
  }
  else {              /* Multiple block write */
    if (CardType & CT_SDC) send_cmd(ACMD23, count);
    if (send_cmd(CMD25, sector) == 0) { /* WRITE_MULTIPLE_BLOCK */
      do {
        if (!xmit_datablock(buff, 0xFC)) break;
        buff += 512;
      } while (--count);
      if (!xmit_datablock(0, 0xFD))   /* STOP_TRAN token */
        count = 1;
    }
  }
  deselect();
  // printf("[DISK_WRITE]writing is 0-succ/1-fail: %d \n\r", count);
  return count ? RES_ERROR : RES_OK;
}
#endif


/*-----------------------------------------------------------------------*/
/* Miscellaneous Functions                                               */
/*-----------------------------------------------------------------------*/

#if _USE_IOCTL
DRESULT disk_ioctl (
                    uint8_t pdrv,      /* Physical drive nmuber (0) */
                    uint8_t cmd,       /* Control code */
                    void *buff      /* Buffer to send/receive control data */
                    )
{
  DRESULT res;
  uint8_t n, csd[16], *ptr = buff;
  uint32_t csize;


  if (pdrv) return RES_PARERR;

  res = RES_ERROR;

  if (Stat & STA_NOINIT) return RES_NOTRDY;

  switch (cmd) {
  case CTRL_SYNC :        /* Make sure that no pending write process. Do not remove this or written sector might not left updated. */
    if (select()) res = RES_OK;
    break;

  case GET_SECTOR_COUNT : /* Get number of sectors on the disk (uint32_t) */
    if ((send_cmd(CMD9, 0) == 0) && rcvr_datablock(csd, 16)) {
      if ((csd[0] >> 6) == 1) {   /* SDC ver 2.00 */
        csize = csd[9] + ((uint16_t)csd[8] << 8) + ((uint32_t)(csd[7] & 63) << 16) + 1;
        *(uint32_t*)buff = csize << 10;
      } else {                    /* SDC ver 1.XX or MMC*/
        n = (csd[5] & 15) + ((csd[10] & 128) >> 7) + ((csd[9] & 3) << 1) + 2;
        csize = (csd[8] >> 6) + ((uint16_t)csd[7] << 2) + ((uint16_t)(csd[6] & 3) << 10) + 1;
        *(uint32_t*)buff = csize << (n - 9);
      }
      res = RES_OK;
    }
    break;

  case GET_BLOCK_SIZE :   /* Get erase block size in unit of sector (uint32_t) */
    if (CardType & CT_SD2) {    /* SDv2? */
      if (send_cmd(ACMD13, 0) == 0) { /* Read SD status */
        xchg_spi(0xFF);
        if (rcvr_datablock(csd, 16)) {              /* Read partial block */
          for (n = 64 - 16; n; n--) xchg_spi(0xFF);   /* Purge trailing data */
          *(uint32_t*)buff = 16UL << (csd[10] >> 4);
          res = RES_OK;
        }
      }
    } else {                    /* SDv1 or MMCv3 */
      if ((send_cmd(CMD9, 0) == 0) && rcvr_datablock(csd, 16)) {  /* Read CSD */
        if (CardType & CT_SD1) {    /* SDv1 */
          *(uint32_t*)buff = (((csd[10] & 63) << 1) + ((uint16_t)(csd[11] & 128) >> 7) + 1) << ((csd[13] >> 6) - 1);
        } else {                    /* MMCv3 */
          *(uint32_t*)buff = ((uint16_t)((csd[10] & 124) >> 2) + 1) * (((csd[11] & 3) << 3) + ((csd[11] & 224) >> 5) + 1);
        }
        res = RES_OK;
      }
    }
    break;

    /* Following commands are never used by FatFs module */

  case MMC_GET_TYPE :     /* Get card type flags (1 byte) */
    *ptr = CardType;
    res = RES_OK;
    break;

  case MMC_GET_CSD :      /* Receive CSD as a data block (16 bytes) */
    if (send_cmd(CMD9, 0) == 0      /* READ_CSD */
        && rcvr_datablock(ptr, 16))
      res = RES_OK;
    break;

  case MMC_GET_CID :      /* Receive CID as a data block (16 bytes) */
    if (send_cmd(CMD10, 0) == 0     /* READ_CID */
        && rcvr_datablock(ptr, 16))
      res = RES_OK;
    break;

  case MMC_GET_OCR :      /* Receive OCR as an R3 resp (4 bytes) */
    if (send_cmd(CMD58, 0) == 0) {  /* READ_OCR */
      for (n = 4; n; n--) *ptr++ = xchg_spi(0xFF);
      res = RES_OK;
    }
    break;

  case MMC_GET_SDSTAT :   /* Receive SD statsu as a data block (64 bytes) */
    if (send_cmd(ACMD13, 0) == 0) { /* SD_STATUS */
      xchg_spi(0xFF);
      if (rcvr_datablock(ptr, 64))
        res = RES_OK;
    }
    break;

  case CTRL_POWER_OFF :   /* Power off */
    power_off();
    Stat |= STA_NOINIT;
    res = RES_OK;
    break;

  default:
    res = RES_PARERR;
  }

  deselect();

  return res;
}
#endif
