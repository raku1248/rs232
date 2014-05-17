
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-------------------------------------------------------------------------
-- Component adds additional 32 to the value of sig_i after it 
--gets signal high at Data_ready_i and responds in
-- signalling at Data_ready_o and the increased value at added_sig_o
-------------------------------------------------------------------------

entity adder is
	PORT(
		clk_i : in std_logic;
		Data_ready_i: in std_logic;
		Data_ready_o: out std_logic;
		sig_i : in std_logic_vector(7 downto 0);
		added_sig_o : out std_logic_vector(7 downto 0)
	);
end adder;

architecture Behavioral of adder is

begin

process(clk_i)

	begin
		if rising_edge(clk_i) then
			if Data_ready_i = '1' then
				added_sig_o <= sig_i + 32;
				Data_ready_o<='1';
			elsif Data_ready_i = '0' then
				Data_ready_o<='0';
			end if;
		end if;
		
end process;

end Behavioral;
