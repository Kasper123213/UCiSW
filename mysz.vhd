----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:27:46 04/25/2024 
-- Design Name: 
-- Module Name:    mysz - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mysz is
	Port (
		clk : in STD_LOGIC;
		pos_x : out std_logic_vector(10 downto 0);
		pos_y : out std_logic_vector(10 downto 0);
		
		
		B1_Status : in std_logic_vector(7 downto 0);
		B2_X : in std_logic_vector(7 downto 0);
		B3_Y: in std_logic_vector(7 downto 0);
		DataRdy : in STD_logic;
		
		mReset : in STD_LOGIC
		);
end mysz;

architecture Behavioral of mysz is
	
	signal status : signed(7 downto 0) := signed(B1_Status);
	signal dx : signed(7 downto 0) := signed(B2_X);
	signal dy : signed(7 downto 0) := signed(B3_Y);
	signal x : signed(10 downto 0);
	signal y : signed(10 downto 0);
	signal x_c : signed(10 downto 0) := "00000011110";
	signal y_c : signed(10 downto 0) := "00100011110";


begin

	dx <= signed(B2_X);
	dy <= signed(B3_y);
	

	
	
process(clk, DataRdy, B1_Status, B2_X, B3_Y)
    begin
	 if rising_edge(clk) and DataRdy = '1' then		
	 if mReset='1' or x_c > 780 or x_c < 60 or y_c > 580 or y_c < 20 then
		x_c <= "00000011110";
		y_c <= "00100011110";
	else 
		x_c <= x_c + dx;
		y_c <= y_c - dy;
	 end if;
	--if x_c > 780 then
	--		x_c <= "01100001100";
	--elsif x_c < 60 then
	--		x_c <= "00000111100";
	--	else 
	--		x_c <= x_c + dx;
	--	end if;
	--if y_c > 580 then
	--		y_c <= "01001000100";
	--elsif y_c < 20 then
	--		y_c <= "00000010100";
	--	else 
	--		y_c <= y_c - dy;
	--	end if;	 end if;
			
 end process;
 
 
 
		pos_x <= std_logic_vector(x_c);
		pos_y <= std_logic_vector(y_c);
end Behavioral;

