-- X-flash 
-- Simple 64Mb Cartridge with Sram / SPI / UART
-- X-death 05/2018

-- What is currently working: 
                     
-- [X] - ROM Banking                                                         --
-- [ ] - SRAM Banking                                                        --
-- [X] - Serial UART                                                         --
-- [ ] - Serial SPI                                                          --
-- [ ] - Micro SD Driver                                                     --
-- [ ] - SSF Mapper                                                          --   
-- [ ] - Pier Solar mapper                                                   --  
	 
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
				TX:OUT STD_LOGIC;          --UART Slave Data IN || SRAM_CE || MOSI OUT Data CPLD > IN Data SPI Slave
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

signal GPIO_TX:     std_logic;

signal GPIO_SCLK:   std_logic;
signal GPIO_MISO:   std_logic;
signal GPIO_CS:     std_logic;

signal GPIO_A18:    std_logic;
signal GPIO_A19:    std_logic;
signal GPIO_A20:    std_logic;
signal GPIO_A21:    std_logic;
                                 
BEGIN
  
  -- Megadrive Addr Bus > 64 MB Flash Addr 
  
 FLASH_ADDR(17 DOWNTO 0) <= MD_ADDR(17 DOWNTO 0);

  -- MD-Dumper > 64 MB Flash : Write mode
    
	     FLASH_DQ(15 DOWNTO 0) <= MD_DQ(15 DOWNTO 0) when MD_CE = '0' and MD_OE =  '1' else (others => 'Z');
		
  -- 64 MB Flash > Megadrive : Read Mode
  
      MD_DQ(15 DOWNTO 0) <= FLASH_DQ(15 DOWNTO 0) when MD_CE =  '0' and MD_OE =  '0'  else (others => 'Z');
	 
--	 MD_DQ(15 DOWNTO 0) <= FLASH_DQ(15 DOWNTO 0);
		
  -- Control Pin
        
		CE_FLASH <= MD_CE;
      OE_FLASH <= MD_OE;
		FLASH_WE <= '0' when ASEL = '0' and MD_CE = '0' and MD_OE = '1' else '1' ; -- For MD-Dumper Write Mode
		Mark3 <= 'Z';    -- Disable Master System mode
      SOFT_RST     <= 'Z';
		
	-- Bankswitch Signal
	
	   GPIO_A18 <= '0' when TIMEE = '0' and MD_DQ(0) = '1' and MD_ADDR(3) ='1' else '1' when TIMEE = '0' and MD_ADDR(3) ='1' and MD_DQ(0) = '0';
	   GPIO_A19 <= '0' when TIMEE = '0' and MD_DQ(1) = '1' and MD_ADDR(3) ='1' else '1' when TIMEE = '0' and MD_ADDR(3) ='1' and MD_DQ(1) = '0';
      GPIO_A20 <= '0' when TIMEE = '0' and MD_DQ(2) = '1' and MD_ADDR(3) ='1' else '1' when TIMEE = '0' and MD_ADDR(3) ='1' and MD_DQ(2) = '0';
      GPIO_A21 <= '0' when TIMEE = '0' and MD_DQ(3) = '1' and MD_ADDR(3) ='1' else '1' when TIMEE = '0' and MD_ADDR(3) ='1' and MD_DQ(3) = '0';	
	
   -- Bankswitch Process	
		
Bankswitch: process (GPIO_A18,GPIO_A19,GPIO_A20,GPIO_A21,MD_ADDR(18),MD_ADDR(19),MD_ADDR(20))
  begin
	 if GPIO_A18 = '0' and GPIO_A19 = '1' and GPIO_A20 = '1' and GPIO_A21 = '1' then -- Offset + 512 Ko : OK
        FLASH_ADDR(18) <= not GPIO_A18 and not MD_ADDR(18); 
		  FLASH_ADDR(19) <= ((not GPIO_A18 and not MD_ADDR(19) and MD_ADDR(18)) or ( not GPIO_A18 and MD_ADDR(19) and not MD_ADDR(18)));
		  FLASH_ADDR(20) <= ((not GPIO_A18 and not MD_ADDR(20) and MD_ADDR(19) and MD_ADDR(18) ) or ( not GPIO_A18 and MD_ADDR(20) and not MD_ADDR(19) ) or ( not GPIO_A18 and MD_ADDR(20) and not MD_ADDR(18)) );  
		  FLASH_ADDR(21) <= not GPIO_A18 and MD_ADDR(20) and MD_ADDR(19) and MD_ADDR(18);
     elsif GPIO_A18 = '1' and GPIO_A19 = '0' and GPIO_A20 = '1' and GPIO_A21 = '1' then -- Offset + 1024 Ko : A terminer
	     FLASH_ADDR(18) <= '0';
		  FLASH_ADDR(19) <= '1';
		  FLASH_ADDR(21 DOWNTO 20) <= MD_ADDR(21 DOWNTO 20);
     elsif GPIO_A19 = '0' and GPIO_A18 = '0' and GPIO_A20 = '1' and GPIO_A21 = '1'  then -- Offset + 1536 Ko : A terminer
	     FLASH_ADDR(18) <= '1';
		  FLASH_ADDR(19) <= '1';
		  FLASH_ADDR(21 DOWNTO 20) <= MD_ADDR(21 DOWNTO 20);
     elsif GPIO_A19 = '1' and GPIO_A18 = '1' and GPIO_A20 = '0' and GPIO_A21 = '1'  then -- Offset + 2048 Ko : A terminer
	     FLASH_ADDR(18) <= MD_ADDR(18);
		  FLASH_ADDR(19) <= MD_ADDR(18);
		  FLASH_ADDR(20) <= '1';
		  FLASH_ADDR(21) <= MD_ADDR(20);		  
		else
        FLASH_ADDR(21 DOWNTO 18) <= MD_ADDR(21 DOWNTO 18);
      end if;
    end process;
	 	
	-- X-flash Extra IO Mapping UART & SPI
	
	GPIO_CS <= '0' when TIMEE = '0' and MD_DQ(0) = '1' and MD_ADDR(4) ='1' else '1'  when TIMEE = '0' and MD_ADDR(4) ='1' and MD_DQ(0) = '0'  ;
	GPIO_TX <= '0' when TIMEE = '0' and MD_DQ(0) = '1' and MD_ADDR(5) ='1' else '1'  when TIMEE = '0' and MD_ADDR(5) ='1' and MD_DQ(0) = '0'  ; -- TX/MOSI mapped at 0xA13040
   GPIO_SCLK <= '0' when TIMEE = '0' and MD_DQ(0) = '1' and MD_ADDR(6) ='1' else '1'  when TIMEE = '0' and MD_ADDR(6) ='1' and MD_DQ(0) = '0'  ;
  		
 	TX <= '1' when GPIO_TX <= '0' else '0' when GPIO_TX <= '1';
	SCLK <= '1' when GPIO_SCLK <= '0' else '0' when GPIO_SCLK <= '1';
   CE_SPI <= '1' when GPIO_CS <= '0' else '0' when GPIO_CS <= '1';
	--MD_DQ(1) <= MISO when TIMEE = '0' and MD_DQ(0) = '1' and MD_ADDR(7) ='1';
																		
END toplevel;
