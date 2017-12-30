 /**
 *  \file sggl.c
 *  \brief Sega Genesis Game Loader Function
 *  \author X-death
 *  \date 09/2017
 *
 * This unit is used as a ROM Flasher and call function only from RAM
 */
 
#include "sggl.h"

// PetitFatFs part 

#include "./FatFs/diskio.h"
#include "./FatFs/pff.h"

#define SPI_REG_ADDR 0xA13010

/*--------------------------------------------------------------------------
   SPI Generic Functions
---------------------------------------------------------------------------*/
 
CODE_IN_WRAM
void RAM_Wait(unsigned char delay){
    unsigned long tmp=0;
    for(tmp=0; tmp<1*delay; tmp++)
    {
        asm("nop\n");
    }
}

CODE_IN_WRAM
void RAM_SetCS(void)
{
    asm("move.b #1,0xA13010");
}
CODE_IN_WRAM
void RAM_ClearCS(void)
{
    asm("move.b #0,0xA13010");
}
CODE_IN_WRAM
void RAM_SetSCK(void)
{
    asm("move.b #1,0xA13020");
}
CODE_IN_WRAM
void RAM_ClearSCK(void)
{
    asm("move.b #0,0xA13020");
}
CODE_IN_WRAM
void RAM_SetMOSI(void)
{
    asm("move.b #1,0xA13080");
}
CODE_IN_WRAM
void RAM_ClearMOSI(void)
{
    asm("move.b #0,0xA13080");
}


/*--------------------------------------------------------------------------
   SPI PfatFS Private functions
---------------------------------------------------------------------------*/

#define CS_H() RAM_SetCS();     /* Set CS  "high" */
#define CS_L() RAM_ClearCS();   /* Set CS  "low" */
#define CK_H() RAM_SetSCK();    /* Set SCK  "low" */
#define CK_L() RAM_ClearSCK();  /* Set SCK "low" */
#define DI_H() RAM_SetMOSI();   /* Set MOSI "high" */
#define DI_L() RAM_ClearMOSI(); /* Set MOSI "low" */

/* Definitions for MMC/SDC command */
#define CMD0	(0x40+0)	/* GO_IDLE_STATE */
#define CMD1	(0x40+1)	/* SEND_OP_COND (MMC) */
#define	ACMD41	(0xC0+41)	/* SEND_OP_COND (SDC) */
#define CMD8	(0x40+8)	/* SEND_IF_COND */
#define CMD16	(0x40+16)	/* SET_BLOCKLEN */
#define CMD17	(0x40+17)	/* READ_SINGLE_BLOCK */
#define CMD24	(0x40+24)	/* WRITE_BLOCK */
#define CMD55	(0x40+55)	/* APP_CMD */
#define CMD58	(0x40+58)	/* READ_OCR */

/* Card type flags (CardType) */
#define CT_MMC				0x01	/* MMC ver 3 */
#define CT_SD1				0x02	/* SD ver 1 */
#define CT_SD2				0x04	/* SD ver 2 */
#define CT_SDC				(CT_SD1|CT_SD2)	/* SD */
#define CT_BLOCK			0x08	/* Block addressing */

static
BYTE CardType; /* b0:MMC, b1:SDv1, b2:SDv2, b3:Block addressing */

/*---------------------------------------------*/
/* Transmit a byte to the MMC (bitbanging)     */                        
/*---------------------------------------------*/

CODE_IN_WRAM
void xmit_mmc (
	unsigned char d			// Data to be sent 
)
{
if ( d & 0x80){ // bit7 
DI_H(); }
else{
DI_L();
}
CK_H(); CK_L(); 

if ( d & 0x40){ // bit6 
DI_H(); }
else{
DI_L();
}
CK_H(); CK_L();

if ( d & 0x20){ // bit5 
DI_H(); }
else{
DI_L();
}
CK_H(); CK_L(); 

if ( d & 0x10){ // bit4 
DI_H(); }
else{
DI_L();
}
CK_H(); CK_L(); 

if ( d & 0x08){ // bit3 
DI_H(); }
else{
DI_L();
}
CK_H(); CK_L(); 

if ( d & 0x04){ // bit2 
DI_H(); }
else{
DI_L();
}
CK_H(); CK_L(); 

if ( d & 0x02){ // bit1 
DI_H(); }
else{
DI_L();
}
CK_H(); CK_L(); 

if ( d & 0x01){ // bit0 
DI_H(); }
else{
DI_L();
}
CK_H(); CK_L(); 
}


///////////
/*
CODE_IN_WRAM
void xmit_mmc (
	unsigned char data			// Data to be sent 
)
{
	asm("move.b #1,0xA13080"); /// Start SPI Communication
	*(volatile unsigned char*)(SPI_REG_ADDR) = data; // Send 8bit data to SPI_REG_ADDR
	asm("move.b #0,0xA13080"); /// Stop SPI Communication
}
*/

/////////////

/*---------------------------------------------*/
/* Skip bytes on the MMC (bitbanging)      */                        
/*---------------------------------------------*/

CODE_IN_WRAM
static
void skip_mmc (
	UINT n		/* Number of bytes to skip */
)
{
	DI_H();	/* Send 0xFF */

	do {
		CK_H(); CK_L();
		CK_H(); CK_L();
		CK_H(); CK_L();
		CK_H(); CK_L();
		CK_H(); CK_L();
		CK_H(); CK_L();
		CK_H(); CK_L();
		CK_H(); CK_L();
	} while (--n);
}

/*---------------------------------------------*/
/* Deselect the card and release SPI bus      */                        
/*---------------------------------------------*/

CODE_IN_WRAM
static
void release_spi (void)
{
	CS_H();
	rcvr_mmc();
}

/*---------------------------------------------*/
/* Send a command packet to MMC                */                        
/*---------------------------------------------*/

CODE_IN_WRAM
static
BYTE send_cmd (
	BYTE cmd,		/* Command byte */
	DWORD arg		/* Argument */
)
{
	BYTE n, res;


	if (cmd & 0x80) {	/* ACMD<n> is the command sequense of CMD55-CMD<n> */
		cmd &= 0x7F;
		res = send_cmd(CMD55, 0);
		if (res > 1) return res;
	}

	/* Select the card */
	CS_H(); rcvr_mmc();
	CS_L(); rcvr_mmc();

	/* Send a command packet */
	xmit_mmc(cmd);					/* Start + Command index */
	xmit_mmc((BYTE)(arg >> 24));	/* Argument[31..24] */
	xmit_mmc((BYTE)(arg >> 16));	/* Argument[23..16] */
	xmit_mmc((BYTE)(arg >> 8));		/* Argument[15..8] */
	xmit_mmc((BYTE)arg);			/* Argument[7..0] */
	n = 0x01;						/* Dummy CRC + Stop */
	if (cmd == CMD0) n = 0x95;		/* Valid CRC for CMD0(0) */
	if (cmd == CMD8) n = 0x87;		/* Valid CRC for CMD8(0x1AA) */
	xmit_mmc(n);

	/* Receive a command response */
	n = 10;								/* Wait for a valid response in timeout of 10 attempts */
	do {
		res = rcvr_mmc();
	} while ((res & 0x80) && --n);

	return res;			/* Return with the response value */
}


/*--------------------------------------------------------------------------
   SPI PfatFS Public functions
---------------------------------------------------------------------------*/

/*---------------------------------------------*/
/* Initialize Disk Drive                       */                        
/*---------------------------------------------*/

CODE_IN_WRAM
DSTATUS disk_initialize (void)
{
	BYTE n, cmd, ty, buf[4];
	UINT tmr;


	INIT_PORT();
	CS_H();
	skip_mmc(10);			/* Dummy clocks */

	ty = 0;
	if (send_cmd(CMD0, 0) == 1) {			/* Enter Idle state */
		if (send_cmd(CMD8, 0x1AA) == 1) {	/* SDv2 */
			for (n = 0; n < 4; n++) buf[n] = rcvr_mmc();	/* Get trailing return value of R7 resp */
			if (buf[2] == 0x01 && buf[3] == 0xAA) {			/* The card can work at vdd range of 2.7-3.6V */
				for (tmr = 1000; tmr; tmr--) {				/* Wait for leaving idle state (ACMD41 with HCS bit) */
					if (send_cmd(ACMD41, 1UL << 30) == 0) break;
					DLY_US(1000);
				}
				if (tmr && send_cmd(CMD58, 0) == 0) {		/* Check CCS bit in the OCR */
					for (n = 0; n < 4; n++) buf[n] = rcvr_mmc();
					ty = (buf[0] & 0x40) ? CT_SD2 | CT_BLOCK : CT_SD2;	/* SDv2 (HC or SC) */
				}
			}
		} else {							/* SDv1 or MMCv3 */
			if (send_cmd(ACMD41, 0) <= 1) 	{
				ty = CT_SD1; cmd = ACMD41;	/* SDv1 */
			} else {
				ty = CT_MMC; cmd = CMD1;	/* MMCv3 */
			}
			for (tmr = 1000; tmr; tmr--) {			/* Wait for leaving idle state */
				if (send_cmd(cmd, 0) == 0) break;
				DLY_US(1000);
			}
			if (!tmr || send_cmd(CMD16, 512) != 0)			/* Set R/W block length to 512 */
				ty = 0;
		}
	}
	CardType = ty;
	release_spi();

	return ty ? 0 : STA_NOINIT;
}

