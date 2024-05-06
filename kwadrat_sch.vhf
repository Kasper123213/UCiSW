--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : kwadrat_sch.vhf
-- /___/   /\     Timestamp : 04/30/2024 10:31:46
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl C:/Users/lab/Desktop/projekt1uciswv1.2/kwadrat_sch.vhf -w C:/Users/lab/Desktop/projekt1uciswv1.2/kwadrat_sch.sch
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
   port ( btn_north : in    std_logic; 
          clk       : in    std_logic; 
          LED_0     : out   std_logic; 
          VGA_B     : out   std_logic; 
          VGA_G     : out   std_logic; 
          VGA_HSYNC : out   std_logic; 
          VGA_R     : out   std_logic; 
          VGA_VSYNC : out   std_logic; 
          PS2_Clk   : inout std_logic; 
          PS2_Data  : inout std_logic);
end kwadrat_sch;

architecture BEHAVIORAL of kwadrat_sch is
   signal XLXN_10   : std_logic_vector (7 downto 0);
   signal XLXN_11   : std_logic_vector (7 downto 0);
   signal XLXN_12   : std_logic_vector (7 downto 0);
   signal XLXN_13   : std_logic;
   signal XLXN_14   : std_logic_vector (10 downto 0);
   signal XLXN_15   : std_logic_vector (10 downto 0);
   component kwadrat
      port ( clk       : in    std_logic; 
             pos_x     : in    std_logic_vector (10 downto 0); 
             pos_y     : in    std_logic_vector (10 downto 0); 
             vga_r     : out   std_logic; 
             vga_g     : out   std_logic; 
             vga_b     : out   std_logic; 
             vga_hsync : out   std_logic; 
             vga_vsync : out   std_logic);
   end component;
   
   component PS2_Mouse
      port ( PS2_Data  : inout std_logic; 
             PS2_Clk   : inout std_logic; 
             InitOK    : out   std_logic; 
             DataRdy   : out   std_logic; 
             B1_Status : out   std_logic_vector (7 downto 0); 
             B2_X      : out   std_logic_vector (7 downto 0); 
             B3_Y      : out   std_logic_vector (7 downto 0); 
             Clk_50MHz : in    std_logic; 
             Reset     : in    std_logic; 
             Clk_Sys   : in    std_logic);
   end component;
   
   component mysz
      port ( clk       : in    std_logic; 
             DataRdy   : in    std_logic; 
             B1_Status : in    std_logic_vector (7 downto 0); 
             B2_X      : in    std_logic_vector (7 downto 0); 
             B3_Y      : in    std_logic_vector (7 downto 0); 
             pos_x     : out   std_logic_vector (10 downto 0); 
             pos_y     : out   std_logic_vector (10 downto 0));
   end component;
   
begin
   XLXI_1 : kwadrat
      port map (clk=>clk,
                pos_x(10 downto 0)=>XLXN_14(10 downto 0),
                pos_y(10 downto 0)=>XLXN_15(10 downto 0),
                vga_b=>VGA_B,
                vga_g=>VGA_G,
                vga_hsync=>VGA_HSYNC,
                vga_r=>VGA_R,
                vga_vsync=>VGA_VSYNC);
   
   XLXI_2 : PS2_Mouse
      port map (Clk_Sys=>clk,
                Clk_50MHz=>clk,
                Reset=>btn_north,
                B1_Status(7 downto 0)=>XLXN_10(7 downto 0),
                B2_X(7 downto 0)=>XLXN_11(7 downto 0),
                B3_Y(7 downto 0)=>XLXN_12(7 downto 0),
                DataRdy=>XLXN_13,
                InitOK=>LED_0,
                PS2_Clk=>PS2_Clk,
                PS2_Data=>PS2_Data);
   
   XLXI_4 : mysz
      port map (B1_Status(7 downto 0)=>XLXN_10(7 downto 0),
                B2_X(7 downto 0)=>XLXN_11(7 downto 0),
                B3_Y(7 downto 0)=>XLXN_12(7 downto 0),
                clk=>clk,
                DataRdy=>XLXN_13,
                pos_x(10 downto 0)=>XLXN_14(10 downto 0),
                pos_y(10 downto 0)=>XLXN_15(10 downto 0));
   
end BEHAVIORAL;


