--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:14:39 04/11/2024
-- Design Name:   
-- Module Name:   C:/Users/lab/Desktop/projekt1ucisw/kwadrat_test.vhd
-- Project Name:  projekt1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: kwadrat
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY kwadrat_test IS
END kwadrat_test;
 
ARCHITECTURE behavior OF kwadrat_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT kwadrat
    PORT(
         clk : IN  std_logic;
         vga_r : OUT  std_logic;
         vga_g : OUT  std_logic;
         vga_b : OUT  std_logic;
         vga_hsync : OUT  std_logic;
         vga_vsync : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';

 	--Outputs
   signal vga_r : std_logic;
   signal vga_g : std_logic;
   signal vga_b : std_logic;
   signal vga_hsync : std_logic;
   signal vga_vsync : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: kwadrat PORT MAP (
          clk => clk,
          vga_r => vga_r,
          vga_g => vga_g,
          vga_b => vga_b,
          vga_hsync => vga_hsync,
          vga_vsync => vga_vsync
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
