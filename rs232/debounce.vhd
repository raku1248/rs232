library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity filter is
	GENERIC(
		counter_size : INTEGER := 8);	-- 8 bits -> 50 Mhz --> 5.12 us lock
	PORT(
		clk_i : IN STD_LOGIC;
		button : IN STD_LOGIC;
		Output : OUT STD_LOGIC:= '1'
		);
end filter;

architecture Behavioral of filter is

signal flipflop : STD_LOGIC_VECTOR(1 downto 0);
signal counter_reset : STD_LOGIC;
signal counter : STD_LOGIC_VECTOR(counter_size downto 0) := (others => '0');
begin

	counter_reset <= flipflop(0) XOR flipflop(1);

	process(clk_i)

	begin
		
		if rising_edge(clk_i) then
			flipflop(0) <= button;
			flipflop(1) <= flipflop(0);
			if counter_reset = '1' then
				counter <= (others => '0');
			elsif counter(counter_size) = '0' then
				counter <= counter + 1;
			else
				Output <= flipflop(1);
			end if;	
		end if;
		
	end process;
	



end Behavioral;

