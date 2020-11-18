-- Vhdl test bench created from schematic D:\OneDrive\super_UART\cpld\SUPER_UART.sch - Wed Nov 01 21:02:19 2017
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY SUPER_UART_SUPER_UART_sch_tb IS
END SUPER_UART_SUPER_UART_sch_tb;
ARCHITECTURE behavioral OF SUPER_UART_SUPER_UART_sch_tb IS 

   COMPONENT SUPER_UART
   PORT( FTDI_RTS_A	:	INOUT	STD_LOGIC; 
          FTDI_CTS_A	:	INOUT	STD_LOGIC; 
          FTDI_DTR_A	:	IN	STD_LOGIC; 
          FTDI_TXD_B	:	IN	STD_LOGIC; 
          TXD_C	:	IN	STD_LOGIC; 
          RXD_D	:	IN	STD_LOGIC; 
          SR_DATA	:	IN	STD_LOGIC; 
          CPLD_OE	:	IN	STD_LOGIC; 
          SR_CLK	:	IN	STD_LOGIC; 
          FTDI_RXD_A	:	INOUT	STD_LOGIC; 
          CTS_A	:	INOUT	STD_LOGIC; 
          RXD_A	:	IN	STD_LOGIC; 
          RXD_A_OC	:	OUT	STD_LOGIC; 
          CTS_A_OC	:	OUT	STD_LOGIC; 
          DTR_A	:	OUT	STD_LOGIC; 
          FTDI_CTS_B	:	INOUT	STD_LOGIC; 
          FTDI_DTR_B	:	IN	STD_LOGIC; 
          FTDI_RXD_B	:	INOUT	STD_LOGIC; 
          CTS_B	:	INOUT	STD_LOGIC; 
          FTDI_RTS_B	:	INOUT	STD_LOGIC; 
          RXD_B_OC	:	OUT	STD_LOGIC; 
          CTS_B_OC	:	OUT	STD_LOGIC; 
          DTR_B	:	OUT	STD_LOGIC; 
          RXD_B	:	IN	STD_LOGIC; 
          RXD_C	:	IN	STD_LOGIC; 
          FTDI_RXD_C	:	OUT	STD_LOGIC; 
          FTDI_TXD_D	:	IN	STD_LOGIC; 
          FTDI_RXD_D	:	OUT	STD_LOGIC; 
          TXD_D	:	OUT	STD_LOGIC; 
          SR_LOAD	:	IN	STD_LOGIC; 
          RXD_D1	:	IN	STD_LOGIC; 
          OPTO_EN	:	OUT	STD_LOGIC; 
          BUZZER	:	OUT	STD_LOGIC; 
          FTDI_TXD_A	:	IN	STD_LOGIC; 
          TXD_A	:	OUT	STD_LOGIC; 
          TXD_B	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL FTDI_RTS_A	:	STD_LOGIC;
   SIGNAL FTDI_CTS_A	:	STD_LOGIC;
   SIGNAL FTDI_DTR_A	:	STD_LOGIC;
   SIGNAL FTDI_TXD_B	:	STD_LOGIC;
   SIGNAL TXD_C	:	STD_LOGIC;
   SIGNAL RXD_D	:	STD_LOGIC;
   SIGNAL SR_DATA	:	STD_LOGIC;
   SIGNAL CPLD_OE	:	STD_LOGIC;
   SIGNAL SR_CLK	:	STD_LOGIC;
   SIGNAL FTDI_RXD_A	:	STD_LOGIC;
   SIGNAL CTS_A	:	STD_LOGIC;
   SIGNAL RXD_A	:	STD_LOGIC;
   SIGNAL RXD_A_OC	:	STD_LOGIC;
   SIGNAL CTS_A_OC	:	STD_LOGIC;
   SIGNAL DTR_A	:	STD_LOGIC;
   SIGNAL FTDI_CTS_B	:	STD_LOGIC;
   SIGNAL FTDI_DTR_B	:	STD_LOGIC;
   SIGNAL FTDI_RXD_B	:	STD_LOGIC;
   SIGNAL CTS_B	:	STD_LOGIC;
   SIGNAL FTDI_RTS_B	:	STD_LOGIC;
   SIGNAL RXD_B_OC	:	STD_LOGIC;
   SIGNAL CTS_B_OC	:	STD_LOGIC;
   SIGNAL DTR_B	:	STD_LOGIC;
   SIGNAL RXD_B	:	STD_LOGIC;
   SIGNAL RXD_C	:	STD_LOGIC;
   SIGNAL FTDI_RXD_C	:	STD_LOGIC;
   SIGNAL FTDI_TXD_D	:	STD_LOGIC;
   SIGNAL FTDI_RXD_D	:	STD_LOGIC;
   SIGNAL TXD_D	:	STD_LOGIC;
   SIGNAL SR_LOAD	:	STD_LOGIC;
   SIGNAL RXD_D1	:	STD_LOGIC;
   SIGNAL OPTO_EN	:	STD_LOGIC;
   SIGNAL BUZZER	:	STD_LOGIC;
   SIGNAL FTDI_TXD_A	:	STD_LOGIC;
   SIGNAL TXD_A	:	STD_LOGIC;
   SIGNAL TXD_B	:	STD_LOGIC;

BEGIN

   UUT: SUPER_UART PORT MAP(
		FTDI_RTS_A => FTDI_RTS_A, 
		FTDI_CTS_A => FTDI_CTS_A, 
		FTDI_DTR_A => FTDI_DTR_A, 
		FTDI_TXD_B => FTDI_TXD_B, 
		TXD_C => TXD_C, 
		RXD_D => RXD_D, 
		SR_DATA => SR_DATA, 
		CPLD_OE => CPLD_OE, 
		SR_CLK => SR_CLK, 
		FTDI_RXD_A => FTDI_RXD_A, 
		CTS_A => CTS_A, 
		RXD_A => RXD_A, 
		RXD_A_OC => RXD_A_OC, 
		CTS_A_OC => CTS_A_OC, 
		DTR_A => DTR_A, 
		FTDI_CTS_B => FTDI_CTS_B, 
		FTDI_DTR_B => FTDI_DTR_B, 
		FTDI_RXD_B => FTDI_RXD_B, 
		CTS_B => CTS_B, 
		FTDI_RTS_B => FTDI_RTS_B, 
		RXD_B_OC => RXD_B_OC, 
		CTS_B_OC => CTS_B_OC, 
		DTR_B => DTR_B, 
		RXD_B => RXD_B, 
		RXD_C => RXD_C, 
		FTDI_RXD_C => FTDI_RXD_C, 
		FTDI_TXD_D => FTDI_TXD_D, 
		FTDI_RXD_D => FTDI_RXD_D, 
		TXD_D => TXD_D, 
		SR_LOAD => SR_LOAD, 
		RXD_D1 => RXD_D1, 
		OPTO_EN => OPTO_EN, 
		BUZZER => BUZZER, 
		FTDI_TXD_A => FTDI_TXD_A, 
		TXD_A => TXD_A, 
		TXD_B => TXD_B
   );

-- *** Test Bench - User Defined Section ***
	FTDI_RTS_A <= '1';
	FTDI_RTS_B <= '1';
	FTDI_TXD_A <= '1';
	FTDI_TXD_B <= '1';
	TXD_C <= '1';
	FTDI_TXD_D <= '1';
	RXD_A <= '1', '0' after 1us, '1' after 2us;
	RXD_B <= '1';
	RXD_C <= '1';
	RXD_D1 <= '1', '0' after 1us, '1' after 2us;
	SR_DATA <= '0';
	CPLD_OE <= '0';
	SR_CLK <= '0';
	SR_LOAD <= '0';
   tb : PROCESS
   BEGIN
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
