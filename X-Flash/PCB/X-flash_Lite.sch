EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:X-flash64-cache
LIBS:X-flash-cache
LIBS:X-flash_Lite-cache
EELAYER 25 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MD_Connector_H MD_Connector1
U 1 1 57F7D566
P 7100 8150
F 0 "MD_Connector1" H 6950 6650 70  0000 C CNN
F 1 "MD_Connector_H" H 7150 6950 70  0000 C CNN
F 2 "Connect:HE10_64D" H 6950 8250 60  0001 C CNN
F 3 "" H 6950 8250 60  0000 C CNN
	1    7100 8150
	1    0    0    -1  
$EndComp
$Comp
L M95320 U4
U 1 1 57F7D6F6
P 12950 2050
F 0 "U4" H 13000 2800 60  0000 C CNN
F 1 "25AA512" H 13000 2900 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 12950 2050 60  0001 C CNN
F 3 "" H 12950 2050 60  0000 C CNN
	1    12950 2050
	1    0    0    -1  
$EndComp
$Comp
L AVR-JTAG-10 CON1
U 1 1 57F7F3C0
P 2050 6400
F 0 "CON1" H 1880 6730 50  0000 C CNN
F 1 "AVR-JTAG-10" H 1700 5950 50  0000 L BNN
F 2 "AVR-JTAG-10" V 1480 6420 50  0001 C CNN
F 3 "" H 2050 6400 60  0000 C CNN
	1    2050 6400
	-1   0    0    1   
$EndComp
$Comp
L LM117E U3
U 1 1 57F7F72E
P 12050 8000
F 0 "U3" H 11850 8200 40  0000 C CNN
F 1 "LM117E" H 12050 8200 40  0000 L CNN
F 2 "LLC-20" H 12050 8100 30  0000 C CIN
F 3 "" H 12050 8000 60  0000 C CNN
	1    12050 8000
	1    0    0    -1  
$EndComp
$Comp
L CP C10
U 1 1 57F7FA67
P 11350 8100
F 0 "C10" H 11375 8200 50  0000 L CNN
F 1 "CP" H 11375 8000 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:TantalC_SizeU_EIA-6032" H 11388 7950 30  0001 C CNN
F 3 "" H 11350 8100 60  0000 C CNN
	1    11350 8100
	1    0    0    -1  
$EndComp
$Comp
L CP C11
U 1 1 57F7FBD0
P 12800 8100
F 0 "C11" H 12825 8200 50  0000 L CNN
F 1 "CP" H 12825 8000 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:TantalC_SizeU_EIA-6032" H 12838 7950 30  0001 C CNN
F 3 "" H 12800 8100 60  0000 C CNN
	1    12800 8100
	1    0    0    -1  
$EndComp
Text GLabel 13250 7950 2    60   Input ~ 0
VCC3
Text Notes 11200 8450 0    60   ~ 0
10µF \nTantalum
Text GLabel 10500 7800 1    60   Input ~ 0
GND
Text GLabel 10250 7400 1    60   Input ~ 0
VCC5
$Comp
L CP C8
U 1 1 57F80A87
P 10850 7700
F 0 "C8" H 10875 7800 50  0000 L CNN
F 1 "CP" H 10875 7600 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Axial_D6_L11_P18" H 10888 7550 30  0001 C CNN
F 3 "" H 10850 7700 60  0000 C CNN
	1    10850 7700
	1    0    0    -1  
$EndComp
Text Notes 11050 7750 0    60   ~ 0
47µF \nCeramic
Text Notes 12650 8500 0    60   ~ 0
10µF \nTantalum
NoConn ~ 10150 8250
NoConn ~ 10050 8250
NoConn ~ 9650 8250
NoConn ~ 9450 8250
NoConn ~ 9350 8250
NoConn ~ 9250 8250
NoConn ~ 9150 8250
Text GLabel 950  7850 0    60   Input ~ 0
GND
Text GLabel 4450 8250 1    60   Input ~ 0
~TIME
Text GLabel 4550 7850 1    60   Input ~ 0
~MARK3
Text GLabel 4750 7700 1    60   Input ~ 0
~Low_WR
NoConn ~ 4950 8250
Text GLabel 4850 8250 1    60   Input ~ 0
~ROM_RST
Entry Wire Line
	4950 8150 5050 8250
Entry Wire Line
	5050 8150 5150 8250
Entry Wire Line
	5250 8150 5350 8250
Entry Wire Line
	5350 8150 5450 8250
Entry Wire Line
	5450 8150 5550 8250
Entry Wire Line
	5550 8150 5650 8250
Entry Wire Line
	5650 8150 5750 8250
Entry Wire Line
	5750 8150 5850 8250
Entry Wire Line
	5850 8150 5950 8250
Entry Wire Line
	5950 8150 6050 8250
Entry Wire Line
	6050 8150 6150 8250
Entry Wire Line
	6150 8150 6250 8250
Entry Wire Line
	6250 8150 6350 8250
Entry Wire Line
	6350 8150 6450 8250
Entry Wire Line
	6450 8150 6550 8250
Entry Wire Line
	6550 8150 6650 8250
Entry Wire Line
	6650 8150 6750 8250
Entry Wire Line
	6750 8150 6850 8250
Entry Wire Line
	6850 8150 6950 8250
Entry Wire Line
	6950 8150 7050 8250
Entry Wire Line
	7050 8150 7150 8250
Entry Wire Line
	7150 8150 7250 8250
Entry Wire Line
	7250 8150 7350 8250
Entry Wire Line
	7350 8150 7450 8250
Text GLabel 7200 7750 3    60   Input ~ 0
VCC3
Text GLabel 7500 7800 3    60   Input ~ 0
GND
$Comp
L C C4
U 1 1 57F9D525
P 7350 7500
F 0 "C4" H 7375 7600 50  0000 L CNN
F 1 "C" H 7375 7400 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7388 7350 30  0001 C CNN
F 3 "" H 7350 7500 60  0000 C CNN
	1    7350 7500
	0    1    1    0   
$EndComp
Text Notes 7200 7700 0    60   ~ 0
100nF
$Comp
L C C6
U 1 1 57F9F3CC
P 8950 7300
F 0 "C6" H 8975 7400 50  0000 L CNN
F 1 "C" H 8975 7200 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8988 7150 30  0001 C CNN
F 3 "" H 8950 7300 60  0000 C CNN
	1    8950 7300
	0    1    1    0   
$EndComp
Text GLabel 9300 7600 3    60   Input ~ 0
VCC3
Text GLabel 8650 7550 3    60   Input ~ 0
GND
Text Notes 8850 7600 0    60   ~ 0
100nF
Entry Wire Line
	7450 8150 7550 8250
Entry Wire Line
	7550 8150 7650 8250
Entry Wire Line
	7650 8150 7750 8250
Entry Wire Line
	7750 8150 7850 8250
Entry Wire Line
	7850 8150 7950 8250
Entry Wire Line
	7950 8150 8050 8250
Entry Wire Line
	8050 8150 8150 8250
Entry Wire Line
	8150 8150 8250 8250
Entry Wire Line
	8250 8150 8350 8250
Entry Wire Line
	8350 8150 8450 8250
Entry Wire Line
	8450 8150 8550 8250
Entry Wire Line
	8550 8150 8650 8250
Entry Wire Line
	8650 8150 8750 8250
Entry Wire Line
	8750 8150 8850 8250
Entry Wire Line
	8850 8150 8950 8250
Entry Wire Line
	8950 8150 9050 8250
Text Notes 11800 7700 0    60   ~ 0
5V to 3.3V
Text GLabel 9750 8250 1    60   Input ~ 0
~ASEL
NoConn ~ 9550 8250
$Comp
L C C5
U 1 1 57FAA6CA
P 8750 1500
F 0 "C5" H 8775 1600 50  0000 L CNN
F 1 "C" H 8775 1400 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8788 1350 30  0001 C CNN
F 3 "" H 8750 1500 60  0000 C CNN
	1    8750 1500
	0    -1   -1   0   
$EndComp
Text GLabel 8900 1200 1    60   Input ~ 0
GND
Text GLabel 8600 1250 1    60   Input ~ 0
VCC3
Text GLabel 3450 6600 2    60   Input ~ 0
TCK
Text GLabel 3750 6500 2    60   Input ~ 0
TDO
Text GLabel 3450 6400 2    60   Input ~ 0
TMS
Text GLabel 3450 6200 2    60   Input ~ 0
TDI
Text GLabel 1050 6500 0    60   Input ~ 0
VCC3
NoConn ~ 2000 6400
NoConn ~ 2000 6300
NoConn ~ 2250 6300
Entry Wire Line
	1050 4650 1150 4750
Entry Wire Line
	1050 4500 1150 4600
Entry Wire Line
	1050 4350 1150 4450
Entry Wire Line
	1050 4200 1150 4300
Entry Wire Line
	1050 4050 1150 4150
Entry Wire Line
	1050 3900 1150 4000
Entry Wire Line
	1050 3750 1150 3850
Entry Wire Line
	1050 3600 1150 3700
Entry Wire Line
	1050 3450 1150 3550
Entry Wire Line
	1050 3300 1150 3400
Entry Wire Line
	1050 3150 1150 3250
Entry Wire Line
	1050 3000 1150 3100
Entry Wire Line
	1050 2850 1150 2950
Entry Wire Line
	1050 2700 1150 2800
Entry Wire Line
	1050 2550 1150 2650
Entry Wire Line
	1050 2400 1150 2500
Entry Wire Line
	1050 2250 1150 2350
Entry Wire Line
	1050 2100 1150 2200
Entry Wire Line
	1050 1950 1150 2050
Entry Wire Line
	1050 1800 1150 1900
Entry Wire Line
	2800 1900 2900 2000
Entry Wire Line
	2800 2050 2900 2150
Entry Wire Line
	2800 2350 2900 2450
Entry Wire Line
	2800 2500 2900 2600
Entry Wire Line
	2800 2650 2900 2750
Entry Wire Line
	2800 2800 2900 2900
Entry Wire Line
	2800 2950 2900 3050
Entry Wire Line
	2800 3100 2900 3200
Entry Wire Line
	2800 3250 2900 3350
Entry Wire Line
	2800 3400 2900 3500
Entry Wire Line
	2800 3550 2900 3650
Entry Wire Line
	2800 3700 2900 3800
Entry Wire Line
	2800 3850 2900 3950
Entry Wire Line
	2800 4000 2900 4100
Entry Wire Line
	2800 4150 2900 4250
Entry Wire Line
	2800 4300 2900 4400
Text GLabel 12000 1850 0    60   Input ~ 0
~CE_SPI
Text GLabel 11900 2000 0    60   Input ~ 0
MISO
Text GLabel 13800 1550 2    60   Input ~ 0
VCC5
Text Notes 12650 1450 0    60   ~ 0
SPI EEPROM 64Ko
Text GLabel 13650 2250 2    60   Input ~ 0
MOSI/RX
Text GLabel 14200 2150 2    60   Input ~ 0
SCLK
Text Notes 1750 900  0    60   ~ 0
Flash 64MB
Text Notes 2050 5900 0    60   ~ 0
JTAG
Text Label 9050 8250 1    60   ~ 0
D15
Text Label 8950 8250 1    60   ~ 0
D14
Text Label 8850 8250 1    60   ~ 0
D13
Text Label 8750 8250 1    60   ~ 0
D12
Text Label 8650 8250 1    60   ~ 0
D11
Text Label 8550 8250 1    60   ~ 0
D10
Text Label 8450 8250 1    60   ~ 0
D9
Text Label 8350 8250 1    60   ~ 0
D8
Text Label 8250 8250 1    60   ~ 0
D7
Text Label 8150 8250 1    60   ~ 0
D6
Text Label 8050 8250 1    60   ~ 0
D5
Text Label 7950 8250 1    60   ~ 0
D4
Text Label 7850 8250 1    60   ~ 0
D3
Text Label 7750 8250 1    60   ~ 0
D2
Text Label 7650 8250 1    60   ~ 0
D1
Text Label 7550 8250 1    60   ~ 0
D0
Entry Wire Line
	5150 8150 5250 8250
Text Label 2600 1900 0    60   ~ 0
FD14
$Comp
L C C1
U 1 1 57FB7765
P 3050 4600
F 0 "C1" H 3075 4700 50  0000 L CNN
F 1 "C" H 3075 4500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 3088 4450 30  0001 C CNN
F 3 "" H 3050 4600 60  0000 C CNN
	1    3050 4600
	-1   0    0    1   
$EndComp
Text Notes 2650 4650 0    60   ~ 0
100nF
$Comp
L C C12
U 1 1 57FB8163
P 14150 1900
F 0 "C12" H 14175 2000 50  0000 L CNN
F 1 "C" H 14175 1800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 14188 1750 30  0001 C CNN
F 3 "" H 14150 1900 60  0000 C CNN
	1    14150 1900
	0    -1   -1   0   
$EndComp
Text Notes 8600 1700 0    60   ~ 0
100nF
Text Notes 12550 2750 0    60   ~ 0
100nF
Text Notes 14850 2750 0    60   ~ 0
100nF
Text Label 5050 8250 1    60   ~ 0
OE
Text Label 5150 8250 1    60   ~ 0
CE
Text Label 5250 8250 1    60   ~ 0
A22
Text Label 5350 8250 1    60   ~ 0
A21
Text Label 5450 8250 1    60   ~ 0
A20
Text Label 5550 8250 1    60   ~ 0
A19
Text Label 5650 8250 1    60   ~ 0
A18
Text Label 5750 8250 1    60   ~ 0
A17
Text Label 5850 8250 1    60   ~ 0
A16
Text Label 5950 8250 1    60   ~ 0
A15
Text Label 6050 8250 1    60   ~ 0
A14
Text Label 6150 8250 1    60   ~ 0
A13
Text Label 6250 8250 1    60   ~ 0
A12
Text Label 6350 8250 1    60   ~ 0
A11
Text Label 6450 8250 1    60   ~ 0
A10
Text Label 6550 8250 1    60   ~ 0
A9
Text Label 6650 8250 1    60   ~ 0
A8
Text Label 6750 8250 1    60   ~ 0
A7
Text Label 6850 8250 1    60   ~ 0
A6
Text Label 6950 8250 1    60   ~ 0
A5
Text Label 7050 8250 1    60   ~ 0
A4
Text Label 7150 8250 1    60   ~ 0
A3
Text Label 7250 8250 1    60   ~ 0
A2
Text Label 7350 8250 1    60   ~ 0
A1
Text Label 7450 8250 1    60   ~ 0
A0
Text GLabel 14950 2550 2    60   Input ~ 0
GND
Entry Wire Line
	1050 1650 1150 1750
Entry Wire Line
	1050 1500 1150 1600
Entry Wire Line
	2800 2200 2900 2300
Entry Wire Line
	2800 1750 2900 1850
$Comp
L EPM3128ATC144 U2
U 1 1 5955FF97
P 7700 4750
F 0 "U2" H 7700 5450 60  0000 C CNN
F 1 "EPM3128ATC144" H 7700 4750 60  0000 C CNN
F 2 "" H 5850 4750 60  0000 C CNN
F 3 "" H 5850 4750 60  0000 C CNN
	1    7700 4750
	1    0    0    -1  
$EndComp
$Comp
L S29GL064 U1
U 1 1 59563774
P 1950 2700
F 0 "U1" H 2000 4300 60  0000 C CNN
F 1 "S29GL064" H 1950 450 60  0000 C CNN
F 2 "" H 200 1550 60  0000 C CNN
F 3 "" H 200 1550 60  0000 C CNN
	1    1950 2700
	1    0    0    -1  
$EndComp
NoConn ~ 1350 1300
NoConn ~ 2600 1300
Text GLabel 2800 1000 2    60   Input ~ 0
VCC3
Text Label 2750 1600 2    60   ~ 0
FWE
Text Label 2600 1750 0    60   ~ 0
FD15
Text Label 2600 2050 0    60   ~ 0
FD13
Text Label 2600 2200 0    60   ~ 0
FD12
Text Label 2600 2350 0    60   ~ 0
FD11
Text Label 2600 2500 0    60   ~ 0
FD10
Text Label 2600 2650 0    60   ~ 0
FD9
Text Label 2600 2800 0    60   ~ 0
FD8
Text Label 2600 2950 0    60   ~ 0
FD7
Text Label 2600 3100 0    60   ~ 0
FD6
Text Label 2600 3250 0    60   ~ 0
FD5
Text Label 2600 3400 0    60   ~ 0
FD4
Text Label 2600 3550 0    60   ~ 0
FD3
Text Label 2600 3700 0    60   ~ 0
FD2
Text Label 2600 3850 0    60   ~ 0
FD1
Text Label 2600 4000 0    60   ~ 0
FD0
Text Label 2600 4150 0    60   ~ 0
FOE
Text Label 1200 4750 0    60   ~ 0
FA0
Text GLabel 3300 4750 2    60   Input ~ 0
GND
Text GLabel 3250 4450 2    60   Input ~ 0
VCC3
Entry Wire Line
	2800 1600 2900 1700
Text Label 1200 4600 0    60   ~ 0
FA1
Text Label 1200 4450 0    60   ~ 0
FA2
Text Label 1200 4300 0    60   ~ 0
FA3
Text Label 1200 4150 0    60   ~ 0
FA4
Text Label 1200 4000 0    60   ~ 0
FA5
Text Label 1200 3850 0    60   ~ 0
FA6
Text Label 1200 3700 0    60   ~ 0
FA7
Text Label 1200 3550 0    60   ~ 0
FA8
Text Label 1200 3400 0    60   ~ 0
FA9
Text Label 1200 3250 0    60   ~ 0
FA10
Text Label 1200 3100 0    60   ~ 0
FA11
Text Label 1200 2950 0    60   ~ 0
FA12
Text Label 1200 2800 0    60   ~ 0
FA13
Text Label 1200 2650 0    60   ~ 0
FA14
Text Label 1200 2500 0    60   ~ 0
FA15
Text Label 1200 2350 0    60   ~ 0
FA16
Text Label 1200 2200 0    60   ~ 0
FA17
Text Label 1200 2050 0    60   ~ 0
FA18
Text Label 1200 1900 0    60   ~ 0
FA19
Text Label 1200 1750 0    60   ~ 0
FA20
Text Label 1200 1600 0    60   ~ 0
FA21
Text Label 2600 4300 0    60   ~ 0
FCE
$Comp
L C C3
U 1 1 59564632
P 6450 1550
F 0 "C3" H 6475 1650 50  0000 L CNN
F 1 "C" H 6475 1450 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 6488 1400 30  0001 C CNN
F 3 "" H 6450 1550 60  0000 C CNN
	1    6450 1550
	0    -1   -1   0   
$EndComp
Text GLabel 7650 1700 1    60   Input ~ 0
GND
Text GLabel 5900 1400 1    60   Input ~ 0
VCC3
Text Notes 6300 1750 0    60   ~ 0
100nF
NoConn ~ 10000 6050
$Comp
L C C7
U 1 1 5956D91E
P 10850 4000
F 0 "C7" H 10875 4100 50  0000 L CNN
F 1 "C" H 10875 3900 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 10888 3850 30  0001 C CNN
F 3 "" H 10850 4000 60  0000 C CNN
	1    10850 4000
	1    0    0    -1  
$EndComp
Text GLabel 11100 3850 2    60   Input ~ 0
GND
Text GLabel 11150 4150 2    60   Input ~ 0
VCC3
Text Notes 10710 3850 3    60   ~ 0
100nF
$Comp
L C C9
U 1 1 5956E072
P 11350 5800
F 0 "C9" H 11375 5900 50  0000 L CNN
F 1 "C" H 11375 5700 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 11388 5650 30  0001 C CNN
F 3 "" H 11350 5800 60  0000 C CNN
	1    11350 5800
	1    0    0    -1  
$EndComp
Text GLabel 11600 5650 2    60   Input ~ 0
GND
Text GLabel 11650 5950 2    60   Input ~ 0
VCC3
Text Notes 11210 5650 3    60   ~ 0
100nF
Text GLabel 3050 5050 0    60   Input ~ 0
VCC3
Text GLabel 3050 5350 0    60   Input ~ 0
GND
$Comp
L C C2
U 1 1 5956FA23
P 3350 5200
F 0 "C2" H 3375 5300 50  0000 L CNN
F 1 "C" H 3375 5100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 3388 5050 30  0001 C CNN
F 3 "" H 3350 5200 60  0000 C CNN
	1    3350 5200
	-1   0    0    1   
$EndComp
Text Notes 3250 5000 0    60   ~ 0
100nF
NoConn ~ 5300 6050
NoConn ~ 5300 6150
NoConn ~ 5300 6250
NoConn ~ 5300 2750
NoConn ~ 5300 2850
NoConn ~ 5300 3850
NoConn ~ 5300 4550
NoConn ~ 6800 6850
NoConn ~ 6900 6850
NoConn ~ 7000 6850
NoConn ~ 7100 6850
NoConn ~ 8800 6850
NoConn ~ 10000 4550
NoConn ~ 10000 2750
NoConn ~ 10000 3250
NoConn ~ 8100 2350
NoConn ~ 8200 2350
NoConn ~ 8300 2350
Text GLabel 7650 1250 1    60   Input ~ 0
VCC3
Text GLabel 6800 1350 1    60   Input ~ 0
GND
Text GLabel 4400 3050 0    60   Input ~ 0
TDI
Text GLabel 4450 2900 0    60   Input ~ 0
GND
Text GLabel 4450 3950 0    60   Input ~ 0
GND
Text GLabel 4450 4350 0    60   Input ~ 0
GND
Text GLabel 4400 4650 0    60   Input ~ 0
TMS
NoConn ~ 6500 6850
Text GLabel 8000 7500 3    60   Input ~ 0
VCC3
Text GLabel 11250 4650 2    60   Input ~ 0
TCK
Text GLabel 11250 5050 2    60   Input ~ 0
GND
$Comp
L DIL16 P1
U 1 1 59575D00
P 13950 5200
F 0 "P1" H 13950 5650 60  0000 C CNN
F 1 "DIL16" V 13950 5200 50  0000 C CNN
F 2 "" H 13950 5200 60  0000 C CNN
F 3 "" H 13950 5200 60  0000 C CNN
	1    13950 5200
	1    0    0    -1  
$EndComp
Text Notes 13650 4500 0    60   ~ 0
Audio Module
Text GLabel 13100 4850 0    60   Input ~ 0
VCC3
Text GLabel 13600 4950 0    60   Input ~ 0
MOSI/RX
NoConn ~ 13600 5050
Text GLabel 9900 7950 1    60   Input ~ 0
Left_Audio
Text GLabel 10100 8000 1    60   Input ~ 0
Right_Audio
Text GLabel 13600 5250 0    60   Input ~ 0
Left_Audio
Text GLabel 13050 5150 0    60   Input ~ 0
Right_Audio
NoConn ~ 13600 5350
Text GLabel 13150 5450 0    60   Input ~ 0
GND
NoConn ~ 13600 5550
NoConn ~ 14300 5550
Text GLabel 14750 5450 2    60   Input ~ 0
GND
NoConn ~ 14300 4850
NoConn ~ 14300 4950
NoConn ~ 14300 5050
NoConn ~ 14300 5150
NoConn ~ 14300 5250
NoConn ~ 14300 5350
$Comp
L R R4
U 1 1 5957A68E
P 3300 6850
F 0 "R4" V 3380 6850 50  0000 C CNN
F 1 "10K" V 3300 6850 50  0000 C CNN
F 2 "" V 3230 6850 30  0000 C CNN
F 3 "" H 3300 6850 30  0000 C CNN
	1    3300 6850
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5957CD4F
P 3050 6850
F 0 "R3" V 3130 6850 50  0000 C CNN
F 1 "10K" V 3050 6850 50  0000 C CNN
F 2 "" V 2980 6850 30  0000 C CNN
F 3 "" H 3050 6850 30  0000 C CNN
	1    3050 6850
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5957CD95
P 2850 6850
F 0 "R2" V 2930 6850 50  0000 C CNN
F 1 "10K" V 2850 6850 50  0000 C CNN
F 2 "" V 2780 6850 30  0000 C CNN
F 3 "" H 2850 6850 30  0000 C CNN
	1    2850 6850
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5957CDD7
P 2650 6850
F 0 "R1" V 2730 6850 50  0000 C CNN
F 1 "10K" V 2650 6850 50  0000 C CNN
F 2 "" V 2580 6850 30  0000 C CNN
F 3 "" H 2650 6850 30  0000 C CNN
	1    2650 6850
	1    0    0    -1  
$EndComp
Text Notes 3500 5350 0    60   ~ 0
C
Text Notes 3550 3800 0    60   ~ 0
B
Text Notes 6550 850  0    60   ~ 0
A
Text Notes 6800 7950 0    60   ~ 0
D
Text Notes 12200 6850 0    60   ~ 0
E
Text Notes 12200 5150 0    60   ~ 0
F
Text Notes 12200 3750 0    60   ~ 0
G
Text Notes 10050 700  0    60   ~ 0
H
Text Label 5900 6950 3    60   ~ 0
A7
Text Label 6000 6950 3    60   ~ 0
A8
Text Label 6100 6950 3    60   ~ 0
A10
Text Label 6200 6950 3    60   ~ 0
A9
Text Label 6300 6950 3    60   ~ 0
A6
Text Label 6400 6950 3    60   ~ 0
A17
Text Label 6600 6950 3    60   ~ 0
A11
Text Label 6700 6950 3    60   ~ 0
A18
Text Label 7500 6950 3    60   ~ 0
A5
Text Label 7600 6950 3    60   ~ 0
A19
Text Label 7700 6950 3    60   ~ 0
A12
Text Label 7800 6950 3    60   ~ 0
A20
Text Label 8400 6950 3    60   ~ 0
A4
Text Label 8200 6950 3    60   ~ 0
A21
Text Label 8300 6950 3    60   ~ 0
A13
Text Label 8500 6950 3    60   ~ 0
A3
Text Label 8700 6950 3    60   ~ 0
A14
Text Label 8900 6950 3    60   ~ 0
A2
Text Label 9000 6950 3    60   ~ 0
A15
Text Label 9100 6950 3    60   ~ 0
A1
Text Label 9200 6950 3    60   ~ 0
~OE
Text Label 9300 6950 3    60   ~ 0
A16
Text Label 9400 6950 3    60   ~ 0
~CE
Text Label 10150 6150 0    60   ~ 0
A0
Text Label 10150 5750 0    60   ~ 0
D7
Text Label 10150 5650 0    60   ~ 0
D0
Text Label 10150 5550 0    60   ~ 0
D8
Text Label 10150 5450 0    60   ~ 0
D15
Text Label 10150 5350 0    60   ~ 0
D6
Text Label 10150 5250 0    60   ~ 0
D14
Text Label 10150 5150 0    60   ~ 0
D1
Text Label 10150 4950 0    60   ~ 0
D13
Text Label 10150 4850 0    60   ~ 0
D9
Text Label 10150 4750 0    60   ~ 0
D12
Text Label 10150 4450 0    60   ~ 0
D5
Text Label 10150 4350 0    60   ~ 0
~ASEL
Text Label 10150 4250 0    60   ~ 0
D2
Text GLabel 10000 3950 2    60   Input ~ 0
~ROM_RST
Text Label 10150 3850 0    60   ~ 0
D10
Text Label 10150 3750 0    60   ~ 0
D4
Text Label 10150 3650 0    60   ~ 0
D3
Text GLabel 10300 3550 2    60   Input ~ 0
~MARK3
Text Label 10150 3450 0    60   ~ 0
D11
Text GLabel 10300 3350 2    60   Input ~ 0
~TIME
Text GLabel 10300 3150 2    60   Input ~ 0
TDO
Text Label 10150 2950 0    60   ~ 0
FA1
Text Label 10150 2850 0    60   ~ 0
FA0
Text Label 9400 2250 1    60   ~ 0
FA2
Text Label 9300 2250 1    60   ~ 0
FCE
Text Label 9200 2250 1    60   ~ 0
FA3
Text Label 9100 2250 1    60   ~ 0
FA4
Text Label 9000 2250 1    60   ~ 0
FOE
Text Label 8700 2250 1    60   ~ 0
FA5
Text Label 8600 2250 1    60   ~ 0
FD0
Text Label 8500 2250 1    60   ~ 0
FA6
Text Label 8400 2250 1    60   ~ 0
FD8
Text Label 7200 2250 1    60   ~ 0
FA7
Text Label 7100 2250 1    60   ~ 0
FD1
Text Label 7000 2250 1    60   ~ 0
FA17
Text Label 6900 2250 1    60   ~ 0
FD9
Text Label 6700 2250 1    60   ~ 0
FA18
Text Label 6600 2250 1    60   ~ 0
FD2
Text Label 6500 2250 1    60   ~ 0
FD10
Text Label 6400 2250 1    60   ~ 0
FD3
Text Label 6300 2250 1    60   ~ 0
FA21
Text Label 6200 2250 1    60   ~ 0
FD11
Text Label 6100 2250 1    60   ~ 0
FWE
Text Label 6000 2250 1    60   ~ 0
FD4
Text Label 5200 3150 2    60   ~ 0
FA20
Text Label 5200 3250 2    60   ~ 0
FD12
Text Label 5200 3350 2    60   ~ 0
FA19
Text Label 5200 3450 2    60   ~ 0
FD5
Text Label 5200 3550 2    60   ~ 0
FA8
Text Label 5200 3650 2    60   ~ 0
FD13
Text Label 5200 3750 2    60   ~ 0
FA9
Text Label 5200 4050 2    60   ~ 0
FD6
Text Label 5200 4150 2    60   ~ 0
FA10
Text Label 5200 4250 2    60   ~ 0
FD14
Text Label 5200 4450 2    60   ~ 0
FA11
Text Label 5200 4750 2    60   ~ 0
FD7
Text Label 5200 4850 2    60   ~ 0
FA12
Text Label 5200 4950 2    60   ~ 0
FD15
Text Label 5200 5150 2    60   ~ 0
FA13
Text Label 5200 5350 2    60   ~ 0
FA14
Text Label 5200 5450 2    60   ~ 0
FA15
Text Label 5200 5550 2    60   ~ 0
FA16
Text GLabel 7800 2150 1    60   Input ~ 0
MISO
Text GLabel 7600 2250 1    60   Input ~ 0
~Low_WR
NoConn ~ 7700 2350
NoConn ~ 7500 2350
NoConn ~ 4650 8250
Text GLabel 4900 5650 0    60   Input ~ 0
~CE_SPI
Text GLabel 5200 5750 0    60   Input ~ 0
SCLK
Text GLabel 4900 5850 0    60   Input ~ 0
MOSI/RX
Entry Wire Line
	3900 3050 4000 3150
Entry Wire Line
	3900 3150 4000 3250
Entry Wire Line
	3900 3250 4000 3350
Entry Wire Line
	3900 3350 4000 3450
Entry Wire Line
	3900 3450 4000 3550
Entry Wire Line
	3900 3550 4000 3650
Entry Wire Line
	3900 3650 4000 3750
Entry Wire Line
	3900 3950 4000 4050
Entry Wire Line
	3900 4050 4000 4150
Entry Wire Line
	3900 4150 4000 4250
Entry Wire Line
	3900 4350 4000 4450
Entry Wire Line
	3900 4650 4000 4750
Entry Wire Line
	3900 4750 4000 4850
Entry Wire Line
	3900 4850 4000 4950
Entry Wire Line
	3900 5050 4000 5150
Entry Wire Line
	3900 5250 4000 5350
Entry Wire Line
	3900 5350 4000 5450
Entry Wire Line
	3900 5450 4000 5550
Entry Wire Line
	5900 1900 6000 2000
Entry Wire Line
	6000 1900 6100 2000
Entry Wire Line
	6100 1900 6200 2000
Entry Wire Line
	6200 1900 6300 2000
Entry Wire Line
	6300 1900 6400 2000
Entry Wire Line
	6400 1900 6500 2000
Entry Wire Line
	6500 1900 6600 2000
Entry Wire Line
	6600 1900 6700 2000
Entry Wire Line
	6800 1900 6900 2000
Entry Wire Line
	6900 1900 7000 2000
Entry Wire Line
	7000 1900 7100 2000
Entry Wire Line
	7100 1900 7200 2000
Entry Wire Line
	8300 1950 8400 2050
Entry Wire Line
	8400 1950 8500 2050
Entry Wire Line
	8500 1950 8600 2050
Entry Wire Line
	8600 1950 8700 2050
Entry Wire Line
	8900 1950 9000 2050
Entry Wire Line
	9000 1950 9100 2050
Entry Wire Line
	9100 1950 9200 2050
Entry Wire Line
	9200 1950 9300 2050
Entry Wire Line
	9300 1950 9400 2050
Entry Wire Line
	10800 2850 10900 2950
Entry Wire Line
	10800 2950 10900 3050
Entry Wire Line
	5900 7100 6000 7200
Entry Wire Line
	6000 7100 6100 7200
Entry Wire Line
	6100 7100 6200 7200
Entry Wire Line
	6200 7100 6300 7200
Entry Wire Line
	6300 7100 6400 7200
Entry Wire Line
	6600 7100 6700 7200
Entry Wire Line
	6400 7100 6500 7200
Entry Wire Line
	6700 7100 6800 7200
Entry Wire Line
	7500 7100 7600 7200
Entry Wire Line
	7600 7100 7700 7200
Entry Wire Line
	7700 7100 7800 7200
Entry Wire Line
	7800 7100 7900 7200
Entry Wire Line
	8200 7100 8300 7200
Entry Wire Line
	8300 7100 8400 7200
Entry Wire Line
	8400 7100 8500 7200
Entry Wire Line
	8500 7100 8600 7200
Entry Wire Line
	8700 7100 8800 7200
Entry Wire Line
	8900 7100 9000 7200
Entry Wire Line
	9000 7100 9100 7200
Entry Wire Line
	9100 7100 9200 7200
Entry Wire Line
	9200 7100 9300 7200
Entry Wire Line
	9300 7100 9400 7200
Entry Wire Line
	9400 7100 9500 7200
Entry Wire Line
	10500 5750 10600 5850
Entry Wire Line
	10500 5650 10600 5750
Entry Wire Line
	10500 5550 10600 5650
Entry Wire Line
	10500 5450 10600 5550
Entry Wire Line
	10500 5350 10600 5450
Entry Wire Line
	10500 5250 10600 5350
Entry Wire Line
	10500 5150 10600 5250
Entry Wire Line
	10500 4950 10600 5050
Entry Wire Line
	10500 4850 10600 4950
Entry Wire Line
	10500 4750 10600 4850
Entry Wire Line
	10500 4450 10600 4550
Entry Wire Line
	10500 4350 10600 4450
Entry Wire Line
	10500 4250 10600 4350
Entry Wire Line
	10450 3850 10550 3950
Entry Wire Line
	10450 3750 10550 3850
Entry Wire Line
	10450 3650 10550 3750
Entry Wire Line
	10450 3450 10550 3550
Wire Wire Line
	10350 7950 10350 8250
Wire Wire Line
	10350 7950 11650 7950
Wire Wire Line
	12450 7950 13250 7950
Wire Wire Line
	10450 8250 10450 8100
Wire Wire Line
	10450 8100 10550 8100
Wire Wire Line
	10550 8100 10550 8250
Wire Wire Line
	10500 7800 10500 8100
Connection ~ 10500 8100
Wire Wire Line
	10250 7400 10250 8250
Wire Wire Line
	10250 7450 10850 7450
Wire Wire Line
	10850 7450 10850 7550
Connection ~ 10250 7450
Wire Wire Line
	10850 7850 10500 7850
Connection ~ 10500 7850
Wire Wire Line
	4550 7850 4550 8250
Wire Wire Line
	4750 7700 4750 8250
Wire Bus Line
	4950 8150 7350 8150
Connection ~ 8650 7300
Connection ~ 7500 7500
Connection ~ 7200 7500
Wire Bus Line
	7450 8150 8950 8150
Connection ~ 12800 8250
Wire Wire Line
	8900 1200 8900 2350
Connection ~ 8900 1500
Wire Wire Line
	8600 1250 8600 1850
Wire Wire Line
	8800 1850 8800 2350
Wire Wire Line
	8600 1850 8800 1850
Connection ~ 8600 1500
Wire Wire Line
	2000 6200 1250 6200
Wire Wire Line
	1250 6200 1250 7850
Wire Wire Line
	2000 6500 1050 6500
Wire Wire Line
	12250 1850 12000 1850
Wire Wire Line
	12250 1950 12000 1950
Wire Wire Line
	12000 1950 12000 2000
Wire Wire Line
	12000 2000 11900 2000
Wire Wire Line
	12250 2050 12100 2050
Wire Wire Line
	12100 2050 12100 2100
Wire Wire Line
	12100 2100 11450 2100
Wire Wire Line
	11450 1550 13800 1550
Connection ~ 12950 1550
Wire Wire Line
	13650 1900 13650 1550
Connection ~ 13650 1550
Wire Wire Line
	13650 2150 14200 2150
Connection ~ 10450 8250
Connection ~ 11350 8250
Connection ~ 12050 8250
Connection ~ 11350 7950
Connection ~ 12800 7950
Wire Wire Line
	1150 4750 1350 4750
Wire Wire Line
	1150 4600 1350 4600
Wire Wire Line
	1150 4450 1350 4450
Wire Wire Line
	1150 4300 1350 4300
Wire Wire Line
	1150 4150 1350 4150
Wire Wire Line
	1150 4000 1350 4000
Wire Wire Line
	1150 3850 1350 3850
Wire Wire Line
	1150 3700 1350 3700
Wire Wire Line
	1150 3550 1350 3550
Wire Wire Line
	1150 3400 1350 3400
Wire Wire Line
	1150 3250 1350 3250
Wire Wire Line
	1150 3100 1350 3100
Wire Wire Line
	1150 2950 1350 2950
Wire Wire Line
	1150 2800 1350 2800
Wire Wire Line
	1150 2650 1350 2650
Wire Wire Line
	1150 2500 1350 2500
Wire Wire Line
	1150 2350 1350 2350
Wire Wire Line
	1150 2200 1350 2200
Wire Wire Line
	1150 1600 1350 1600
Wire Wire Line
	1150 1750 1350 1750
Wire Wire Line
	1150 1900 1350 1900
Wire Wire Line
	1150 2050 1350 2050
Wire Wire Line
	2800 2350 2600 2350
Wire Wire Line
	2800 2500 2600 2500
Wire Wire Line
	2600 2650 2800 2650
Wire Wire Line
	2800 2800 2600 2800
Wire Wire Line
	2600 2950 2800 2950
Wire Wire Line
	2800 3100 2600 3100
Wire Wire Line
	2600 3250 2800 3250
Wire Wire Line
	2800 3400 2600 3400
Wire Wire Line
	2600 3550 2800 3550
Wire Wire Line
	2800 3700 2600 3700
Wire Wire Line
	2600 3850 2800 3850
Wire Wire Line
	2800 4000 2600 4000
Wire Wire Line
	2600 4150 2800 4150
Wire Wire Line
	2800 4300 2600 4300
Wire Wire Line
	2800 2200 2600 2200
Wire Wire Line
	2800 2050 2600 2050
Wire Wire Line
	2600 1900 2800 1900
Wire Wire Line
	2800 1750 2600 1750
Wire Bus Line
	1050 750  1050 4650
Wire Wire Line
	2600 1600 2800 1600
Wire Wire Line
	2600 4450 3250 4450
Wire Wire Line
	3300 4750 2600 4750
Wire Wire Line
	2600 4750 2600 4600
Wire Bus Line
	3200 750  3200 3300
Wire Wire Line
	2600 1450 2750 1450
Wire Wire Line
	2750 1450 2750 1000
Wire Wire Line
	1200 1000 2800 1000
Wire Wire Line
	1200 1000 1200 1450
Wire Wire Line
	1200 1450 1350 1450
Connection ~ 2750 1000
Wire Bus Line
	2900 1700 2900 4400
Wire Bus Line
	3200 3300 2900 3300
Wire Wire Line
	14000 1900 13650 1900
Wire Wire Line
	14300 1900 14950 1900
Wire Wire Line
	14950 1900 14950 2550
Wire Wire Line
	14950 2550 12950 2550
Wire Wire Line
	11450 2100 11450 1550
Wire Wire Line
	12800 8250 10650 8250
Wire Wire Line
	7500 7350 7500 7800
Wire Wire Line
	7400 6850 7400 7350
Wire Wire Line
	10000 7300 10000 6250
Wire Wire Line
	9300 7600 9300 7300
Connection ~ 9300 7300
Wire Wire Line
	8100 7300 8800 7300
Wire Wire Line
	9100 7300 10000 7300
Wire Wire Line
	11150 4150 10000 4150
Connection ~ 10850 4150
Wire Wire Line
	11100 3850 10500 3850
Wire Wire Line
	10500 4050 10000 4050
Wire Wire Line
	10500 3850 10500 4050
Connection ~ 10850 3850
Wire Wire Line
	10000 5950 11650 5950
Connection ~ 11350 5950
Wire Wire Line
	11600 5650 11000 5650
Wire Wire Line
	10000 5850 11000 5850
Connection ~ 11350 5650
Wire Wire Line
	3050 5050 5300 5050
Wire Wire Line
	3450 5250 5300 5250
Wire Wire Line
	3350 5950 5300 5950
Wire Wire Line
	8000 1350 8000 2350
Wire Wire Line
	7400 1750 7900 1750
Wire Wire Line
	7900 1750 7900 2350
Wire Wire Line
	7650 1750 7650 1700
Wire Wire Line
	7400 1750 7400 2350
Connection ~ 7650 1750
Wire Wire Line
	7300 1350 8000 1350
Wire Wire Line
	7650 1350 7650 1250
Wire Wire Line
	7300 1350 7300 2350
Connection ~ 7650 1350
Wire Wire Line
	6300 1550 5900 1550
Wire Wire Line
	5900 1400 5900 2350
Wire Wire Line
	6600 1550 6800 1550
Wire Wire Line
	6800 1350 6800 2350
Connection ~ 5900 1550
Connection ~ 6800 1550
Wire Wire Line
	5300 3050 4400 3050
Wire Wire Line
	5300 2950 4550 2950
Wire Wire Line
	4550 2950 4550 2900
Wire Wire Line
	4550 2900 4450 2900
Wire Wire Line
	4450 3950 5300 3950
Wire Wire Line
	5300 4350 4450 4350
Wire Wire Line
	5300 4650 4400 4650
Wire Wire Line
	8000 7500 8000 6850
Wire Wire Line
	7900 6850 7900 7500
Connection ~ 7500 7700
Wire Wire Line
	11250 4650 10000 4650
Wire Wire Line
	10000 5050 11250 5050
Wire Wire Line
	13600 4850 13100 4850
Wire Wire Line
	9850 8250 9850 8100
Wire Wire Line
	9850 8100 9900 8100
Wire Wire Line
	9900 8100 9900 7950
Wire Wire Line
	9950 8250 9950 8150
Wire Wire Line
	9950 8150 10100 8150
Wire Wire Line
	10100 8150 10100 8000
Wire Wire Line
	13600 5150 13050 5150
Wire Wire Line
	13600 5450 13150 5450
Wire Wire Line
	14750 5450 14300 5450
Wire Wire Line
	2250 6200 3450 6200
Wire Wire Line
	2250 6400 3450 6400
Wire Wire Line
	2250 6500 3750 6500
Wire Wire Line
	2250 6600 3450 6600
Wire Wire Line
	3300 6600 3300 6700
Connection ~ 3300 6600
Wire Wire Line
	3300 7850 3300 7000
Wire Wire Line
	950  7850 4350 7850
Connection ~ 1250 7850
Wire Wire Line
	1400 6500 1400 7500
Wire Wire Line
	1400 7500 3050 7500
Connection ~ 1400 6500
Wire Wire Line
	3050 6700 3050 6500
Connection ~ 3050 6500
Wire Wire Line
	2850 6700 2850 6400
Connection ~ 2850 6400
Wire Wire Line
	2650 6700 2650 6200
Connection ~ 2650 6200
Wire Wire Line
	2650 7500 2650 7000
Wire Wire Line
	2850 7500 2850 7000
Connection ~ 2650 7500
Wire Wire Line
	3050 7500 3050 7000
Connection ~ 2850 7500
Wire Notes Line
	3600 5850 4100 5850
Wire Notes Line
	7200 1200 7200 900 
Wire Notes Line
	12050 6150 11550 6150
Wire Notes Line
	12050 6100 12050 7600
Wire Notes Line
	11100 4550 12350 4550
Wire Notes Line
	11200 3150 12350 3150
Wire Notes Line
	8400 1300 8400 800 
Wire Notes Line
	3700 2950 3700 4600
Wire Notes Line
	7200 900  6000 900 
Wire Notes Line
	6000 900  6000 1150
Wire Notes Line
	3600 5850 3600 4650
Wire Notes Line
	3600 4650 4000 4650
Wire Notes Line
	5900 7850 7850 7850
Wire Notes Line
	5900 7850 5900 7400
Wire Notes Line
	7850 7850 7850 7500
Wire Notes Line
	12050 7600 11750 7600
Wire Notes Line
	12050 3150 12050 6150
Wire Notes Line
	12050 4550 12000 4550
Wire Notes Line
	12050 3150 12000 3150
Wire Notes Line
	8400 800  11900 800 
Wire Notes Line
	11900 800  11900 1350
Wire Wire Line
	5900 6850 5900 7100
Wire Wire Line
	6000 6850 6000 7100
Wire Wire Line
	6100 6850 6100 7100
Wire Wire Line
	6200 6850 6200 7100
Wire Wire Line
	6300 6850 6300 7100
Wire Wire Line
	6400 6850 6400 7100
Wire Wire Line
	6600 6850 6600 7100
Wire Wire Line
	6700 6850 6700 7100
Wire Wire Line
	7500 6850 7500 7100
Wire Wire Line
	7600 6850 7600 7100
Wire Wire Line
	7700 6850 7700 7100
Wire Wire Line
	7800 6850 7800 7100
Wire Wire Line
	8100 6850 8100 7300
Wire Wire Line
	8200 6850 8200 7100
Wire Wire Line
	8300 6850 8300 7100
Wire Wire Line
	8400 6850 8400 7100
Wire Wire Line
	8500 6850 8500 7100
Wire Wire Line
	8700 6850 8700 7100
Wire Wire Line
	8900 6850 8900 7100
Wire Wire Line
	9000 6850 9000 7100
Wire Wire Line
	9100 6850 9100 7100
Wire Wire Line
	9200 6850 9200 7100
Wire Wire Line
	9300 6850 9300 7100
Wire Wire Line
	9400 6850 9400 7100
Wire Wire Line
	10000 6150 10150 6150
Wire Wire Line
	10000 5750 10500 5750
Wire Wire Line
	10000 5650 10500 5650
Wire Wire Line
	10000 5550 10500 5550
Wire Wire Line
	10000 5450 10500 5450
Wire Wire Line
	10000 5350 10500 5350
Wire Wire Line
	10000 5150 10500 5150
Wire Wire Line
	10000 5250 10500 5250
Wire Wire Line
	10000 4950 10500 4950
Wire Wire Line
	10000 4850 10500 4850
Wire Wire Line
	10000 4750 10500 4750
Wire Wire Line
	10000 4450 10500 4450
Wire Wire Line
	10000 4350 10500 4350
Wire Wire Line
	10000 4250 10500 4250
Wire Wire Line
	10000 3850 10450 3850
Wire Wire Line
	10000 3750 10450 3750
Wire Wire Line
	10000 3650 10450 3650
Wire Wire Line
	10300 3550 10000 3550
Wire Wire Line
	10000 3450 10450 3450
Wire Wire Line
	10300 3350 10000 3350
Wire Wire Line
	10000 3050 10850 3050
Wire Wire Line
	10850 3050 10850 3850
Wire Wire Line
	10300 3150 10000 3150
Wire Wire Line
	10000 2950 10800 2950
Wire Wire Line
	10000 2850 10800 2850
Wire Wire Line
	9400 2050 9400 2350
Wire Wire Line
	9300 2050 9300 2350
Wire Wire Line
	9200 2050 9200 2350
Wire Wire Line
	9000 2050 9000 2350
Wire Wire Line
	9100 2050 9100 2350
Wire Wire Line
	8700 2050 8700 2350
Wire Wire Line
	8600 2050 8600 2350
Wire Wire Line
	8500 2050 8500 2350
Wire Wire Line
	8400 2050 8400 2350
Wire Wire Line
	7200 2000 7200 2350
Wire Wire Line
	7100 2000 7100 2350
Wire Wire Line
	6900 2000 6900 2350
Wire Wire Line
	7000 2000 7000 2350
Wire Wire Line
	6700 2000 6700 2350
Wire Wire Line
	6600 2000 6600 2350
Wire Wire Line
	6500 2000 6500 2350
Wire Wire Line
	6400 2000 6400 2350
Wire Wire Line
	6300 2000 6300 2350
Wire Wire Line
	6200 2000 6200 2350
Wire Wire Line
	6100 2000 6100 2350
Wire Wire Line
	6000 2000 6000 2350
Wire Wire Line
	4000 3150 5300 3150
Wire Wire Line
	4000 3250 5300 3250
Wire Wire Line
	4000 5550 5300 5550
Wire Wire Line
	4000 5450 5300 5450
Wire Wire Line
	4000 5350 5300 5350
Wire Wire Line
	4000 5150 5300 5150
Wire Wire Line
	4000 4950 5300 4950
Wire Wire Line
	4000 4850 5300 4850
Wire Wire Line
	4000 4750 5300 4750
Wire Wire Line
	4000 4450 5300 4450
Wire Wire Line
	4000 4250 5300 4250
Wire Wire Line
	4000 4150 5300 4150
Wire Wire Line
	4000 4050 5300 4050
Wire Wire Line
	4000 3750 5300 3750
Wire Wire Line
	4000 3650 5300 3650
Wire Wire Line
	4000 3550 5300 3550
Wire Wire Line
	4000 3450 5300 3450
Wire Wire Line
	4000 3350 5300 3350
Wire Wire Line
	7800 2150 7800 2350
Wire Wire Line
	7600 2250 7600 2350
Wire Wire Line
	4350 7850 4350 8250
Connection ~ 3300 7850
Wire Wire Line
	5300 5650 4900 5650
Wire Wire Line
	5300 5750 5200 5750
Wire Wire Line
	5300 5850 4900 5850
Wire Notes Line
	3800 3050 3700 3050
Wire Bus Line
	3900 3050 3900 5450
Wire Notes Line
	3700 4600 4100 4600
Wire Wire Line
	3350 5350 3350 5950
Connection ~ 3350 5350
Wire Wire Line
	3450 5250 3450 5350
Wire Wire Line
	3450 5350 3050 5350
Wire Bus Line
	3900 3850 2900 3850
Wire Bus Line
	6600 1900 5900 1900
Wire Bus Line
	7100 1900 6800 1900
Wire Bus Line
	6950 1800 6950 1900
Wire Bus Line
	6250 1900 6250 1800
Wire Bus Line
	3200 1800 8850 1800
Wire Bus Line
	3200 750  1050 750 
Wire Bus Line
	8300 1950 10900 1950
Wire Bus Line
	8850 1800 8850 1950
Wire Bus Line
	10900 1950 10900 3050
Wire Bus Line
	6000 7200 9500 7200
Wire Wire Line
	7300 7300 7200 7300
Connection ~ 7200 7300
Wire Wire Line
	7400 7350 7500 7350
Wire Wire Line
	7200 6850 7200 7750
Connection ~ 7200 7700
Wire Wire Line
	11000 5850 11000 5650
Wire Bus Line
	10600 3400 10600 5850
Wire Bus Line
	10550 3550 10550 3950
Wire Bus Line
	10550 3750 10600 3750
Wire Wire Line
	7300 7300 7300 6850
Wire Wire Line
	7900 7500 7500 7500
Wire Wire Line
	8600 6850 8650 6850
Wire Wire Line
	8650 6850 8650 7550
$EndSCHEMATC
