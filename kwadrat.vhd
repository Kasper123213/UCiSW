library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


library UNISIM;
use UNISIM.VComponents.all;

entity kwadrat is
	Port ( --ball_x : in STD_LOGIC;
		--ball_y : in STD_LOGIC;
		--ball_radius : in STD_LOGIC;
		--ball_r : in STD_LOGIC;
		--ball_g : in STD_LOGIC;
		--ball_b : in STD_LOGIC;
		
		--racket_w : in STD_LOGIC;
		--racket_h : in STD_LOGIC;
		--racket_x_pos: in STD_LOGIC;
		--racket_y_pos : in STD_LOGIC;
		
		clk : in STD_LOGIC;
		pos_x : in std_logic_vector(10 downto 0);
		pos_y : in std_logic_vector(10 downto 0);
		
		vga_r : out STD_LOGIC;
		vga_g : out STD_LOGIC;
		vga_b : out STD_LOGIC;
		vga_hsync : out STD_LOGIC;
		vga_vsync : out STD_LOGIC
		);
end kwadrat;

architecture Behavioral of kwadrat is

    constant H_SYNC_CYCLES : integer := 120;
    constant H_BACK_PORCH : integer := 64;
    constant H_ACTIVE : integer := 800;
    constant H_FRONT_PORCH : integer := 56;
    constant V_SYNC_LINES : integer := 6;
    constant V_BACK_PORCH : integer := 23;
    constant V_ACTIVE : integer := 600;
    constant V_FRONT_PORCH : integer := 37;
	 	 
	 constant c_width : integer := 20;	 
	 constant c_height : integer := 20;
	 
	 signal c_pos_x : signed(10 downto 0) := signed(pos_x);
	 signal c_pos_y : signed(10 downto 0) := signed(pos_y);
    
    signal h_counter : integer range 0 to 1040 := 0;
    signal v_counter : integer range 0 to 666 := 0;
    signal h_sync : STD_LOGIC := '0';
    signal v_sync : STD_LOGIC := '0';

begin

	 c_pos_x <= signed(pos_x);
	 c_pos_y <= signed(pos_y);

process(clk)
    begin
        if rising_edge(clk) then
            if h_counter = 1039 then
                h_counter <= 0;
                if v_counter = 665 then
                    v_counter <= 0;
                else
                    v_counter <= v_counter + 1;
                end if;
            else
                h_counter <= h_counter + 1;
            end if;
        end if;
 end process;

    vga_hsync <= h_sync;
    vga_vsync <= v_sync;

    process(h_counter, v_counter)
    begin
        if v_counter < 0 or v_counter >= V_FRONT_PORCH + V_ACTIVE + V_BACK_PORCH then
            v_sync <= '0'; 
        else
            v_sync <= '1'; 
            if h_counter < 0 or h_counter >= H_FRONT_PORCH + H_ACTIVE + H_BACK_PORCH then
                h_sync <= '0';
            else
                h_sync <= '1';
            end if;
        end if;
		  
        if v_counter > V_ACTIVE or v_counter < V_BACK_PORCH or h_counter > H_ACTIVE or h_counter < H_BACK_PORCH then
		      vga_r <= '0';
            vga_g <= '0';
            vga_b <= '0';

			
        
				elsif v_counter > c_pos_y and v_counter < c_height + c_pos_y and h_counter > c_pos_x  and h_counter < c_width + c_pos_x then
 
						vga_r <='1'; 
						vga_g <='1'; 
						vga_b <='1'; 
				else

						vga_r <= '1';
						vga_g <= '0';
						vga_b <= '0';
				end if;
			
    end process;


end Behavioral;

