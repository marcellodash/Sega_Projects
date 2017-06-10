#include "genesis.h"

// Ressource part

#include "Spt_Song.h"
#include "./res/gfx.h"

// Function part

static void EnableGPIO();
static void DisableGPIO();
static void joyEvent(u16 joy, u16 changed, u16 state);
static void UpdateMenu();

// Variable part

volatile u16 value;
volatile unsigned int CurrentTrack=0;
volatile unsigned int Volume =15;
volatile int ChoixMenu=0;
volatile int interrupt=0;
volatile int i=0;
volatile int Number=0;
volatile char str_Track[2];
volatile char str_Vol[2];

//DFSerial Communication Static Command

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
    DisableGPIO();   // turn TX to logic '0'
    Wait(delay1);
    for ( i = 8; i !=0; i--)
    {
        if ( val & 0x01 )  EnableGPIO(); // turn TX to logic '1'
        else  DisableGPIO();
        val >>= 1;
        Wait(delay2);// wait 104 탎
    }
    if (delay3 != 0)
    {
        DisableGPIO();   // Stop bit
        Wait(delay3);// wait 104 탎
    }
    EnableGPIO();
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

    /*Variable Part*/

    u16 palette[64];
    u16 ind;
    u16 pal0;
    u16 pal1;
    u16 pal2;
    u16 pal3;

// init VDP

    VDP_init();
    VDP_setScreenHeight224();
    VDP_setScreenWidth320();
    VDP_setHInterrupt(0);
    VDP_setHilightShadow(0);

    // init Joypad driver

    JOY_init();
    JOY_setEventHandler(joyEvent);

    // Prepare Palette

    memcpy(&palette[0],font_image.palette->data, 16 * 2);

    // Load Custom Font

    VDP_loadFont(font_image.tileset,1);

    // load background
    ind = TILE_USERINDEX+32;
    VDP_drawImageEx(BPLAN, &Tiles_image, TILE_ATTR_FULL(PAL0, FALSE, FALSE, FALSE, ind), 10, 14, FALSE, TRUE);

    // Load final palette

    VDP_setPalette(0,font_image.palette->data);
    VDP_setPalette(1,font_image.palette->data);

    // Mix Pal1 with Pal0

    pal0=VDP_getPaletteColor(6);
    pal1=VDP_getPaletteColor(7);
    pal2=VDP_getPaletteColor(8);
    pal3=VDP_getPaletteColor(9);
    VDP_setPaletteColor(18,pal0);
    VDP_setPaletteColor(19,pal1);
    VDP_setPaletteColor(20,pal2);
    VDP_setPaletteColor(21,pal3);

    // Add some Text

    VDP_drawText("-=MP3 Sound Test Jukebox=-",7,1);
    VDP_drawText("Track  : ",2,4);
    VDP_drawText("Vol    : ",20,4);
    VDP_drawText("Song   : ",2,6);
    VDP_drawText("Author : ",2,8);
    VDP_drawText("Controls : ",8,12);
    VDP_drawText("- Play current Track ",14,14);
    VDP_drawText("- Pause current Track ",14,16);
    VDP_drawText("- Stop current Track ",14,18);
    VDP_drawText("- Change Volume Level ",14,20);
    VDP_drawText("- Select another Track ",14,22);
    VDP_drawText("Powered by SGDK ",12,26);

    // Draw First song info
    UpdateMenu();

    // Clean GPIO
    EnableGPIO();

    // Enable MP3 Module
    DF_Reset();
    DF_SourceDevice();
    DF_SetVolume(Volume);

    while (1)
    {
        VDP_waitVSync();
    }
}

static void joyEvent(u16 joy, u16 changed, u16 state)
{


    if (changed & state & BUTTON_A)
    {
        DF_Write_Command(0x03,CurrentTrack+1);
    }

    if (changed & state & BUTTON_B)
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
    if (changed & state & BUTTON_C)
    {
        DF_StopTrack();
    }

    if (changed & state & BUTTON_RIGHT)
    {
        CurrentTrack++;
        UpdateMenu();
    }

    if (changed & state & BUTTON_LEFT)
    {
        CurrentTrack--;
        UpdateMenu();
    }

    if (changed & state & BUTTON_UP)
    {
        Volume++;
        DF_SetVolume(Volume);
        UpdateMenu();
    }

    if (changed & state & BUTTON_DOWN)
    {
        Volume--;
        DF_SetVolume(Volume);
        UpdateMenu();
    }

}

static void UpdateMenu()
{
    // Set Custom PAL
    VDP_setTextPalette(1);

    // Fix Max value

    if (CurrentTrack>4)
    {
        CurrentTrack=0;
    }
    if (Volume>30)
    {
        Volume=30;
    }

    // Draw Song info
    uintToStr(CurrentTrack,str_Track,1);
    uintToStr(Volume,str_Vol,1);
    VDP_drawText("                                 ",11,6);
    VDP_drawText("                                 ",11,8);
    VDP_drawText("  ",11,4);
    VDP_drawText("  ",29,4);
    VDP_drawText(str_Track,11,4);
    VDP_drawText(str_Vol,29,4);
    VDP_drawText(Song_Name[CurrentTrack],11,6);
    VDP_drawText(Song_Author[CurrentTrack],11,8);


}

static void EnableGPIO(void)
{
    asm("nop\n");
    asm("nop\n");
    asm("move.b #1,0xA130FF");
    asm("nop\n");
    asm("nop\n");
}

static void DisableGPIO(void)
{
    asm("nop\n");
    asm("nop\n");
    asm("move.b #1,0xA13000");
    asm("nop\n");
    asm("nop\n");
}




