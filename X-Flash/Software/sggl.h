 /**
 *  \file sggl.h
 *  \brief Sega Genesis Game Loader Function
 *  \author X-death
 *  \date 09/2017
 *
 * This unit is used as a ROM Flasher and call function from RAM
 */

/* Memory MAP
Ram Used for SGDK & X-flash BIOS : 5202 Bytes
Ram Used for PFatFs : 
Ram Used for SGGL :
Ram Used for ROM Buffer : 
*/

#define CODE_IN_WRAM __attribute__((section (".wram_text"))) __attribute__((noinline)) __attribute__((optimize ("O1")))
 
 /**
 *  \brief
 *      Simple Wait Function
 */
 
void RAM_Wait(unsigned char delay);

/*--------------------------------------------------------------------------
   RAM SPI Submodule Functions
---------------------------------------------------------------------------*/
 
void RAM_SetCS(void);
void RAM_ClearCS(void);
void RAM_SetSCK(void);
void RAM_ClearSCK(void);
void RAM_SetMOSI(void);
void RAM_ClearMOSI(void);
void RAM_SetMISO(void);
void RAM_ClearMISO(void);
void xmit_mmc(unsigned char d);