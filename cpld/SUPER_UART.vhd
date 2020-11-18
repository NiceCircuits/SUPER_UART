--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : SUPER_UART.vhf
-- /___/   /\     Timestamp : 10/21/2017 20:49:12
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family xc9500xl -flat -suppress -vhdl D:/OneDrive/super_UART/fpga/SUPER_UART.vhf -w D:/OneDrive/super_UART/fpga/SUPER_UART.sch
--Design Name: SUPER_UART
--Device: xc9500xl
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity SUPER_UART is
   port ( FTDI_DTR_A : in    std_logic; 
          FTDI_DTR_B : in    std_logic; 
          FTDI_TXD_A : in    std_logic; 
          FTDI_TXD_B : in    std_logic; 
          FTDI_TXD_C : in    std_logic; 
          FTDI_TXD_D : in    std_logic; 
          N_OE       : in    std_logic; 
          RXD_A      : in    std_logic; 
          RXD_B      : in    std_logic; 
          RXD_C      : in    std_logic; 
          RXD_D      : in    std_logic; 
          RXD_D1     : in    std_logic; 
          SR_CLK     : in    std_logic; 
          SR_DATA    : in    std_logic; 
          SR_LOAD    : in    std_logic; 
          CTS_A_OC   : out   std_logic; 
          CTS_B_OC   : out   std_logic; 
          DTR_A      : out   std_logic; 
          DTR_B      : out   std_logic; 
          FTDI_RXD_C : out   std_logic; 
          FTDI_RXD_D : out   std_logic; 
          N_BUZZER   : out   std_logic; 
          OPTO_EN    : out   std_logic; 
          RXD_A_OC   : out   std_logic; 
          RXD_B_OC   : out   std_logic; 
          TXD_D      : out   std_logic; 
          CTS_A      : inout std_logic; 
          CTS_B      : inout std_logic; 
          FTDI_CTS_A : inout std_logic; 
          FTDI_CTS_B : inout std_logic; 
          FTDI_RTS_A : inout std_logic; 
          FTDI_RTS_B : inout std_logic; 
          FTDI_RXD_A : inout std_logic; 
          FTDI_RXD_B : inout std_logic);
end SUPER_UART;

entity M2_1E_MXILINX_SUPER_UART is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          E  : in    std_logic; 
          S0 : in    std_logic; 
          O  : out   std_logic);
end M2_1E_MXILINX_SUPER_UART;

architecture BEHAVIORAL of M2_1E_MXILINX_SUPER_UART is
   attribute BOX_TYPE   : string ;
   signal M0 : std_logic;
   signal M1 : std_logic;
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
begin
   I_36_30 : AND3
      port map (I0=>D1,
                I1=>E,
                I2=>S0,
                O=>M1);
   
   I_36_31 : AND3B1
      port map (I0=>S0,
                I1=>E,
                I2=>D0,
                O=>M0);
   
   I_36_38 : OR2
      port map (I0=>M1,
                I1=>M0,
                O=>O);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity M2_1_MXILINX_SUPER_UART is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          S0 : in    std_logic; 
          O  : out   std_logic);
end M2_1_MXILINX_SUPER_UART;

architecture BEHAVIORAL of M2_1_MXILINX_SUPER_UART is
   attribute BOX_TYPE   : string ;
   signal M0 : std_logic;
   signal M1 : std_logic;
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
begin
   I_36_7 : AND2B1
      port map (I0=>S0,
                I1=>D0,
                O=>M0);
   
   I_36_8 : OR2
      port map (I0=>M1,
                I1=>M0,
                O=>O);
   
   I_36_9 : AND2
      port map (I0=>D1,
                I1=>S0,
                O=>M1);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity M4_1E_MXILINX_SUPER_UART is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          D2 : in    std_logic; 
          D3 : in    std_logic; 
          E  : in    std_logic; 
          S0 : in    std_logic; 
          S1 : in    std_logic; 
          O  : out   std_logic);
end M4_1E_MXILINX_SUPER_UART;

architecture BEHAVIORAL of M4_1E_MXILINX_SUPER_UART is
   attribute HU_SET     : string ;
   signal M01 : std_logic;
   signal M23 : std_logic;
   component M2_1E_MXILINX_SUPER_UART
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component M2_1_MXILINX_SUPER_UART
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of U1 : label is "U1_2";
   attribute HU_SET of U2 : label is "U2_1";
   attribute HU_SET of U3 : label is "U3_0";
begin
   U1 : M2_1E_MXILINX_SUPER_UART
      port map (D0=>D0,
                D1=>D1,
                E=>E,
                S0=>S0,
                O=>M01);
   
   U2 : M2_1E_MXILINX_SUPER_UART
      port map (D0=>D2,
                D1=>D3,
                E=>E,
                S0=>S0,
                O=>M23);
   
   U3 : M2_1_MXILINX_SUPER_UART
      port map (D0=>M01,
                D1=>M23,
                S0=>S1,
                O=>O);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity OBUFE_MXILINX_SUPER_UART is
   port ( E : in    std_logic; 
          I : in    std_logic; 
          O : out   std_logic);
end OBUFE_MXILINX_SUPER_UART;

architecture BEHAVIORAL of OBUFE_MXILINX_SUPER_UART is
   attribute BOX_TYPE   : string ;
   signal T : std_logic;
   component OBUFT
      port ( I : in    std_logic; 
             T : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of OBUFT : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   I_36_10 : OBUFT
      port map (I=>I,
                T=>T,
                O=>O);
   
   I_36_12 : INV
      port map (I=>E,
                O=>T);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity SR4CE_MXILINX_SUPER_UART is
   port ( C   : in    std_logic; 
          CE  : in    std_logic; 
          CLR : in    std_logic; 
          SLI : in    std_logic; 
          Q0  : out   std_logic; 
          Q1  : out   std_logic; 
          Q2  : out   std_logic; 
          Q3  : out   std_logic);
end SR4CE_MXILINX_SUPER_UART;

architecture BEHAVIORAL of SR4CE_MXILINX_SUPER_UART is
   attribute BOX_TYPE   : string ;
   signal Q0_DUMMY : std_logic;
   signal Q1_DUMMY : std_logic;
   signal Q2_DUMMY : std_logic;
   component FDCE
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCE : component is "BLACK_BOX";
   
begin
   Q0 <= Q0_DUMMY;
   Q1 <= Q1_DUMMY;
   Q2 <= Q2_DUMMY;
   U0 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>SLI,
                Q=>Q0_DUMMY);
   
   U1 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>Q0_DUMMY,
                Q=>Q1_DUMMY);
   
   U2 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>Q1_DUMMY,
                Q=>Q2_DUMMY);
   
   U3 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>Q2_DUMMY,
                Q=>Q3);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity LD4_MXILINX_SUPER_UART is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          D2 : in    std_logic; 
          D3 : in    std_logic; 
          G  : in    std_logic; 
          Q0 : out   std_logic; 
          Q1 : out   std_logic; 
          Q2 : out   std_logic; 
          Q3 : out   std_logic);
end LD4_MXILINX_SUPER_UART;

architecture BEHAVIORAL of LD4_MXILINX_SUPER_UART is
   attribute BOX_TYPE   : string ;
   component LD
      generic( INIT : bit :=  '0');
      port ( D : in    std_logic; 
             G : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of LD : component is "BLACK_BOX";
   
begin
   U0 : LD
      port map (D=>D0,
                G=>G,
                Q=>Q0);
   
   U1 : LD
      port map (D=>D1,
                G=>G,
                Q=>Q1);
   
   U2 : LD
      port map (D=>D2,
                G=>G,
                Q=>Q2);
   
   U3 : LD
      port map (D=>D3,
                G=>G,
                Q=>Q3);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

architecture BEHAVIORAL of SUPER_UART is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   attribute SLEW       : string ;
   signal BUZZER_N_EN_RX : std_logic;
   signal BUZZER_N_EN_TX : std_logic;
   signal I2C_EN_A       : std_logic;
   signal I2C_EN_B       : std_logic;
   signal MPSSE_EN_A     : std_logic;
   signal MPSSE_EN_B     : std_logic;
   signal N_MPSSE_EN_A   : std_logic;
   signal N_MPSSE_EN_B   : std_logic;
   signal RXD_A_INT      : std_logic;
   signal RXD_B_INT      : std_logic;
   signal SPY_EN         : std_logic;
   signal TXD_D_INT      : std_logic;
   signal XLXN_35        : std_logic;
   signal XLXN_46        : std_logic;
   signal XLXN_47        : std_logic;
   signal XLXN_103       : std_logic;
   signal XLXN_124       : std_logic;
   signal XLXN_137       : std_logic;
   signal XLXN_147       : std_logic;
   signal XLXN_149       : std_logic;
   signal XLXN_150       : std_logic;
   signal XLXN_159       : std_logic;
   signal XLXN_160       : std_logic;
   signal XLXN_161       : std_logic;
   signal XLXN_162       : std_logic;
   signal XLXN_168       : std_logic;
   signal XLXN_171       : std_logic;
   signal XLXN_172       : std_logic;
   signal XLXN_230       : std_logic;
   signal XLXN_239       : std_logic;
   signal XLXN_255       : std_logic;
   signal XLXN_269       : std_logic;
   signal XLXN_271       : std_logic;
   signal XLXN_276       : std_logic;
   signal XLXN_284       : std_logic;
   signal XLXN_286       : std_logic;
   signal XLXN_287       : std_logic;
   signal XLXN_288       : std_logic;
   signal XLXN_296       : std_logic;
   signal XLXN_298       : std_logic;
   signal XLXN_303       : std_logic;
   signal XLXN_307       : std_logic;
   signal XLXN_309       : std_logic;
   signal XLXN_312       : std_logic;
   signal XLXN_317       : std_logic;
   signal XLXN_410       : std_logic;
   signal XLXN_412       : std_logic;
   signal XLXN_415       : std_logic;
   signal XLXN_430       : std_logic;
   signal XLXN_460       : std_logic;
   signal XLXN_466       : std_logic;
   signal XLXN_467       : std_logic;
   component IOBUFE
      port ( I  : in    std_logic; 
             IO : inout std_logic; 
             O  : out   std_logic; 
             E  : in    std_logic);
   end component;
   attribute BOX_TYPE of IOBUFE : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component OR2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2B1 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component LD4_MXILINX_SUPER_UART
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             D2 : in    std_logic; 
             D3 : in    std_logic; 
             G  : in    std_logic; 
             Q0 : out   std_logic; 
             Q1 : out   std_logic; 
             Q2 : out   std_logic; 
             Q3 : out   std_logic);
   end component;
   
   component SR4CE_MXILINX_SUPER_UART
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             SLI : in    std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             Q2  : out   std_logic; 
             Q3  : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component OBUFE_MXILINX_SUPER_UART
      port ( E : in    std_logic; 
             I : in    std_logic; 
             O : out   std_logic);
   end component;
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
   component OBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute SLEW of OBUF : component is "SLOW";
   attribute BOX_TYPE of OBUF : component is "BLACK_BOX";
   
   component AND4B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";
   
   component M4_1E_MXILINX_SUPER_UART
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             D2 : in    std_logic; 
             D3 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             S1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component M2_1_MXILINX_SUPER_UART
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component AND2B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_49 : label is "XLXI_49_3";
   attribute HU_SET of XLXI_50 : label is "XLXI_50_4";
   attribute HU_SET of XLXI_53 : label is "XLXI_53_5";
   attribute HU_SET of XLXI_54 : label is "XLXI_54_6";
   attribute HU_SET of XLXI_57 : label is "XLXI_57_7";
   attribute HU_SET of XLXI_95 : label is "XLXI_95_8";
   attribute HU_SET of XLXI_104 : label is "XLXI_104_9";
   attribute HU_SET of XLXI_108 : label is "XLXI_108_10";
   attribute HU_SET of XLXI_116 : label is "XLXI_116_11";
   attribute HU_SET of XLXI_154 : label is "XLXI_154_12";
begin
   XLXI_7 : IOBUFE
      port map (E=>XLXN_230,
                I=>RXD_A_INT,
                O=>XLXN_124,
                IO=>FTDI_RXD_A);
   
   XLXI_12 : INV
      port map (I=>MPSSE_EN_A,
                O=>N_MPSSE_EN_A);
   
   XLXI_13 : IOBUFE
      port map (E=>XLXN_276,
                I=>XLXN_46,
                O=>XLXN_47,
                IO=>FTDI_CTS_A);
   
   XLXI_14 : IOBUFE
      port map (E=>XLXN_35,
                I=>XLXN_124,
                O=>XLXN_46,
                IO=>CTS_A);
   
   XLXI_37 : OR2B1
      port map (I0=>SPY_EN,
                I1=>FTDI_TXD_C,
                O=>XLXN_103);
   
   XLXI_46 : AND2
      port map (I0=>XLXN_137,
                I1=>FTDI_TXD_D,
                O=>XLXN_430);
   
   XLXI_47 : OR2B1
      port map (I0=>SPY_EN,
                I1=>FTDI_TXD_B,
                O=>XLXN_137);
   
   XLXI_49 : LD4_MXILINX_SUPER_UART
      port map (D0=>XLXN_147,
                D1=>XLXN_149,
                D2=>XLXN_150,
                D3=>XLXN_168,
                G=>SR_LOAD,
                Q0=>I2C_EN_A,
                Q1=>MPSSE_EN_A,
                Q2=>I2C_EN_B,
                Q3=>MPSSE_EN_B);
   
   XLXI_50 : SR4CE_MXILINX_SUPER_UART
      port map (C=>SR_CLK,
                CE=>XLXN_172,
                CLR=>XLXN_171,
                SLI=>SR_DATA,
                Q0=>XLXN_147,
                Q1=>XLXN_149,
                Q2=>XLXN_150,
                Q3=>XLXN_168);
   
   XLXI_53 : LD4_MXILINX_SUPER_UART
      port map (D0=>XLXN_159,
                D1=>XLXN_160,
                D2=>XLXN_161,
                D3=>XLXN_162,
                G=>SR_LOAD,
                Q0=>SPY_EN,
                Q1=>OPTO_EN,
                Q2=>BUZZER_N_EN_TX,
                Q3=>BUZZER_N_EN_RX);
   
   XLXI_54 : SR4CE_MXILINX_SUPER_UART
      port map (C=>SR_CLK,
                CE=>XLXN_172,
                CLR=>XLXN_171,
                SLI=>XLXN_168,
                Q0=>XLXN_159,
                Q1=>XLXN_160,
                Q2=>XLXN_161,
                Q3=>XLXN_162);
   
   XLXI_55 : GND
      port map (G=>XLXN_171);
   
   XLXI_56 : VCC
      port map (P=>XLXN_172);
   
   XLXI_57 : OBUFE_MXILINX_SUPER_UART
      port map (E=>XLXN_230,
                I=>RXD_A_INT,
                O=>FTDI_RTS_A);
   
   XLXI_75 : AND2B1
      port map (I0=>N_OE,
                I1=>MPSSE_EN_A,
                O=>XLXN_230);
   
   XLXI_80 : AND3B2
      port map (I0=>N_OE,
                I1=>I2C_EN_A,
                I2=>MPSSE_EN_A,
                O=>XLXN_35);
   
   XLXI_81 : IBUF
      port map (I=>RXD_A,
                O=>RXD_A_INT);
   
   XLXI_82 : OBUF
      port map (I=>XLXN_239,
                O=>RXD_A_OC);
   
   XLXI_83 : AND4B2
      port map (I0=>XLXN_124,
                I1=>N_OE,
                I2=>MPSSE_EN_A,
                I3=>I2C_EN_A,
                O=>XLXN_239);
   
   XLXI_87 : OBUF
      port map (I=>XLXN_255,
                O=>CTS_A_OC);
   
   XLXI_92 : AND4B2
      port map (I0=>FTDI_TXD_A,
                I1=>N_OE,
                I2=>MPSSE_EN_A,
                I3=>I2C_EN_A,
                O=>XLXN_255);
   
   XLXI_95 : M4_1E_MXILINX_SUPER_UART
      port map (D0=>XLXN_47,
                D1=>FTDI_DTR_A,
                D2=>XLXN_269,
                D3=>XLXN_269,
                E=>XLXN_269,
                S0=>N_MPSSE_EN_A,
                S1=>N_OE,
                O=>XLXN_271);
   
   XLXI_96 : OBUF
      port map (I=>XLXN_271,
                O=>DTR_A);
   
   XLXI_97 : VCC
      port map (P=>XLXN_269);
   
   XLXI_100 : IOBUFE
      port map (E=>XLXN_312,
                I=>XLXN_286,
                O=>XLXN_298,
                IO=>FTDI_CTS_B);
   
   XLXI_101 : INV
      port map (I=>MPSSE_EN_B,
                O=>N_MPSSE_EN_B);
   
   XLXI_102 : IOBUFE
      port map (E=>XLXN_288,
                I=>RXD_B_INT,
                O=>XLXN_287,
                IO=>FTDI_RXD_B);
   
   XLXI_103 : AND2B1
      port map (I0=>N_OE,
                I1=>MPSSE_EN_B,
                O=>XLXN_288);
   
   XLXI_104 : OBUFE_MXILINX_SUPER_UART
      port map (E=>XLXN_288,
                I=>RXD_B_INT,
                O=>FTDI_RTS_B);
   
   XLXI_105 : AND4B2
      port map (I0=>XLXN_287,
                I1=>N_OE,
                I2=>MPSSE_EN_B,
                I3=>I2C_EN_B,
                O=>XLXN_296);
   
   XLXI_106 : OBUF
      port map (I=>XLXN_296,
                O=>RXD_B_OC);
   
   XLXI_107 : AND4B2
      port map (I0=>FTDI_TXD_B,
                I1=>N_OE,
                I2=>MPSSE_EN_B,
                I3=>I2C_EN_B,
                O=>XLXN_303);
   
   XLXI_108 : M4_1E_MXILINX_SUPER_UART
      port map (D0=>XLXN_298,
                D1=>FTDI_DTR_B,
                D2=>XLXN_307,
                D3=>XLXN_307,
                E=>XLXN_307,
                S0=>N_MPSSE_EN_B,
                S1=>N_OE,
                O=>XLXN_309);
   
   XLXI_109 : VCC
      port map (P=>XLXN_307);
   
   XLXI_110 : OBUF
      port map (I=>XLXN_309,
                O=>DTR_B);
   
   XLXI_111 : OBUF
      port map (I=>XLXN_303,
                O=>CTS_B_OC);
   
   XLXI_112 : IBUF
      port map (I=>RXD_B,
                O=>XLXN_317);
   
   XLXI_113 : IOBUFE
      port map (E=>XLXN_284,
                I=>XLXN_287,
                O=>XLXN_286,
                IO=>CTS_B);
   
   XLXI_115 : AND3B2
      port map (I0=>N_OE,
                I1=>I2C_EN_B,
                I2=>MPSSE_EN_B,
                O=>XLXN_284);
   
   XLXI_116 : M2_1_MXILINX_SUPER_UART
      port map (D0=>XLXN_317,
                D1=>RXD_D,
                S0=>SPY_EN,
                O=>RXD_B_INT);
   
   XLXI_118 : AND2B2
      port map (I0=>N_OE,
                I1=>MPSSE_EN_B,
                O=>XLXN_312);
   
   XLXI_119 : AND2B2
      port map (I0=>N_OE,
                I1=>MPSSE_EN_A,
                O=>XLXN_276);
   
   XLXI_154 : M4_1E_MXILINX_SUPER_UART
      port map (D0=>RXD_C,
                D1=>TXD_D_INT,
                D2=>XLXN_412,
                D3=>XLXN_412,
                E=>XLXN_412,
                S0=>SPY_EN,
                S1=>N_OE,
                O=>XLXN_410);
   
   XLXI_157 : OBUF
      port map (I=>XLXN_410,
                O=>FTDI_RXD_C);
   
   XLXI_158 : VCC
      port map (P=>XLXN_412);
   
   XLXI_159 : OR2
      port map (I0=>N_OE,
                I1=>XLXN_430,
                O=>TXD_D_INT);
   
   XLXI_160 : OR2
      port map (I0=>XLXN_460,
                I1=>N_OE,
                O=>XLXN_415);
   
   XLXI_162 : OBUF
      port map (I=>XLXN_415,
                O=>FTDI_RXD_D);
   
   XLXI_168 : OBUF
      port map (I=>TXD_D_INT,
                O=>TXD_D);
   
   XLXI_178 : AND3
      port map (I0=>XLXN_103,
                I1=>RXD_D1,
                I2=>RXD_D1,
                O=>XLXN_460);
   
   XLXI_180 : OR2
      port map (I0=>BUZZER_N_EN_RX,
                I1=>RXD_D1,
                O=>XLXN_466);
   
   XLXI_181 : OR2
      port map (I0=>BUZZER_N_EN_TX,
                I1=>FTDI_TXD_D,
                O=>XLXN_467);
   
   XLXI_182 : AND2
      port map (I0=>XLXN_467,
                I1=>XLXN_466,
                O=>N_BUZZER);
   
end BEHAVIORAL;


