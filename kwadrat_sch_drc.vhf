--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : kwadrat_sch_drc.vhf
-- /___/   /\     Timestamp : 04/25/2024 09:14:14
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\14.7\ISE_DS\ISE\bin\nt64\unwrapped\sch2hdl.exe -intstyle ise -family spartan3e -flat -suppress -vhdl kwadrat_sch_drc.vhf -w C:/Users/lab/Desktop/projekt1uciswv1.1/kwadrat_sch.sch
--Design Name: kwadrat_sch
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity kwadrat_sch is
   port ( VGA_B     : out   std_logic; 
          VGA_G     : out   std_logic; 
          VGA_HSYNC : out   std_logic; 
          VGA_R     : out   std_logic; 
          VGA_VSYNC : out   std_logic);
end kwadrat_sch;

architecture BEHAVIORAL of kwadrat_sch is
begin
end BEHAVIORAL;


