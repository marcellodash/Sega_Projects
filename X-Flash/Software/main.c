#include "genesis.h"

// GFX part

#include "./res/gfx.h"

// PetitFatFs part 

#include "./FatFs/integer.h"

// SGGL part

#include "sggl.h"

// Variable part

volatile int ChoixMenu=0;
volatile int interrupt=0;
volatile int PosX=1;
volatile int PosY=9;
static unsigned long i=0;
volatile int TXData=0;
volatile int Song=0;
volatile int Number=0;
static char displaychar[4];
static const char *Game_Name[31] = {0xFF};
volatile unsigned char Game_Type[4] = {0x20};
volatile long Game_Size=0;
volatile int game_save=0;

static unsigned char buf_spi[1024*32];

// Function part

static void joyEvent(u16 joy, u16 changed, u16 state);
static void UARTEvent(u16 joy, u16 changed, u16 state);
static void UpdateCursor(int PosX,int PosY);
static void ClearMenu();
static void UpdateMenu(int PosX,int PosY);
static void EnableGPIO_TX();
static void DisableGPIO_TX();
static void drawSPIState(unsigned char value);
static void CleanSPIState(void);
static void drawFlashingState(unsigned char value);
static void drawRAMState(int RAMFree);
static void SetCPUCharge(void);
static void StopCPUCharge(void);


//DFAudio Communication Static Command

#define START     0x7E //Start command BYTE
#define VERSION   0xFF //Version command BYTE
#define STOP      0xEF //Stop copmmand BYTE

#define NEXT    0x01 //Next Track
#define PREV    0x02 //Previous Track
#define INCV    0x04 //Increase Volume
#define DECV    0x05 //Decrease Volume
#define MODE    0x08 //Specify playback mode (0/1/2/3) (repeat/folder_repeat/track_repeat/random)
#define PLAY    0x0D //Play Track
#define PAUS    0x0E //Pause Track

// Custom palette

const u16 Aux_palette[16] =
{
    0x0000,     // 0 - black
    0x0444,     // 1 - dark gray
    0x0AAA,     // 2 - light gray
    0x0EEE,     // 3 - white

    0x0008,     // 4 - dark red
    0x000E,     // 5 - red

    0x0400,     // 6 - dark blue
    0x0E00,     // 7 - blue

    0x0420,     // 8 - dark blue/cyan
    0x0E60,     // 9 - blue/cyan

    0x0440,     // A - dark cyan
    0x0EC0,     // B - cyan

    0x0040,     // C - dark green
    0x00E0,     // D - green

    0x0044,     // D - dark yellow
    0x00EE      // F - yellow
};

//s16 Scroll_Table[2] = {0,1,2,3,4,5,6,7,8,9};
s16 Scroll_Table[1] = {1};

void Wait(unsigned char delay)
{
    unsigned long tmp=0;
    for(tmp=0; tmp<1*delay; tmp++)
    {
        asm("nop\n");
    }
}

void uart_tx_bit_bang (unsigned char val,unsigned char delay1,unsigned char delay2,unsigned char delay3)
{
    unsigned char i=0;
    DisableGPIO_TX();   // turn TX to logic '0'
    Wait(delay1);
    for ( i = 8; i !=0; i--)
    {
        if ( val & 0x01 )  EnableGPIO_TX(); // turn TX to logic '1'
        else  DisableGPIO_TX();
        val >>= 1;
        Wait(delay2);// wait 104 탎
    }
    if (delay3 != 0)
    {
        DisableGPIO_TX();   // Stop bit
        Wait(delay3);// wait 104 탎
    }
    EnableGPIO_TX();
}


void DF_Write_Command(unsigned char Command,unsigned char data)
{
    uart_tx_bit_bang(START,14,14,0);
    uart_tx_bit_bang(VERSION,14,14,0);
    uart_tx_bit_bang(0x06,14,14,0);
    uart_tx_bit_bang(Command,14,14,0);
    uart_tx_bit_bang(0x00,14,14,0);
    uart_tx_bit_bang(0x00,14,14,0);
    uart_tx_bit_bang(data,14,14,0);
    uart_tx_bit_bang(STOP,14,14,0);
}

void DF_Reset(void)
{
    DF_Write_Command(0x0C,0); // Reset DF Module
    Wait(13);// wait 100 탎
}

void DF_SourceDevice(void)
{
    DF_Write_Command(0x09,0x02); // Select SD_Card as source device
    Wait(26);// wait 200 탎
}

void DF_SetVolume(unsigned char volume) // Change Volume ( 0 - 30 )
{
    if (volume > 30) volume = 30;
    DF_Write_Command(0x06,volume);
    Wait(1);// wait 10 탎
}

void DF_PauseTrack(void) // Pause current Track
{
    DF_Write_Command(PAUS,0);
}

void DF_ResumeTrack(void) // Resume current Track
{
    DF_Write_Command(PLAY,0);
    Wait(2);// wait 20 탎
}

void DF_StopTrack(void) // Stop current Track
{
    DF_Write_Command(0x16,0);
    Wait(1);// wait 10 탎
}



int main()
{

// init VDP
	
    VDP_setScreenWidth320();

    u16 ind;
    u16 palette[64];
	
	VDP_setScreenWidth320();
	


    // setup VRAM
  //  VDP_setPlanSize(64, 64);
 //   VDP_setSpriteListAddress(0xA800);
   // VDP_setHScrollTableAddress(0xAC00);
  //  VDP_setWindowAddress(0xB000);
  //  VDP_setBPlanAddress(0xC000);
   // VDP_setAPlanAddress(0xE000);

    // set window visible from first ro up to row 13
  //  VDP_setWindowHPos(FALSE, 0);
   // VDP_setWindowVPos(FALSE, 13);
    // by default we draw text in window plan and in high priority
  //  VDP_setTextPlan(PLAN_WINDOW);
    VDP_setTextPriority(TRUE);
	
		// set scrolling mode (line)
	VDP_setScrollingMode(HSCROLL_LINE,VSCROLL_PLANE);
	

	


    // set all palettes to black
    VDP_setPaletteColors(0, palette_black, 64);
	
    // init Joypad driver

    JOY_init();
    JOY_setEventHandler(joyEvent);
		
    // load SD Title
    ind = TILE_USERINDEX;
    VDP_drawImageEx(PLAN_A, &SD_image, TILE_ATTR_FULL(PAL0, FALSE, FALSE, FALSE, ind), 0, 0, FALSE, TRUE);
	
	// Load Plane Progress Bar Tiles in Plane B Area
	
	 VDP_fillTileData(0xFF,1280,1,1);
	
    // Prepare Palette

    memcpy(&palette[0], SD_image.palette->data, 16 * 2);

    // Load final palette

    VDP_setPalette(0, SD_image.palette->data);
	VDP_setPalette(2, Aux_palette);
	

    // Add some basic graphics

    VDP_drawText("----------------------------------------",0,5);
	VDP_drawText("-=Hardware=-|",0,6);
	VDP_drawText("-=SD Card=-|",13,6);
	VDP_drawText("-=MP3 Shield=-|",25,6);
	VDP_drawText("----------------------------------------",0,7);
	for ( i = 0; i <16; i++)
    {
		VDP_drawText("            |           |         ",0,8+i);
	}
	VDP_drawText("----------------------------------------",0,24);
	VDP_drawText("X-Flash BIOS V 1.0               11/2017",0,25);
	VDP_drawText("----------------------------------------",0,26);
	
	// Hardware Menu
	
	VDP_drawText("SYS_Info",2,9);
	VDP_drawText("Config",2,11);
	VDP_drawText("SRAM_Bkp",2,13);
	VDP_drawText("SPI_Bkp",2,15);
	VDP_drawText("Extras",2,17);
	
	// Micro SD Menu
	
	VDP_drawText("SPI_TEST",15,9);
	VDP_drawText("SD_INFO",15,11);
	VDP_drawText("DIR_LIST",15,13);
	VDP_drawText("DUMP_ROM",15,15);
	VDP_drawText("LOAD_ROM",15,17);
	
	// MP3 Menu
	
	VDP_drawText("UART_TEST",28,9);
	VDP_drawText("LOAD_SONG",28,11);
	VDP_drawText("PLAY_SONG",28,13);
	VDP_drawText("PAUS_SONG",28,15);
	VDP_drawText("STOP_SONG",28,17);

    // Draw Cursor
	VDP_setPaletteColor(31,0x00F);
	VDP_setTextPalette(1);
	PosX=1;
    PosY=9;
	VDP_drawText(">",PosX,PosY);
	
	// Clean Variable
	Song=0;
	Number=0;
	TXData=0;


   // UpdateMenu();

    while (1)
    {
        VDP_waitVSync();
    }
}

static void joyEvent(u16 joy, u16 changed, u16 state)
{


    if (changed & state & BUTTON_A)
    {
		UpdateMenu(PosX,PosY);      
    }
	
	if (changed & state & BUTTON_B)
    {
		asm("move.l (4),%a0\n"); // Do a soft Reset
		asm("jmp (%a0)\n");		
    }
	
	if (changed & state & BUTTON_UP)
    {
		PosY=PosY-2;
		if (PosY< 9){PosY=9;}
		UpdateCursor(PosX,PosY);      
    }
	
	if (changed & state & BUTTON_DOWN)
    {
		PosY=PosY+2;
		if (PosY > 17){PosY=17;}
		UpdateCursor(PosX,PosY);
        
    }
	
	if (changed & state & BUTTON_LEFT)
    {
		PosX=PosX-13;
		if (PosX< 1){PosX=1;}
		UpdateCursor(PosX,PosY);
        
    }
	
	if (changed & state & BUTTON_RIGHT)
    {
		PosX=PosX+13;
		if (PosX > 27){PosX=27;}
		UpdateCursor(PosX,PosY);       
    }
	
	if (changed & state & BUTTON_UP & ( BUTTON_DOWN || BUTTON_RIGHT || BUTTON_LEFT ) )
    {
		UpdateCursor(PosX,PosY);
	}
		
}

static void UpdateCursor(int PosX,int PosY)
{
    
	// Clean Cursor position
	
	for ( i = 9; i <19; i=i+2)
    {
		VDP_drawText(" ",1,i);
		VDP_drawText(" ",14,i);
		VDP_drawText(" ",27,i);
	}
	
	// Set Cursor position
	
	VDP_drawText(">",PosX,PosY);	   
}
static void ClearMenu()
{
	
	VDP_drawText("                                        ",0,6);
	for ( i = 8; i <24; i++)
    {	
		VDP_drawText("                                        ",0,i);
	}
	
}

static void UpdateMenu(int PosX,int PosY)
{
	
	if ( PosX == 1 && PosY == 9 ) ////// SYSTEM INFORMATION ////// 
	{
		// Display Menu
        ClearMenu();		
		VDP_drawText("           SYSTEM INFORMATION           ",0,6);
		VDP_setTextPalette(0);
		VDP_drawText("Sega Model  :",2,9);
		VDP_drawText("Region      :",2,11);
		VDP_drawText("Frequency   :",2,13);
		VDP_drawText("TMSS        :",2,15);
		VDP_drawText("32X Present :",2,17);
		VDP_drawText("SCD Present :",2,19);
		VDP_setTextPalette(1);
		VDP_drawText("Genesis Model 1",16,9);
		// Convert register value to char character
		unsigned int Region = *(u8 *)0xA10001;
	//	unsigned int TMSS = *(u8 *)0xA14000;
		unsigned int MARS = *(u8 *)0xA130EC;
		intToStr(Region,displaychar, 5);
		VDP_drawText(displaychar,15,22);
		// Display Result
		if ( Region == 0xA1){VDP_drawText("North American",16,11);VDP_drawText("60Hz",16,13);}
		if ( Region == 0xE1){VDP_drawText("Europe",16,11);VDP_drawText("50Hz",16,13);}
		if ( Region == 0x21){VDP_drawText("Japan",16,11);VDP_drawText("60Hz",16,13);}
		if ( Region == 0x40){VDP_drawText("Japan",16,11);VDP_drawText("50Hz",16,13);}
		if ( MARS == 0x48){VDP_drawText("YES",16,17);} else {VDP_drawText("NO",16,17);}			
	}
	
	if ( PosX == 14 && PosY == 15 ) ////// DUMP ROM  ////// 
	{
		
	ClearMenu();

	// Add some basic graphics
    VDP_drawText("        SEGA GENESIS GAME LOADER      ",0,6);
	VDP_setTextPalette(0);
	VDP_drawText("---",35,8);
	VDP_drawText("---",35,19);
	VDP_drawText("RAM",35,20);
	VDP_drawText("SPI SD > Buffer",0,14);
	VDP_drawText("Flash Progress ",0,17);
	VDP_drawText("CPU Charge ",0,20);
	VDP_drawText("|100%",16,15);
	VDP_drawText("|100%",16,18);
	VDP_drawText("|100%",16,22);
	
		// Display Game info
		
		Game_Size=1024*64;	
		
	
	VDP_drawText("FREE RAM : ",0,8);
	
	VDP_drawText("GAME NAME: ",0,10); 
	VDP_setTextPalette(1);
	VDP_drawText(Game_Name,11,10);
	VDP_setTextPalette(0);
	
	VDP_drawText("GAME SIZE: ",0,12);
	intToStr(Game_Size/1024,displaychar,4);
	VDP_setTextPalette(1);
	VDP_drawText(displaychar,11,12);
	VDP_setTextPalette(0);
	VDP_drawText("Ko",16,12);
	
	VDP_drawText("TYPE : ",21,12); 
	Game_Type[0] = 0x4D; Game_Type[1] = 0x44; Game_Type[2] = 0x20; Game_Type[3] = 0x20; Game_Type[4] = 0x20;
	VDP_setTextPalette(1);
	VDP_drawText(Game_Type,28,12);
	VDP_setTextPalette(0);
	
			
	// Display RAM Mask progress bar

	for ( i = 0; i <10; i++)
    {	
    VDP_setTileMapXY(PLAN_A,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,1),35,18-i);
	VDP_setTileMapXY(PLAN_A,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,1),36,18-i);
	VDP_setTileMapXY(PLAN_A,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,1),37,18-i);
	}
	
		// Display RAM progress bar 
	
		for ( i = 0; i <10; i++)
    {	
	VDP_setTileMapXY(PLAN_B,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,11),35,18-i);
	VDP_setTileMapXY(PLAN_B,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,11),36,18-i);
	VDP_setTileMapXY(PLAN_B,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,11),37,18-i);
	}
	
	// Display SPI Mask bar
	
	for ( i = 0; i <16; i++)
    {
	VDP_setTileMapXY(PLAN_B,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,1),0+i,15);
	}
	
	// Display Mask Flashing bar
	
	for ( i = 0; i <16; i++)
    {
	VDP_setTileMapXY(PLAN_B,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,1),0+i,18);
	}
	
	// Display CPU Mask Charge bar
	
	for ( i = 0; i <16; i++)
    {
	VDP_setTileMapXY(PLAN_B,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,1),0+i,22);
	}
	
	// Display CPU Charge bar
	
	for ( i = 0; i <16; i++)
    {
	VDP_setTileMapXY(PLAN_A,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,15),0+i,22);
	}
		
		 	
    // First Calculate and display FREE RAM
	
    // Calculate FREE RAM
		
	char displaychar[4];

		
	//intToStr(RAMFree,displaychar,5);
	VDP_drawText("FREE RAM : ",0,8);
	VDP_setTextPalette(1);
	//VDP_drawText(displaychar,11,8);
	VDP_setTextPalette(0);
	VDP_drawText("Bytes",17,8);
	
//  Set RAM State
 // drawRAMState(RAMFree);
i=0;

Game_Size=1024*128;	

int l=0; // SPI Bar counter
int n=0; // SPI Bar counter

int Flash_Counter=Game_Size/16; // Flash counter 1
int Progress_Value=0; // Flash Progress value

int CurrentByte=0; // Read byte from spi slave

long ram=0; // RAM counter 1

// Flashing Loop
 
   while ( i < Game_Size)
 {
	
	while ( ram != sizeof(buf_spi)) // SPI Progress bar loop   
      {
		// Read and send Byte to RAM	
          CurrentByte=0x00; // Read byte from SD
          xmit_mmc(CurrentByte); // dummy fonction read
		  
	     // Update SPI Bar
	      if (n==2048){l++;n=0;}
		  if (ram==32768){l=0;CleanSPIState();}
		  if (l>15){l=15;}
	      drawSPIState(l);
		  n++;
		  ram++;	  
	  }
	//   
	   CleanSPIState(); // Clean SPI
	  		
	 // Flash game with RAM Buffer 
	 /*
        for ( j = 0; j < buf_spi; j++) 
          {
			 //  Send RAM content to ROM         
			//TODO
					 
		  }*/
		  			    		   
	// Clean UP RAM
	
//	drawRAMState(65536);
	
	i=i+ram; // update main counter
	n=0;l=0;
	ram=0;
	

				
		// Calculate and upgrade Progress bar
	
		for ( Progress_Value = 0; Progress_Value < i/(Flash_Counter); Progress_Value++) 
          {
			  drawFlashingState(Progress_Value);
		  }
	//l=sizeof(buf_spi);
	intToStr(i,displaychar,6); // Game_Size = 131072
	VDP_drawText("                        ",0,8);
	VDP_drawText("FREE RAM : ",0,8);
	VDP_setTextPalette(1);
	VDP_drawText(displaychar,11,8);
	VDP_setTextPalette(0);
	VDP_drawText("Bytes",17,8);
		
    // i=32784  size buf spi : 32768 ram 0
	
	
	}
	
StopCPUCharge();
VDP_drawText("Completed ! ",23,22);
	
	// Disable interrupt and wait for complete before call RAM Loop
	  // disable interrupt when accessing VDP
 //   SYS_disableInts();
	
	//RAM_Wait(100); // Wait some nop to be sure :D
			
}
	
	if ( PosX == 27 && PosY == 9 ) ////// Serial UART TEST  ////// 
	{
		// Display Menu
        ClearMenu();		
		VDP_drawText("           SERIAL UART TEST           ",0,6);
		VDP_setTextPalette(0);
	    VDP_drawText("PRESS A for Enable TX GPIO",2,9);
		VDP_drawText("PRESS C for Disable TX GPIO",2,11);
		VDP_drawText("PRESS <- or -> to Change DATA :",2,13);
		VDP_drawText("PRESS START to Send DATA",2,15);
		VDP_drawText("PRESS B for reset BIOS",2,19);
		VDP_setTextPalette(1);
		// Set a new joypad interrupt
		JOY_setEventHandler(UARTEvent);		
	}
	
	if ( PosX == 27 && PosY == 11 ) ////// Load SONG  ////// 
	{
		char displaychar[2];
		VDP_drawText("  ",37,11);
		Song=Song+1;
		intToStr(Song,displaychar,2);
		VDP_setTextPalette(1);
		VDP_drawText(displaychar,37,11);		
	}

	if ( PosX == 27 && PosY == 13 ) ////// Play SONG 1 ////// 
	{
		
		  DF_Reset();
          DF_SourceDevice();
          DF_SetVolume(15);
		  DF_Write_Command(0x03,Song);

	}

    if ( PosX == 27 && PosY == 15 ) ////// Pause SONG  ////// 
	{
		if ( Number==0)
        {
            DF_PauseTrack();
            Number=1;
        }
        else if ( Number==1)
        {
            DF_ResumeTrack();
            Number=0;
        }
	}

    if ( PosX == 27 && PosY == 17 ) ////// STOP SONG  ////// 
	{
		DF_StopTrack();
	}	
}

static void UARTEvent(u16 joy, u16 changed, u16 state)
{
	
	if (changed & state & BUTTON_A)
    {
		EnableGPIO_TX();		
    }
	
	if (changed & state & BUTTON_C)
    {
		DisableGPIO_TX();		
    }
	
	if (changed & state & BUTTON_B)
    {
		asm("move.l (4),%a0\n"); // Do a BIOS Reset
		asm("jmp (%a0)\n");		
    }
	
	if (changed & state & BUTTON_RIGHT)
    {
		VDP_drawText("   ",34,13);
        TXData=TXData+1;
		if (TXData >= 255){TXData=255;}
		char displaychar[5];
		intToStr(TXData,displaychar,5);
		VDP_drawText(displaychar,34,13);		
    }
	
	if (changed & state & BUTTON_LEFT)
    {
		VDP_drawText("   ",34,13);
        TXData=TXData-1;
		if (TXData <= 0){TXData=0;}
		char displaychar[5];
		intToStr(TXData,displaychar,5);
		VDP_drawText(displaychar,34,13);		
    }
	
		if (changed & state & BUTTON_UP)
    {
		VDP_drawText("   ",34,13);
        TXData=TXData+10;
		if (TXData >= 255){TXData=255;}
		char displaychar[5];
		intToStr(TXData,displaychar,5);
		VDP_drawText(displaychar,34,13);		
    }
	
	if (changed & state & BUTTON_DOWN)
    {
		VDP_drawText("   ",34,13);
        TXData=TXData-10;
		if (TXData <= 0){TXData=0;}
		char displaychar[5];
		intToStr(TXData,displaychar,5);
		VDP_drawText(displaychar,34,13);		
    }
	
	if (changed & state & BUTTON_START)
    {
		uart_tx_bit_bang (TXData,14,14,0); // Send data with UART TX Pin		
	}
		
}

static void EnableGPIO_TX(void)
{
    asm("move.b #1,0xA13040");
}

static void DisableGPIO_TX(void)
{
    asm("move.b #0,0xA13040");
}


static void drawSPIState(unsigned char value)
{		
VDP_setTileMapXY(PLAN_A,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,4),0+value,15);	
}

static void CleanSPIState(void)
{
unsigned char state=0;
for ( state = 0; state <16; state++)
{		
VDP_setTileMapXY(PLAN_A,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,0),state,15);
}	
}

static void drawFlashingState(unsigned char value)
{		
VDP_setTileMapXY(PLAN_A,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,13),0+value,18);	
}

static void drawRAMState( int RAMFree)
{
	for ( i = 0; i <10; i++)
    {	
    VDP_setTileMapXY(PLAN_A,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,1),35,18-i);
	VDP_setTileMapXY(PLAN_A,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,1),36,18-i);
	VDP_setTileMapXY(PLAN_A,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,1),37,18-i);
	}
	
	for ( i = 0; i < 10-(RAMFree/6553); i++)
    {	
	VDP_setTileMapXY(PLAN_A,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,11),35,18-i);
	VDP_setTileMapXY(PLAN_A,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,11),36,18-i);
	VDP_setTileMapXY(PLAN_A,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,11),37,18-i);
	}

}


static void SetCPUCharge(void)
{		
	for ( i = 0; i <15; i++)
    {
	VDP_setTileMapXY(PLAN_A,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,15),0+i,22);
	}
}

static void StopCPUCharge(void)
{		
	for ( i = 0; i <16; i++)
    {
	VDP_setTileMapXY(PLAN_A,TILE_ATTR_FULL(PAL2, FALSE, FALSE, FALSE,0),0+i,22);
	}
}





