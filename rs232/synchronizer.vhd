
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity synchronizer is
	PORT(
		clk_i : IN STD_LOGIC;
		sig_i : IN STD_LOGIC;
		sync_sig_o : OUT STD_LOGIC
		);
end synchronizer;

architecture Behavioral of synchronizer is

begin

process(clk_i)

	begin
		if rising_edge(clk_i) then
			sync_sig_o <= sig_i;
		end if;
		
end process;

end Behavioral;

