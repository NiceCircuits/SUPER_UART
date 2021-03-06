EESchema Schematic File Version 2
LIBS:_test_
LIBS:niceAVR
LIBS:niceCommunicationIC
LIBS:niceConectorsOther
LIBS:niceDiodes
LIBS:niceDrivers
LIBS:niceLogic
LIBS:niceMechanical
LIBS:niceModules
LIBS:niceMosfets
LIBS:niceOpamps
LIBS:nicePinheaders
LIBS:nicePowerSupplies
LIBS:niceResonators
LIBS:niceRLC
LIBS:niceSensors
LIBS:niceSTM32
LIBS:niceSwitches
LIBS:niceTerminalBlocks
LIBS:Test
LIBS:pnAnalogOther
LIBS:pnConnector
LIBS:pnDiode
LIBS:pnLogic
LIBS:pnModules
LIBS:pnOpamp
LIBS:pnPins
LIBS:pnPowerManagement
LIBS:pnRC
LIBS:pnSwitches
LIBS:pnSymbols
LIBS:pnTransistor
LIBS:pnRelay
LIBS:74xgxx
LIBS:74xx
LIBS:cmos4000
LIBS:niceIsolators
LIBS:conn
LIBS:niceCpld
LIBS:SUPER_UART_front-cache
EELAYER 25 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 5 5
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
L FT4232HL_UART U2
U 1 1 592A9510
P 5250 3400
F 0 "U2" H 5250 5660 60  0000 C CNN
F 1 "FT4232HL_UART" H 5250 1260 40  0000 C CNN
F 2 "FTDI_LQFP64_N" H 5250 1200 40  0001 C CNN
F 3 "" H 5250 3400 60  0001 C CNN
	1    5250 3400
	1    0    0    -1  
$EndComp
Text HLabel 6850 1300 2    56   Output ~ 0
TXD_A
Text HLabel 6850 1400 2    56   BiDi ~ 0
RXD_A
Text HLabel 6850 1700 2    56   BiDi ~ 0
DTR_A
Text HLabel 6850 1600 2    56   BiDi ~ 0
CTS_A
NoConn ~ 6450 1800
NoConn ~ 6450 1900
NoConn ~ 6450 2000
Text HLabel 6850 2200 2    56   Output ~ 0
TXD_B
Text HLabel 6850 2300 2    56   BiDi ~ 0
RXD_B
Text HLabel 6850 2600 2    56   BiDi ~ 0
DTR_B
Text HLabel 6850 2500 2    56   BiDi ~ 0
CTS_B
NoConn ~ 6450 2700
NoConn ~ 6450 2800
NoConn ~ 6450 2900
Text HLabel 6850 3100 2    56   Output ~ 0
TXD_C
Text HLabel 6850 3200 2    56   BiDi ~ 0
RXD_C
Text HLabel 6850 3500 2    56   BiDi ~ 0
DTR_C
Text HLabel 6850 3400 2    56   BiDi ~ 0
CTS_C
NoConn ~ 6450 3300
NoConn ~ 6450 3600
NoConn ~ 6450 3700
NoConn ~ 6450 3800
Text Notes 7300 1350 0    60   ~ 0
I2C: SCL, SPI: SCK
Text Notes 7300 2250 0    60   ~ 0
I2C: SCL, SPI: SCK, SPY: Override TXD
Text Notes 7300 3150 0    60   ~ 0
SPY: Override RXD
Text Notes 7300 3250 0    60   ~ 0
SPY: Spy TXD
Text Notes 7300 2350 0    60   ~ 0
I2C: SDA_out, SPI: MOSI, SPY: Spy RXD
Text Notes 7300 2550 0    60   ~ 0
I2C: Aux out (WP), SPI: CS
Text HLabel 6850 1500 2    56   BiDi ~ 0
RTS_A
Text Notes 7300 1450 0    60   ~ 0
I2C: SDA_out, SPI: MOSI
Text Notes 7300 1550 0    60   ~ 0
I2C: SDA_in, SPI: MISO
Text Notes 7300 2450 0    60   ~ 0
I2C: SDA_in, SPI: MISO
Text HLabel 6850 2400 2    56   BiDi ~ 0
RTS_B
Text Notes 7300 1650 0    60   ~ 0
I2C: Aux out (WP), SPI: CS
Text HLabel 6850 4000 2    56   Output ~ 0
TXD_D
Text HLabel 6850 4100 2    56   Input ~ 0
RXD_D
Text HLabel 6850 4400 2    56   Output ~ 0
DTR_D
Text HLabel 6850 4300 2    56   Input ~ 0
CTS_D
Text HLabel 6850 4200 2    56   Output ~ 0
RTS_D
Text HLabel 6850 4700 2    56   Input ~ 0
RI_D
Text HLabel 6850 4600 2    56   Input ~ 0
DCD_D
Text HLabel 6850 4500 2    56   Input ~ 0
DSR_D
$Comp
L +1V8 #PWR227
U 1 1 592AB6C4
P 3800 3750
F 0 "#PWR227" V 3760 3795 10  0001 C CNN
F 1 "+1V8" H 3800 3880 50  0000 C CNN
F 2 "" H 3800 3750 50  0001 C CNN
F 3 "" H 3800 3750 50  0001 C CNN
	1    3800 3750
	1    0    0    -1  
$EndComp
$Comp
L C C45
U 1 1 592ABABE
P 1000 3350
F 0 "C45" H 1020 3450 60  0000 L CNN
F 1 "100n" H 1020 3250 40  0000 L CNN
F 2 "0603_N" H 1020 3190 40  0001 L CNN
F 3 "" H 1000 3350 60  0001 C CNN
	1    1000 3350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR221
U 1 1 592ABAC4
P 1000 3550
F 0 "#PWR221" H 1035 3525 10  0001 C CNN
F 1 "GND" H 970 3525 10  0001 C CNN
F 2 "" H 1000 3550 50  0001 C CNN
F 3 "" H 1000 3550 50  0001 C CNN
	1    1000 3550
	1    0    0    -1  
$EndComp
$Comp
L +1V8 #PWR217
U 1 1 592AC3FB
P 1000 3150
F 0 "#PWR217" V 960 3195 10  0001 C CNN
F 1 "+1V8" H 1000 3280 50  0000 C CNN
F 2 "" H 1000 3150 50  0001 C CNN
F 3 "" H 1000 3150 50  0001 C CNN
	1    1000 3150
	1    0    0    -1  
$EndComp
$Comp
L C C46
U 1 1 592AC425
P 1300 3350
F 0 "C46" H 1320 3450 60  0000 L CNN
F 1 "100n" H 1320 3250 40  0000 L CNN
F 2 "0603_N" H 1320 3190 40  0001 L CNN
F 3 "" H 1300 3350 60  0001 C CNN
	1    1300 3350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR222
U 1 1 592AC42B
P 1300 3550
F 0 "#PWR222" H 1335 3525 10  0001 C CNN
F 1 "GND" H 1270 3525 10  0001 C CNN
F 2 "" H 1300 3550 50  0001 C CNN
F 3 "" H 1300 3550 50  0001 C CNN
	1    1300 3550
	1    0    0    -1  
$EndComp
$Comp
L +1V8 #PWR218
U 1 1 592AC433
P 1300 3150
F 0 "#PWR218" V 1260 3195 10  0001 C CNN
F 1 "+1V8" H 1300 3280 50  0000 C CNN
F 2 "" H 1300 3150 50  0001 C CNN
F 3 "" H 1300 3150 50  0001 C CNN
	1    1300 3150
	1    0    0    -1  
$EndComp
$Comp
L C C47
U 1 1 592AC479
P 1600 3350
F 0 "C47" H 1620 3450 60  0000 L CNN
F 1 "100n" H 1620 3250 40  0000 L CNN
F 2 "0603_N" H 1620 3190 40  0001 L CNN
F 3 "" H 1600 3350 60  0001 C CNN
	1    1600 3350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR223
U 1 1 592AC47F
P 1600 3550
F 0 "#PWR223" H 1635 3525 10  0001 C CNN
F 1 "GND" H 1570 3525 10  0001 C CNN
F 2 "" H 1600 3550 50  0001 C CNN
F 3 "" H 1600 3550 50  0001 C CNN
	1    1600 3550
	1    0    0    -1  
$EndComp
$Comp
L +1V8 #PWR219
U 1 1 592AC487
P 1600 3150
F 0 "#PWR219" V 1560 3195 10  0001 C CNN
F 1 "+1V8" H 1600 3280 50  0000 C CNN
F 2 "" H 1600 3150 50  0001 C CNN
F 3 "" H 1600 3150 50  0001 C CNN
	1    1600 3150
	1    0    0    -1  
$EndComp
$Comp
L C C48
U 1 1 592AC48D
P 1900 3350
F 0 "C48" H 1920 3450 60  0000 L CNN
F 1 "100n" H 1920 3250 40  0000 L CNN
F 2 "0603_N" H 1920 3190 40  0001 L CNN
F 3 "" H 1900 3350 60  0001 C CNN
	1    1900 3350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR224
U 1 1 592AC493
P 1900 3550
F 0 "#PWR224" H 1935 3525 10  0001 C CNN
F 1 "GND" H 1870 3525 10  0001 C CNN
F 2 "" H 1900 3550 50  0001 C CNN
F 3 "" H 1900 3550 50  0001 C CNN
	1    1900 3550
	1    0    0    -1  
$EndComp
$Comp
L +1V8 #PWR220
U 1 1 592AC49B
P 1900 3150
F 0 "#PWR220" V 1860 3195 10  0001 C CNN
F 1 "+1V8" H 1900 3280 50  0000 C CNN
F 2 "" H 1900 3150 50  0001 C CNN
F 3 "" H 1900 3150 50  0001 C CNN
	1    1900 3150
	1    0    0    -1  
$EndComp
$Comp
L C C38
U 1 1 592AC4CE
P 1000 2650
F 0 "C38" H 1020 2750 60  0000 L CNN
F 1 "100n" H 1020 2550 40  0000 L CNN
F 2 "0603_N" H 1020 2490 40  0001 L CNN
F 3 "" H 1000 2650 60  0001 C CNN
	1    1000 2650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR210
U 1 1 592AC4D4
P 1000 2850
F 0 "#PWR210" H 1035 2825 10  0001 C CNN
F 1 "GND" H 970 2825 10  0001 C CNN
F 2 "" H 1000 2850 50  0001 C CNN
F 3 "" H 1000 2850 50  0001 C CNN
	1    1000 2850
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR203
U 1 1 592AC4F7
P 1000 2450
F 0 "#PWR203" V 960 2495 10  0001 C CNN
F 1 "+3V3" H 1000 2580 50  0000 C CNN
F 2 "" H 1000 2450 50  0001 C CNN
F 3 "" H 1000 2450 50  0001 C CNN
	1    1000 2450
	1    0    0    -1  
$EndComp
$Comp
L C C39
U 1 1 592AC578
P 1300 2650
F 0 "C39" H 1320 2750 60  0000 L CNN
F 1 "100n" H 1320 2550 40  0000 L CNN
F 2 "0603_N" H 1320 2490 40  0001 L CNN
F 3 "" H 1300 2650 60  0001 C CNN
	1    1300 2650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR211
U 1 1 592AC57E
P 1300 2850
F 0 "#PWR211" H 1335 2825 10  0001 C CNN
F 1 "GND" H 1270 2825 10  0001 C CNN
F 2 "" H 1300 2850 50  0001 C CNN
F 3 "" H 1300 2850 50  0001 C CNN
	1    1300 2850
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR204
U 1 1 592AC586
P 1300 2450
F 0 "#PWR204" V 1260 2495 10  0001 C CNN
F 1 "+3V3" H 1300 2580 50  0000 C CNN
F 2 "" H 1300 2450 50  0001 C CNN
F 3 "" H 1300 2450 50  0001 C CNN
	1    1300 2450
	1    0    0    -1  
$EndComp
$Comp
L C C40
U 1 1 592AC5C8
P 1600 2650
F 0 "C40" H 1620 2750 60  0000 L CNN
F 1 "100n" H 1620 2550 40  0000 L CNN
F 2 "0603_N" H 1620 2490 40  0001 L CNN
F 3 "" H 1600 2650 60  0001 C CNN
	1    1600 2650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR212
U 1 1 592AC5CE
P 1600 2850
F 0 "#PWR212" H 1635 2825 10  0001 C CNN
F 1 "GND" H 1570 2825 10  0001 C CNN
F 2 "" H 1600 2850 50  0001 C CNN
F 3 "" H 1600 2850 50  0001 C CNN
	1    1600 2850
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR205
U 1 1 592AC5D6
P 1600 2450
F 0 "#PWR205" V 1560 2495 10  0001 C CNN
F 1 "+3V3" H 1600 2580 50  0000 C CNN
F 2 "" H 1600 2450 50  0001 C CNN
F 3 "" H 1600 2450 50  0001 C CNN
	1    1600 2450
	1    0    0    -1  
$EndComp
$Comp
L C C41
U 1 1 592AC5DC
P 1900 2650
F 0 "C41" H 1920 2750 60  0000 L CNN
F 1 "100n" H 1920 2550 40  0000 L CNN
F 2 "0603_N" H 1920 2490 40  0001 L CNN
F 3 "" H 1900 2650 60  0001 C CNN
	1    1900 2650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR213
U 1 1 592AC5E2
P 1900 2850
F 0 "#PWR213" H 1935 2825 10  0001 C CNN
F 1 "GND" H 1870 2825 10  0001 C CNN
F 2 "" H 1900 2850 50  0001 C CNN
F 3 "" H 1900 2850 50  0001 C CNN
	1    1900 2850
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR206
U 1 1 592AC5EA
P 1900 2450
F 0 "#PWR206" V 1860 2495 10  0001 C CNN
F 1 "+3V3" H 1900 2580 50  0000 C CNN
F 2 "" H 1900 2450 50  0001 C CNN
F 3 "" H 1900 2450 50  0001 C CNN
	1    1900 2450
	1    0    0    -1  
$EndComp
$Comp
L C C42
U 1 1 592AC70A
P 2200 2650
F 0 "C42" H 2220 2750 60  0000 L CNN
F 1 "100n" H 2220 2550 40  0000 L CNN
F 2 "0603_N" H 2220 2490 40  0001 L CNN
F 3 "" H 2200 2650 60  0001 C CNN
	1    2200 2650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR214
U 1 1 592AC710
P 2200 2850
F 0 "#PWR214" H 2235 2825 10  0001 C CNN
F 1 "GND" H 2170 2825 10  0001 C CNN
F 2 "" H 2200 2850 50  0001 C CNN
F 3 "" H 2200 2850 50  0001 C CNN
	1    2200 2850
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR207
U 1 1 592AC718
P 2200 2450
F 0 "#PWR207" V 2160 2495 10  0001 C CNN
F 1 "+3V3" H 2200 2580 50  0000 C CNN
F 2 "" H 2200 2450 50  0001 C CNN
F 3 "" H 2200 2450 50  0001 C CNN
	1    2200 2450
	1    0    0    -1  
$EndComp
$Comp
L C C50
U 1 1 592ACBDB
P 3400 3950
F 0 "C50" H 3420 4050 60  0000 L CNN
F 1 "100n" H 3420 3850 40  0000 L CNN
F 2 "0603_N" H 3420 3790 40  0001 L CNN
F 3 "" H 3400 3950 60  0001 C CNN
	1    3400 3950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR226
U 1 1 592ACBE1
P 3400 4150
F 0 "#PWR226" H 3435 4125 10  0001 C CNN
F 1 "GND" H 3370 4125 10  0001 C CNN
F 2 "" H 3400 4150 50  0001 C CNN
F 3 "" H 3400 4150 50  0001 C CNN
	1    3400 4150
	1    0    0    -1  
$EndComp
$Comp
L C C49
U 1 1 592ACC39
P 3100 3950
F 0 "C49" H 3120 4050 60  0000 L CNN
F 1 "4u7" H 3120 3850 40  0000 L CNN
F 2 "0805_N" H 3120 3790 40  0001 L CNN
F 3 "" H 3100 3950 60  0001 C CNN
	1    3100 3950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR225
U 1 1 592ACC3F
P 3100 4150
F 0 "#PWR225" H 3135 4125 10  0001 C CNN
F 1 "GND" H 3070 4125 10  0001 C CNN
F 2 "" H 3100 4150 50  0001 C CNN
F 3 "" H 3100 4150 50  0001 C CNN
	1    3100 4150
	1    0    0    -1  
$EndComp
$Comp
L FR FR2
U 1 1 592AD064
P 2800 3750
F 0 "FR2" H 2800 3830 60  0000 C CNN
F 1 "FR" H 2800 3675 40  0000 C CNN
F 2 "0603_R_N" H 2800 3750 20  0001 C CNN
F 3 "" H 2800 3750 60  0001 C CNN
	1    2800 3750
	1    0    0    -1  
$EndComp
$Comp
L C C44
U 1 1 592AD28C
P 3400 3300
F 0 "C44" H 3420 3400 60  0000 L CNN
F 1 "100n" H 3420 3200 40  0000 L CNN
F 2 "0603_N" H 3420 3140 40  0001 L CNN
F 3 "" H 3400 3300 60  0001 C CNN
	1    3400 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR216
U 1 1 592AD292
P 3400 3500
F 0 "#PWR216" H 3435 3475 10  0001 C CNN
F 1 "GND" H 3370 3475 10  0001 C CNN
F 2 "" H 3400 3500 50  0001 C CNN
F 3 "" H 3400 3500 50  0001 C CNN
	1    3400 3500
	1    0    0    -1  
$EndComp
$Comp
L C C43
U 1 1 592AD29A
P 3100 3300
F 0 "C43" H 3120 3400 60  0000 L CNN
F 1 "4u7" H 3120 3200 40  0000 L CNN
F 2 "0805_N" H 3120 3140 40  0001 L CNN
F 3 "" H 3100 3300 60  0001 C CNN
	1    3100 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR215
U 1 1 592AD2A0
P 3100 3500
F 0 "#PWR215" H 3135 3475 10  0001 C CNN
F 1 "GND" H 3070 3475 10  0001 C CNN
F 2 "" H 3100 3500 50  0001 C CNN
F 3 "" H 3100 3500 50  0001 C CNN
	1    3100 3500
	1    0    0    -1  
$EndComp
$Comp
L FR FR1
U 1 1 592AD2A7
P 2800 3100
F 0 "FR1" H 2800 3180 60  0000 C CNN
F 1 "FR" H 2800 3025 40  0000 C CNN
F 2 "0603_R_N" H 2800 3100 20  0001 C CNN
F 3 "" H 2800 3100 60  0001 C CNN
	1    2800 3100
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR209
U 1 1 592AD480
P 3950 2600
F 0 "#PWR209" V 3910 2645 10  0001 C CNN
F 1 "+3V3" H 3950 2730 50  0000 C CNN
F 2 "" H 3950 2600 50  0001 C CNN
F 3 "" H 3950 2600 50  0001 C CNN
	1    3950 2600
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR208
U 1 1 592ADAC3
P 2600 3000
F 0 "#PWR208" V 2560 3045 10  0001 C CNN
F 1 "+3V3" H 2600 3130 50  0000 C CNN
F 2 "" H 2600 3000 50  0001 C CNN
F 3 "" H 2600 3000 50  0001 C CNN
	1    2600 3000
	1    0    0    -1  
$EndComp
$Comp
L R R18
U 1 1 592AE607
P 3850 2200
F 0 "R18" H 3850 2280 60  0000 C CNN
F 1 "12k" H 3850 2200 40  0000 C CNN
F 2 "0603_R_N" H 3850 2140 40  0001 C CNN
F 3 "" H 3850 2200 60  0001 C CNN
	1    3850 2200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR202
U 1 1 592AE661
P 3650 2300
F 0 "#PWR202" H 3685 2275 10  0001 C CNN
F 1 "GND" H 3620 2275 10  0001 C CNN
F 2 "" H 3650 2300 50  0001 C CNN
F 3 "" H 3650 2300 50  0001 C CNN
	1    3650 2300
	1    0    0    -1  
$EndComp
$Comp
L XC9536XL-10VQG44 U12
U 1 1 592DA90D
P 11050 4450
F 0 "U12" H 11050 5410 60  0000 C CNN
F 1 "XC9536XL-10VQG44" H 11050 3510 40  0000 C CNN
F 2 "Xilinx_VQFP44_N" H 11050 3450 40  0001 C CNN
F 3 "" H 11050 4450 60  0001 C CNN
	1    11050 4450
	1    0    0    -1  
$EndComp
$Comp
L XC9536XL-10VQG44 U12
U 2 1 592DA9D2
P 11000 6800
F 0 "U12" H 11000 7350 60  0000 C CNN
F 1 "XC9536XL-10VQG44" H 11000 6350 40  0000 C CNN
F 2 "Xilinx_VQFP44_N" H 11000 5800 40  0001 C CNN
F 3 "" H 11000 6800 60  0001 C CNN
	2    11000 6800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR228
U 1 1 592DB1C6
P 3950 5500
F 0 "#PWR228" H 3985 5475 10  0001 C CNN
F 1 "GND" H 3920 5475 10  0001 C CNN
F 2 "" H 3950 5500 50  0001 C CNN
F 3 "" H 3950 5500 50  0001 C CNN
	1    3950 5500
	1    0    0    -1  
$EndComp
Text HLabel 6850 5400 2    56   Output ~ 0
EECS
Text HLabel 6850 5300 2    56   Output ~ 0
EEDATA
Text HLabel 6850 5200 2    56   Output ~ 0
EECLK
$Comp
L 93LC46BT-I/OT U15
U 1 1 592DC219
P 5400 6450
F 0 "U15" H 5400 6750 60  0000 C CNN
F 1 "93LC46BT-I/OT" H 5400 6150 40  0000 C CNN
F 2 "niceSemiconductors:SOT23-6_N" H 5400 6450 10  0001 C CNN
F 3 "" H 5400 6950 60  0000 C CNN
	1    5400 6450
	1    0    0    -1  
$EndComp
$Comp
L R_Network_4V RN10
U 4 1 592DC7DD
P 5950 6000
F 0 "RN10" H 6010 6040 60  0000 L CNN
F 1 "10k" H 6010 5960 40  0000 L CNN
F 2 "4x0603_N" H 6010 5900 40  0001 L CNN
F 3 "" H 5950 6000 60  0001 C CNN
	4    5950 6000
	-1   0    0    -1  
$EndComp
$Comp
L R_Network_4V RN10
U 3 1 592DC874
P 6050 6000
F 0 "RN10" H 6110 6040 60  0001 L CNN
F 1 "10k" H 6110 5960 40  0001 L CNN
F 2 "4x0603_N" H 6110 5900 40  0001 L CNN
F 3 "" H 6050 6000 60  0001 C CNN
	3    6050 6000
	-1   0    0    -1  
$EndComp
$Comp
L R_Network_4V RN10
U 2 1 592DCACE
P 6150 6000
F 0 "RN10" H 6210 6040 60  0001 L CNN
F 1 "10k" H 6210 5960 40  0001 L CNN
F 2 "4x0603_N" H 6210 5900 40  0001 L CNN
F 3 "" H 6150 6000 60  0001 C CNN
	2    6150 6000
	-1   0    0    -1  
$EndComp
$Comp
L R_Network_4V RN10
U 1 1 592DCB18
P 6250 6000
F 0 "RN10" H 6310 6040 60  0001 L CNN
F 1 "10k" H 6310 5960 40  0001 L CNN
F 2 "4x0603_N" H 6310 5900 40  0001 L CNN
F 3 "" H 6250 6000 60  0001 C CNN
	1    6250 6000
	-1   0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 592DCEA9
P 6450 6600
F 0 "R?" H 6450 6680 60  0000 C CNN
F 1 "2k" H 6450 6600 40  0000 C CNN
F 2 "0603_R_N" H 6450 6540 40  0001 C CNN
F 3 "" H 6450 6600 60  0001 C CNN
	1    6450 6600
	1    0    0    1   
$EndComp
$Comp
L +3V3 #PWR?
U 1 1 592DD47E
P 6250 5700
F 0 "#PWR?" V 6210 5745 10  0001 C CNN
F 1 "+3V3" H 6250 5830 50  0000 C CNN
F 2 "" H 6250 5700 50  0001 C CNN
F 3 "" H 6250 5700 50  0001 C CNN
	1    6250 5700
	1    0    0    -1  
$EndComp
NoConn ~ 5950 6200
NoConn ~ 5950 5800
$Comp
L C C?
U 1 1 592DE91B
P 4850 6450
F 0 "C?" H 4870 6550 60  0000 L CNN
F 1 "100n" H 4870 6350 40  0000 L CNN
F 2 "0603_N" H 4870 6290 40  0001 L CNN
F 3 "" H 4850 6450 60  0001 C CNN
	1    4850 6450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 592DE921
P 4850 6700
F 0 "#PWR?" H 4885 6675 10  0001 C CNN
F 1 "GND" H 4820 6675 10  0001 C CNN
F 2 "" H 4850 6700 50  0001 C CNN
F 3 "" H 4850 6700 50  0001 C CNN
	1    4850 6700
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR?
U 1 1 592DE929
P 4850 6200
F 0 "#PWR?" V 4810 6245 10  0001 C CNN
F 1 "+3V3" H 4850 6330 50  0000 C CNN
F 2 "" H 4850 6200 50  0001 C CNN
F 3 "" H 4850 6200 50  0001 C CNN
	1    4850 6200
	1    0    0    -1  
$EndComp
$Comp
L XT_3.2x2.5 Q?
U 1 1 592B3C91
P 3050 2200
F 0 "Q?" H 3050 2500 60  0000 C CNN
F 1 "N.C." H 3050 2400 40  0000 C CNN
F 2 "XT3.2x2.5_N" H 3050 2290 40  0001 C CNN
F 3 "" H 3050 2200 60  0001 C CNN
	1    3050 2200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 592B74F5
P 3050 2550
F 0 "#PWR?" H 3085 2525 10  0001 C CNN
F 1 "GND" H 3020 2525 10  0001 C CNN
F 2 "" H 3050 2550 50  0001 C CNN
F 3 "" H 3050 2550 50  0001 C CNN
	1    3050 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 1700 6450 1700
Wire Wire Line
	6450 1600 6850 1600
Wire Wire Line
	6850 1400 6450 1400
Wire Wire Line
	6450 1300 6850 1300
Wire Wire Line
	6850 2600 6450 2600
Wire Wire Line
	6450 2500 6850 2500
Wire Wire Line
	6850 2300 6450 2300
Wire Wire Line
	6450 2200 6850 2200
Wire Wire Line
	6850 3500 6450 3500
Wire Wire Line
	6450 3400 6850 3400
Wire Wire Line
	6850 3200 6450 3200
Wire Wire Line
	6450 3100 6850 3100
Wire Wire Line
	6850 1500 6450 1500
Wire Wire Line
	6850 2400 6450 2400
Wire Wire Line
	6850 4400 6450 4400
Wire Wire Line
	6450 4300 6850 4300
Wire Wire Line
	6850 4100 6450 4100
Wire Wire Line
	6450 4000 6850 4000
Wire Wire Line
	6850 4200 6450 4200
Wire Wire Line
	6850 4700 6450 4700
Wire Wire Line
	6450 4600 6850 4600
Wire Wire Line
	6850 4500 6450 4500
Wire Wire Line
	3950 3500 3950 3800
Wire Wire Line
	3950 3500 4050 3500
Wire Wire Line
	4050 3600 3950 3600
Connection ~ 3950 3600
Wire Wire Line
	4050 3700 3950 3700
Connection ~ 3950 3700
Connection ~ 3950 3800
Wire Wire Line
	1000 3550 1000 3450
Wire Wire Line
	1000 3150 1000 3250
Wire Wire Line
	3800 3750 3800 3800
Wire Wire Line
	3800 3800 4050 3800
Wire Wire Line
	3950 3300 4050 3300
Wire Wire Line
	3950 2600 3950 3300
Wire Wire Line
	3950 2700 4050 2700
Wire Wire Line
	4050 2800 3950 2800
Connection ~ 3950 2800
Wire Wire Line
	3950 2900 4050 2900
Connection ~ 3950 2900
Wire Wire Line
	4050 3000 3950 3000
Connection ~ 3950 3000
Wire Wire Line
	1300 3550 1300 3450
Wire Wire Line
	1300 3150 1300 3250
Wire Wire Line
	1600 3550 1600 3450
Wire Wire Line
	1600 3150 1600 3250
Wire Wire Line
	1900 3550 1900 3450
Wire Wire Line
	1900 3150 1900 3250
Wire Wire Line
	1000 2850 1000 2750
Wire Wire Line
	1000 2450 1000 2550
Wire Wire Line
	1300 2850 1300 2750
Wire Wire Line
	1300 2450 1300 2550
Wire Wire Line
	1600 2850 1600 2750
Wire Wire Line
	1600 2450 1600 2550
Wire Wire Line
	1900 2850 1900 2750
Wire Wire Line
	1900 2450 1900 2550
Wire Wire Line
	2200 2850 2200 2750
Wire Wire Line
	2200 2450 2200 2550
Wire Wire Line
	3400 4150 3400 4050
Wire Wire Line
	3400 3750 3400 3850
Wire Wire Line
	3100 4150 3100 4050
Wire Wire Line
	2900 3750 3650 3750
Wire Wire Line
	3100 3850 3100 3750
Connection ~ 3100 3750
Wire Wire Line
	3400 3500 3400 3400
Wire Wire Line
	3400 3100 3400 3200
Wire Wire Line
	3100 3500 3100 3400
Wire Wire Line
	2900 3100 4050 3100
Wire Wire Line
	3100 3200 3100 3100
Connection ~ 3100 3100
Connection ~ 3950 2700
Connection ~ 3400 3100
Connection ~ 3400 3750
Wire Wire Line
	2600 3000 2600 3750
Wire Wire Line
	2600 3750 2700 3750
Wire Wire Line
	2700 3100 2600 3100
Connection ~ 2600 3100
Wire Wire Line
	3650 2300 3650 2200
Wire Wire Line
	3650 2200 3750 2200
Wire Wire Line
	3950 2200 4050 2200
Wire Wire Line
	4050 4500 3950 4500
Wire Wire Line
	3950 4500 3950 5500
Wire Wire Line
	3950 5400 4050 5400
Connection ~ 3950 5400
Wire Wire Line
	4050 5300 3950 5300
Connection ~ 3950 5300
Wire Wire Line
	3950 5200 4050 5200
Connection ~ 3950 5200
Wire Wire Line
	4050 5100 3950 5100
Connection ~ 3950 5100
Wire Wire Line
	3950 5000 4050 5000
Connection ~ 3950 5000
Wire Wire Line
	4050 4900 3950 4900
Connection ~ 3950 4900
Wire Wire Line
	3950 4800 4050 4800
Connection ~ 3950 4800
Wire Wire Line
	4050 4700 3950 4700
Connection ~ 3950 4700
Wire Wire Line
	3950 4600 4050 4600
Connection ~ 3950 4600
Wire Wire Line
	6450 5400 6850 5400
Wire Wire Line
	6450 5300 6850 5300
Wire Wire Line
	6450 5200 6850 5200
Wire Wire Line
	5750 6300 6500 6300
Wire Wire Line
	6500 6300 6500 5400
Connection ~ 6500 5400
Wire Wire Line
	5750 6400 6600 6400
Wire Wire Line
	6600 6400 6600 5200
Connection ~ 6600 5200
Wire Wire Line
	5750 6500 6700 6500
Wire Wire Line
	6700 5300 6700 6600
Connection ~ 6700 5300
Wire Wire Line
	6050 6200 6050 6300
Connection ~ 6050 6300
Wire Wire Line
	6150 6200 6150 6400
Connection ~ 6150 6400
Wire Wire Line
	5750 6600 6350 6600
Wire Wire Line
	6700 6600 6550 6600
Connection ~ 6700 6500
Wire Wire Line
	6250 6200 6250 6600
Connection ~ 6250 6600
Wire Wire Line
	6250 5700 6250 5800
Connection ~ 6250 5750
Wire Wire Line
	6050 5800 6050 5750
Wire Wire Line
	6150 5800 6150 5750
Connection ~ 6150 5750
Wire Wire Line
	6050 5750 6250 5750
Wire Wire Line
	4850 6550 4850 6700
Wire Wire Line
	4850 6200 4850 6350
Wire Wire Line
	4850 6300 5050 6300
Connection ~ 4850 6300
Wire Wire Line
	5050 6600 4850 6600
Connection ~ 4850 6600
Wire Wire Line
	3650 3750 3650 3200
Wire Wire Line
	3650 3200 4050 3200
Wire Wire Line
	3000 2400 3000 2450
Wire Wire Line
	3000 2450 3100 2450
Wire Wire Line
	3100 2450 3100 2400
Wire Wire Line
	3050 2450 3050 2550
Connection ~ 3050 2450
Wire Wire Line
	3250 2200 3400 2200
Wire Wire Line
	3400 2000 3400 2300
Wire Wire Line
	3400 2000 4050 2000
Wire Wire Line
	2550 1800 4050 1800
Wire Wire Line
	2700 1800 2700 2300
Wire Wire Line
	2700 2200 2850 2200
$Comp
L C C?
U 1 1 592B7C04
P 3400 2400
F 0 "C?" H 3420 2500 60  0000 L CNN
F 1 "N.C." H 3420 2300 40  0000 L CNN
F 2 "0603_N" H 3420 2240 40  0001 L CNN
F 3 "" H 3400 2400 60  0001 C CNN
	1    3400 2400
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 592B7DA8
P 2700 2400
F 0 "C?" H 2720 2500 60  0000 L CNN
F 1 "N.C." H 2720 2300 40  0000 L CNN
F 2 "0603_N" H 2720 2240 40  0001 L CNN
F 3 "" H 2700 2400 60  0001 C CNN
	1    2700 2400
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 592B7EA3
P 2700 2550
F 0 "#PWR?" H 2735 2525 10  0001 C CNN
F 1 "GND" H 2670 2525 10  0001 C CNN
F 2 "" H 2700 2550 50  0001 C CNN
F 3 "" H 2700 2550 50  0001 C CNN
	1    2700 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 592B7EFC
P 3400 2550
F 0 "#PWR?" H 3435 2525 10  0001 C CNN
F 1 "GND" H 3370 2525 10  0001 C CNN
F 2 "" H 3400 2550 50  0001 C CNN
F 3 "" H 3400 2550 50  0001 C CNN
	1    3400 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 2550 3400 2500
Connection ~ 3400 2200
Connection ~ 2700 2200
Wire Wire Line
	2700 2500 2700 2550
$Comp
L R R?
U 1 1 592B887A
P 2450 1800
F 0 "R?" H 2450 1880 60  0000 C CNN
F 1 "0R" H 2450 1800 40  0000 C CNN
F 2 "0603_R_N" H 2450 1740 40  0001 C CNN
F 3 "" H 2450 1800 60  0001 C CNN
	1    2450 1800
	1    0    0    -1  
$EndComp
Connection ~ 2700 1800
Wire Wire Line
	1900 1800 2350 1800
Text HLabel 1900 1800 0    60   Input ~ 0
STM_12MHz
$EndSCHEMATC
