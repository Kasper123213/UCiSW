library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


library UNISIM;
use UNISIM.VComponents.all;

entity kwadrat is
	Port (
		clk : in STD_LOGIC;
		pos_x : in std_logic_vector(10 downto 0);
		pos_y : in std_logic_vector(10 downto 0);
		
		vga_r : out STD_LOGIC;
		vga_g : out STD_LOGIC;
		vga_b : out STD_LOGIC;
		vga_hsync : out STD_LOGIC;
		vga_vsync : out STD_LOGIC;
		
		mReset : out STD_LOGIC
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
	 	 
	 constant c_width : integer := 10;	 
	 constant c_height : integer := 10;
	 
	 signal c_pos_x : signed(10 downto 0) := signed(pos_x);
	 signal c_pos_y : signed(10 downto 0) := signed(pos_y);
    
    signal h_counter : integer range 0 to 1040 := 0;
    signal v_counter : integer range 0 to 666 := 0;
    signal h_sync : STD_LOGIC := '0';
    signal v_sync : STD_LOGIC := '0';
	 
	 signal p_width : integer := 40;
	 signal p1_v : integer := 3;
	 signal p1_height : integer := 80;
	 signal p1_x : integer := 200;
	 signal p1_y : integer := 300;
	 signal p2_v : integer := 4;
	 signal p2_height : integer := 80;
	 signal p2_x : integer := 400;
	 signal p2_y : integer := 300;
	 signal p3_v : integer := 5;
	 signal p3_height : integer := 80;
	 signal p3_x : integer := 600;
	 signal p3_y : integer := 300;
	 
	 signal ifReset : STD_LOGIC := '0';
	 signal win : STD_LOGIC := '0';
	 
	 signal lvl : integer := 0;

begin
	mReset<=ifReset;
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
		  
        if v_counter > V_ACTIVE or v_counter < V_BACK_PORCH or h_counter > H_ACTIVE or h_counter < H_BACK_PORCH then -- czarny
		    vga_r <= '0';
            vga_g <= '0';
            vga_b <= '0';

				elsif v_counter > 560 and v_counter < 580 and h_counter > 770  and h_counter < 790 then -- punkt zwyciestwa
						vga_r <='0'; 
						vga_g <='1'; 
						vga_b <='0'; 
						
				elsif v_counter > p1_y - p1_height and v_counter < p1_y + p1_height and h_counter > p1_x - p_width  and h_counter < p1_x + p_width then -- przeszkoda 1
						vga_r <='0'; 
						vga_g <='0'; 
						vga_b <='1'; 
				elsif v_counter > p2_y - p2_height and v_counter < p2_y + p2_height and h_counter > p2_x - p_width  and h_counter < p2_x + p_width then -- przeszkoda 2
						vga_r <='0'; 
						vga_g <='0'; 
						vga_b <='1'; 
				elsif v_counter > p3_y - p3_height and v_counter < p3_y + p3_height and h_counter > p3_x - p_width  and h_counter < p3_x + p_width then -- przeszkoda 3
						vga_r <='0'; 
						vga_g <='0'; 
						vga_b <='1'; 						
				elsif v_counter > c_pos_y - c_height and v_counter < c_height + c_pos_y and h_counter > c_pos_x - c_width  and h_counter < c_width + c_pos_x then -- mysz
						vga_r <='1'; 
						vga_g <='1'; 
						vga_b <='1'; 
				else ----------------------------------------------------------------------------------------------------------------------------- tlo
						if lvl=0 then
							vga_r <= '0';
							vga_g <= '1';
							vga_b <= '1';
						elsif lvl=1 then
							vga_r <= '1';
							vga_g <= '1';
							vga_b <= '0';
						elsif lvl=2 then
							vga_r <= '1';
							vga_g <= '0';
							vga_b <= '1';
						else
							vga_r <= '1';
							vga_g <= '0';
							vga_b <= '0';
						
						end if;
				end if;
				

    end process;

	process(clk, h_counter, v_counter)
	begin
		if rising_edge(clk) then
			if h_counter = 800 and v_counter  = 600 then
				p1_height <= p1_height + p1_v;
				p2_height <= p2_height + p2_v;	
				p3_height <= p3_height + p3_v;						
			end if;
			
			if p1_height > 300 then
				p1_v <= p1_v * (-1);
				p1_height <= 300;
			end if;				
			if p2_height > 300 then				
				p2_v <= p2_v * (-1);
				p2_height <= 300;
			end if;				
			if p3_height > 300 then				
				p3_v <= p3_v * (-1);
				p3_height <= 300;
			end if;				
			if p1_height < 80 then
				p1_v <= p1_v * (-1);
				p1_height <= 80;
			end if;				
			if p2_height < 80 then				
				p2_v <= p2_v * (-1);
				p2_height <= 80;
			end if;				
			if p3_height < 80 then				
				p3_v <= p3_v * (-1);
				p3_height <= 80;
			end if;	

			if c_pos_x+10 >= p1_x-40 and c_pos_x-10 <= p1_x+40 then
				if c_pos_y+10 >= p1_y-p1_height and c_pos_y-10 <= p1_y+p1_height then
					ifReset <= '1';
				end if;
				
			elsif c_pos_x+10 >= p2_x-40 and c_pos_x-10 <= p2_x+40 then
				if c_pos_y+10 >= p2_y-p2_height and c_pos_y-10 <= p2_y+p2_height then
					ifReset <= '1';
				end if;
			elsif c_pos_x+10 >= p3_x-40 and c_pos_x-10 <= p3_x+40 then
				if c_pos_y+10 >= p3_y-p3_height and c_pos_y-10 <= p3_y+p3_height then
					ifReset <= '1';
				end if;
			elsif c_pos_x+10 >= 770 and c_pos_x-10 <= 790 then	--wygrana
				if c_pos_y+10 >= 560 and c_pos_y-10 <= 580 then
					ifReset <= '1';		
					win <= '1';
				end if;
			else 
				if win = '1' then
					if lvl = 3 then
						lvl<=0;
					else
						lvl <= lvl+1;
					end if;
					p1_height <= 80;
					p1_v <= abs(p1_v) + 1;
										
					p2_height <= 80;
					p2_v <= abs(p2_v) + 1;
					
					p3_height <= 80;
					p3_v <= abs(p3_v) + 1;
					win <= '0';
				end if;
				ifReset <= '0';
			end if;
			
		end if;
			

	end process;
	
	--process(clk, c_pos_x, c_pos_y, p1_height, p2_height, p3_height) --reset pozycji po zderzeniu z przeszkodą
	--begin
	--	if rising_edge(clk) then

	--end process;
	
	
	
	
	--process(clk, c_pos_x, c_pos_y)
    --begin
	--	if rising_edge(clk) then
	--		if c_pos_x+10 >= 770 and c_pos_x-10 <= 790 then
	--			if c_pos_y+10 >= 560 and c_pos_y-10 <= 580 then
	--				ifReset <= '1';
	--			
	--			end if;
	--		--else
				
	--	end if;
	--end process;
	

	--ifReset<='0';
end Behavioral;

