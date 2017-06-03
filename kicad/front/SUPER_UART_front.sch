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
Sheet 1 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 12000 5500 2650 1600
U 5914893E
F0 "SUPER_UART_front_uC" 60
F1 "SUPER_UART_front_uC.sch" 60
$EndSheet
$Sheet
S 7400 2600 3050 1600
U 59119AE0
F0 "SUPER_UART_front_UART1" 60
F1 "SUPER_UART_front_UART1.sch" 60
F2 "TXD_C_LED" I L 7400 2700 60 
F3 "RXD_C_LED" I L 7400 2800 60 
F4 "DSR_C" O L 7400 2900 60 
F5 "DCD_C" O L 7400 3000 60 
F6 "RXD_C" O L 7400 3100 60 
F7 "TXD_B" I L 7400 3200 60 
F8 "CTS_C" O R 10450 2700 60 
F9 "RI_C" O R 10450 2800 60 
F10 "TXD_C" I R 10450 2900 60 
F11 "DTR_C" I R 10450 3000 60 
F12 "RTS_C" I R 10450 3100 60 
F13 "~SPY_EN" I R 10450 3200 60 
$EndSheet
$Sheet
S 7250 5150 3400 2250
U 5911B250
F0 "SUPER_UART_front_UART234" 60
F1 "SUPER_UART_front_UART234.sch" 60
F2 "TXD_B" I L 7250 5300 60 
$EndSheet
Wire Wire Line
	7250 5300 7050 5300
Wire Wire Line
	7050 5300 7050 3200
Wire Wire Line
	7050 3200 7400 3200
$Comp
L dummy_mech MECH1
U 1 1 592C8391
P 11600 3150
F 0 "MECH1" H 11600 3270 60  0000 C CNN
F 1 "case" H 11600 3150 60  0000 C CNN
F 2 "dummy" H 11600 3060 40  0001 C CNN
F 3 "" H 11600 3150 60  0001 C CNN
	1    11600 3150
	1    0    0    -1  
$EndComp
Text Notes 3500 850  0    100  ~ 0
SPY mode
Text Notes 3400 1350 0    60   ~ 0
RxD D\n\nTxD D
Text Notes 3400 1800 0    60   ~ 0
RxD B\n\nTxD B
Text Notes 3400 2250 0    60   ~ 0
RxD C\n\nTxD C
Text Notes 4150 1400 0    100  ~ 0
&
Text Notes 4800 1100 0    60   ~ 0
RxD D
Text Notes 4800 1400 0    60   ~ 0
TxD D
Text Notes 4150 1150 0    100  ~ 0
&
Text Notes 3350 3250 0    60   ~ 0
RxD D\n\nTxD D
Text Notes 3350 3700 0    60   ~ 0
RxD B\n\nTxD B
Text Notes 3350 4150 0    60   ~ 0
RxD C\n\nTxD C
Text Notes 4750 3250 0    60   ~ 0
RxD D\n\nTxD D
Text Notes 4750 3700 0    60   ~ 0
RxD B\n\nTxD B
Text Notes 4750 4150 0    60   ~ 0
RxD C\n\nTxD C
Text Notes 3500 2800 0    100  ~ 0
normal mode
Text Notes 1200 1150 0    100  ~ 0
SPI mode
Text Notes 1100 1400 0    60   ~ 0
TxD
Text Notes 1100 1600 0    60   ~ 0
RxD
Text Notes 1100 1800 0    60   ~ 0
RTS
Text Notes 1100 2000 0    60   ~ 0
CTS
Text Notes 1100 2200 0    60   ~ 0
DTR
Text Notes 2450 1400 0    60   ~ 0
TxD
Text Notes 2450 1600 0    60   ~ 0
RxD
Text Notes 2450 2000 0    60   ~ 0
CTS
Text Notes 2450 2200 0    60   ~ 0
DTR
Text Notes 2750 1400 0    60   ~ 0
SCK
Text Notes 2750 2200 0    60   ~ 0
CS
Text Notes 2750 1600 0    60   ~ 0
MISO
Text Notes 2750 2000 0    60   ~ 0
MOSI
NoConn ~ 1450 2150
Text Notes 1200 2600 0    100  ~ 0
I2C mode
Text Notes 1100 2850 0    60   ~ 0
TxD
Text Notes 1100 3050 0    60   ~ 0
RxD
Text Notes 1100 3250 0    60   ~ 0
RTS
Text Notes 1100 3450 0    60   ~ 0
CTS
Text Notes 1100 3650 0    60   ~ 0
DTR
Text Notes 2450 2850 0    60   ~ 0
TxD
Text Notes 2450 3050 0    60   ~ 0
RxD
Text Notes 2450 3450 0    60   ~ 0
CTS
Text Notes 2450 3650 0    60   ~ 0
DTR
Text Notes 2750 3650 0    60   ~ 0
WP
Text Notes 2750 3050 0    60   ~ 0
SDA
Text Notes 2750 3450 0    60   ~ 0
SCL
NoConn ~ 1450 3600
NoConn ~ 2300 2800
Text Notes 1200 4050 0    100  ~ 0
UART mode
Text Notes 1100 4300 0    60   ~ 0
TxD
Text Notes 1100 4500 0    60   ~ 0
RxD
Text Notes 1100 4700 0    60   ~ 0
RTS
Text Notes 1100 4900 0    60   ~ 0
CTS
Text Notes 1100 5100 0    60   ~ 0
DTR
Text Notes 2450 4300 0    60   ~ 0
TxD
Text Notes 2450 4500 0    60   ~ 0
RxD
Text Notes 2450 4900 0    60   ~ 0
CTS
Text Notes 2450 5100 0    60   ~ 0
DTR
NoConn ~ 1450 4650
Text Notes 4800 1800 0    60   ~ 0
TxD B
Text Notes 4800 2200 0    60   ~ 0
TxD C
Wire Notes Line
	4650 1750 4600 1725
Wire Notes Line
	4600 1775 4650 1750
Wire Notes Line
	4650 2200 4600 2175
Wire Notes Line
	4600 2225 4650 2200
Connection ~ 4500 2200
Connection ~ 4000 1750
Wire Notes Line
	2150 3000 2200 2975
Wire Notes Line
	2200 3025 2150 3000
Wire Wire Line
	1350 4250 2400 4250
Wire Wire Line
	1350 4450 2400 4450
Wire Wire Line
	1350 4850 2400 4850
Wire Wire Line
	1350 5050 2400 5050
Wire Notes Line
	2250 4850 2300 4825
Wire Notes Line
	2300 4875 2250 4850
Wire Notes Line
	2750 4150 2400 4150
Wire Notes Line
	2750 5150 2750 4150
Wire Notes Line
	2400 5150 2750 5150
Wire Notes Line
	2400 4150 2400 5150
Wire Notes Line
	1000 5150 1350 5150
Wire Notes Line
	1000 4150 1000 5150
Wire Notes Line
	1350 4150 1000 4150
Wire Notes Line
	1350 5150 1350 4150
Wire Wire Line
	1350 4650 1450 4650
Wire Notes Line
	2250 4450 2300 4425
Wire Notes Line
	2300 4475 2250 4450
Wire Notes Line
	2300 5050 2250 5025
Wire Notes Line
	2250 5075 2300 5050
Wire Notes Line
	2300 4250 2250 4225
Wire Notes Line
	2250 4275 2300 4250
Wire Wire Line
	2150 3600 2400 3600
Wire Wire Line
	2150 3750 2150 3600
Wire Wire Line
	1550 3750 2150 3750
Wire Wire Line
	1550 3400 1550 3750
Wire Wire Line
	1350 3400 1550 3400
Wire Wire Line
	1900 3200 1950 3200
Wire Wire Line
	1700 3000 1900 3200
Wire Wire Line
	1350 3000 1700 3000
Connection ~ 2050 3000
Wire Wire Line
	1700 3200 1350 3200
Wire Wire Line
	1900 3000 1700 3200
Wire Wire Line
	2050 3000 2050 3050
Wire Wire Line
	1900 3000 2400 3000
Wire Wire Line
	1650 3600 1950 3600
Wire Wire Line
	1650 2800 1650 3600
Wire Wire Line
	1350 2800 1650 2800
Wire Wire Line
	2050 3400 2050 3450
Wire Wire Line
	2400 3400 2050 3400
Wire Notes Line
	2050 3200 2050 3250
Wire Notes Line
	2050 3100 2050 3050
Wire Notes Line
	1950 3050 1950 3250
Wire Notes Line
	2000 3050 2000 3250
Wire Notes Line
	2000 3200 2050 3200
Wire Notes Line
	2000 3100 2050 3100
Wire Notes Line
	2050 3600 2050 3650
Wire Notes Line
	2050 3500 2050 3450
Wire Notes Line
	1950 3450 1950 3650
Wire Notes Line
	2000 3450 2000 3650
Wire Notes Line
	2000 3600 2050 3600
Wire Notes Line
	2000 3500 2050 3500
Wire Notes Line
	2300 3000 2250 2975
Wire Notes Line
	2250 3025 2300 3000
Wire Wire Line
	2400 2800 2300 2800
Wire Notes Line
	3050 2700 2400 2700
Wire Notes Line
	3050 3700 3050 2700
Wire Notes Line
	2400 3700 3050 3700
Wire Notes Line
	2400 2700 2400 3700
Wire Notes Line
	1000 3700 1350 3700
Wire Notes Line
	1000 2700 1000 3700
Wire Notes Line
	1350 2700 1000 2700
Wire Notes Line
	1350 3700 1350 2700
Wire Wire Line
	1350 3600 1450 3600
Wire Notes Line
	2300 3400 2250 3375
Wire Notes Line
	2250 3425 2300 3400
Wire Notes Line
	2300 3600 2250 3575
Wire Notes Line
	2250 3625 2300 3600
Wire Notes Line
	3050 1250 2400 1250
Wire Notes Line
	3050 2250 3050 1250
Wire Notes Line
	2400 2250 3050 2250
Wire Notes Line
	2400 1250 2400 2250
Wire Notes Line
	1000 2250 1350 2250
Wire Notes Line
	1000 1250 1000 2250
Wire Notes Line
	1350 1250 1000 1250
Wire Notes Line
	1350 2250 1350 1250
Wire Wire Line
	1350 2150 1450 2150
Wire Wire Line
	1750 1950 1350 1950
Wire Wire Line
	1950 2150 1750 1950
Wire Wire Line
	1950 2150 2400 2150
Wire Notes Line
	2250 1550 2300 1525
Wire Notes Line
	2300 1575 2250 1550
Wire Wire Line
	2200 1550 2400 1550
Wire Wire Line
	2000 1750 2200 1550
Wire Wire Line
	1350 1750 2000 1750
Wire Notes Line
	2300 1950 2250 1925
Wire Notes Line
	2250 1975 2300 1950
Wire Notes Line
	2300 2150 2250 2125
Wire Notes Line
	2250 2175 2300 2150
Wire Wire Line
	1950 1950 2400 1950
Wire Wire Line
	1550 1550 1950 1950
Wire Wire Line
	1350 1550 1550 1550
Wire Wire Line
	1350 1350 2400 1350
Wire Notes Line
	2300 1350 2250 1325
Wire Notes Line
	2250 1375 2300 1350
Wire Wire Line
	3650 4100 4700 4100
Wire Wire Line
	3650 3900 4700 3900
Wire Notes Line
	4550 3900 4600 3875
Wire Notes Line
	4600 3925 4550 3900
Wire Notes Line
	4600 4100 4550 4075
Wire Notes Line
	4550 4125 4600 4100
Wire Wire Line
	3650 3700 4700 3700
Wire Wire Line
	3650 3500 4700 3500
Wire Notes Line
	4550 3500 4600 3475
Wire Notes Line
	4600 3525 4550 3500
Wire Notes Line
	4600 3700 4550 3675
Wire Notes Line
	4550 3725 4600 3700
Wire Wire Line
	3650 3200 4700 3200
Wire Wire Line
	3650 3000 4700 3000
Wire Notes Line
	4700 4200 4700 3850
Wire Notes Line
	5050 4200 4700 4200
Wire Notes Line
	5050 3850 5050 4200
Wire Notes Line
	4700 3850 5050 3850
Wire Notes Line
	4700 3750 4700 3400
Wire Notes Line
	5050 3750 4700 3750
Wire Notes Line
	5050 3400 5050 3750
Wire Notes Line
	4700 3400 5050 3400
Wire Notes Line
	4700 3300 4700 2950
Wire Notes Line
	5050 3300 4700 3300
Wire Notes Line
	5050 2950 5050 3300
Wire Notes Line
	4700 2950 5050 2950
Wire Notes Line
	4550 3000 4600 2975
Wire Notes Line
	4600 3025 4550 3000
Wire Notes Line
	4600 3200 4550 3175
Wire Notes Line
	4550 3225 4600 3200
Wire Notes Line
	3300 4200 3300 3850
Wire Notes Line
	3650 4200 3300 4200
Wire Notes Line
	3650 3850 3650 4200
Wire Notes Line
	3300 3850 3650 3850
Wire Notes Line
	3300 3750 3300 3400
Wire Notes Line
	3650 3750 3300 3750
Wire Notes Line
	3650 3400 3650 3750
Wire Notes Line
	3300 3400 3650 3400
Wire Notes Line
	3300 3300 3300 2950
Wire Notes Line
	3650 3300 3300 3300
Wire Notes Line
	3650 2950 3650 3300
Wire Notes Line
	3300 2950 3650 2950
Wire Wire Line
	4500 1150 4500 2200
Wire Wire Line
	4300 1150 4500 1150
Wire Wire Line
	3700 1100 4100 1100
Wire Wire Line
	4750 1050 4300 1050
Wire Notes Line
	4300 1000 4100 1000
Wire Notes Line
	4300 1200 4300 1000
Wire Notes Line
	4100 1200 4300 1200
Wire Notes Line
	4100 1000 4100 1200
Wire Notes Line
	4600 1050 4650 1025
Wire Notes Line
	4650 1075 4600 1050
Wire Notes Line
	4650 1350 4600 1325
Wire Notes Line
	4600 1375 4650 1350
Wire Wire Line
	3700 2200 4750 2200
Connection ~ 4400 1350
Wire Wire Line
	4400 2000 4400 1350
Wire Wire Line
	3700 2000 4400 2000
Wire Wire Line
	4000 1400 4100 1400
Wire Wire Line
	4000 1750 4000 1400
Wire Wire Line
	3700 1750 4750 1750
Wire Wire Line
	4300 1350 4750 1350
Connection ~ 3900 1100
Wire Wire Line
	3900 1550 3900 1100
Wire Wire Line
	3700 1550 3900 1550
Wire Wire Line
	3700 1300 4100 1300
Wire Notes Line
	4300 1250 4100 1250
Wire Notes Line
	4300 1450 4300 1250
Wire Notes Line
	4100 1450 4300 1450
Wire Notes Line
	4100 1250 4100 1450
Wire Notes Line
	3350 2300 3350 1950
Wire Notes Line
	3700 2300 3350 2300
Wire Notes Line
	3700 1950 3700 2300
Wire Notes Line
	3350 1950 3700 1950
Wire Notes Line
	3350 1850 3350 1500
Wire Notes Line
	3700 1850 3350 1850
Wire Notes Line
	3700 1500 3700 1850
Wire Notes Line
	3350 1500 3700 1500
Wire Notes Line
	3350 1400 3350 1050
Wire Notes Line
	3700 1400 3350 1400
Wire Notes Line
	3700 1050 3700 1400
Wire Notes Line
	3350 1050 3700 1050
Text Notes 1800 6700 0    60   ~ 0
FTDI PIN\n\nRxD\nTxD\nCTS\nRTS
Text Notes 2350 6700 0    60   ~ 0
Function\n\nMOSI\nSCK\nCS\nMISO
Text Notes 2850 6700 0    60   ~ 0
Opto channel\n\nDTR\nTxD\nRTS\nCTS
Text Notes 3600 6700 0    60   ~ 0
Output pin\n\nRxD\nTxD\nRTS\nCTS
Text Notes 1800 6050 0    100  ~ 0
SPI connections
Text Notes 1800 7750 0    60   ~ 0
FTDI PIN\n\nRxD\nTxD\nRTS
Text Notes 2350 7750 0    60   ~ 0
Function\n\nSDA_OUT\nSCL\nSDA_IN
Text Notes 2850 7750 0    60   ~ 0
Opto channel\n\nDTR\nTxD\nCTS
Text Notes 3600 7750 0    60   ~ 0
Output pin\n\nCTS\nTxD\nCTS
Text Notes 1800 7200 0    100  ~ 0
I2C connections
Wire Notes Line
	4100 7450 1800 7450
Wire Notes Line
	3550 7300 3550 7750
Wire Notes Line
	2800 7300 2800 7750
Wire Notes Line
	2250 7300 2250 7750
Wire Notes Line
	4100 6300 1800 6300
Wire Notes Line
	3550 6150 3550 6700
Wire Notes Line
	2800 6150 2800 6700
Wire Notes Line
	2250 6150 2250 6700
$Sheet
S 12050 2600 3000 1800
U 5933A622
F0 "SUPER_UART_front_RS232" 56
F1 "SUPER_UART_front_RS232.sch" 56
$EndSheet
$EndSCHEMATC
