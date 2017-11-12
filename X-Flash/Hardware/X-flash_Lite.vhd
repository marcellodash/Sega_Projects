-- X-flash Lite Megadrive System core
-- Simple 32Mb Cartridge with No Sram / No SPI / No UART
-- X-death 08/2047

LIBRARY IEEE;                                                  
USE IEEE.STD_LOGIC_1164.ALL;                     
USE IEEE.std_logic_unsigned.ALL; 
                  
ENTITY Xflash_Lite is                                        
     PORT(
          

		  MD_ADDR:IN STD_LOGIC_VECTOR (21 DOWNTO 0); --Megadrive Address
		  MD_DQ:INOUT STD_LOGIC_VECTOR (15 DOWNTO 0);  --Megadrive Data
		  MD_OE:IN STD_LOGIC;    --Acts as /OE signal for 68K Bus
		  MD_CE:IN STD_LOGIC;    --Acts as /CE signal for 68K Bus
		  LWR :IN STD_LOGIC;    --Lower byte Write 
		  		  
		  --Extras pin declaration
		  
			--Input
			
	      ASEL:IN STD_LOGIC;    --Read and write 000000-7FFFFF || Act as Rewrite with MD-Dumper  
		   TIMEE :IN STD_LOGIC;  --Set for r/w at/to $A13000-$A130FF
          MISO :IN STD_LOGIC;   --IN Data CPLD < OUT Data SPI Slave
         	  
									
			--Output
				 
				SOFT_RST :OUT STD_LOGIC;   --Reset Cartridge
				Mark3:OUT STD_LOGIC;       --Master System Mode ( 1/Z : disable / 0:Enable)
				TX:OUT STD_LOGIC;          --UART Slave Data IN || SRAM_CE || OUT Data CPLD > IN Data SPI Slave
				CE_SPI:OUT STD_LOGIC;      --/CE for SPI Slave 
				SCLK:OUT STD_LOGIC;        --Clock SPI Slave || SRAM_WE
				 
								
			-- 64Mb Flash Part
							
				FLASH_DQ	    	: INOUT STD_LOGIC_VECTOR (15 DOWNTO 0);
				FLASH_ADDR	     	: OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
				FLASH_WE	     	: OUT STD_LOGIC;
				CE_FLASH            : OUT STD_LOGIC; --Acts as /CE signal for Flash Chip
				OE_FLASH            : OUT STD_LOGIC --Acts as /OE signal for Flash Chip					
			 
			 );                                           
		END Xflash_Lite;       
		
ARCHITECTURE toplevel OF Xflash_Lite IS

signal GPIO_SCLK:   std_logic;
signal GPIO_MOSI:   std_logic;
signal GPIO_MISO:   std_logic;
signal GPIO_CS:     std_logic;

                                 
BEGIN
  
  -- Megadrive Addr Bus > 64 MB Flash Addr 
 
        FLASH_ADDR(20 DOWNTO 0) <= MD_ADDR(20 DOWNTO 0);
		
  -- MD-Dumper > 64 MB Flash : Write mode
    
	     FLASH_DQ(15 DOWNTO 0) <= MD_DQ(15 DOWNTO 0) when MD_CE = '0' and MD_OE =  '1' and ASEL ='0'  else (others => 'Z');
		
  -- 64 MB Flash > Megadrive : Read Mode
  
      MD_DQ(15 DOWNTO 0) <= FLASH_DQ(15 DOWNTO 0) when MD_CE =  '0' and MD_OE =  '0'  else (others => 'Z');
	 
--	 MD_DQ(15 DOWNTO 0) <= FLASH_DQ(15 DOWNTO 0);
		
  -- Control Pin
        
		CE_FLASH <= MD_CE;
      OE_FLASH <= MD_OE;
		FLASH_WE <= '0' when ASEL = '0' and MD_CE = '0' and MD_OE =  '1' else '1'  ;  -- For MD-Dumper Write Mode
		
	--	FLASH_WE <= '1';
		 FLASH_ADDR(21) <= '0';
		 
  --RX <= (MD_CE NAND MD_CE) NAND MD_ADDR(20);
  --CE_FLASH <= (MD_ADDR(20) NAND MD_ADDR(20)) NAND (MD_CE NAND MD_CE);
 -- SCLK <= LWR;     -- Disable SPÏ_CLK // SRAM_WE
		 
	--Extra Hardware
	
	Mark3 <= 'Z';    -- Disable Master System mode
	
	CE_SPI <= 'Z';   -- Disable SPÏ Slave
   SOFT_RST     <= 'Z';
	--SCLK <= '1';
	
	-- X-flash Extra IO Mapping 
	
	GPIO_MOSI <= '1' when TIMEE = '0' and MD_DQ(0) = '1' and MD_ADDR(5) ='1' else '0'  when TIMEE = '0' and MD_ADDR(5) ='1' and MD_DQ(0) = '0'  ; -- RX mapped at 0xA13040
 
	 -- Register to OUT
	 
	 TX <= GPIO_MOSI;
	 SCLK <= GPIO_SCLK;
	
	
																	
END toplevel;