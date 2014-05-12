library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity transmitter is
	port(
		Data: in std_logic_vector(7 downto 0);
		clk_i: in std_logic;
		Data_ready: in std_logic;
		TXD_o: out std_logic
	);
end transmitter;

architecture Behavioral of transmitter is

signal temp : std_logic_vector(9 downto 0):=(others=>'1');

constant N: integer:= 5208;
type state is (Waiting, Recieving, Sending);

begin

process(clk_i)

variable unit_state : state:= waiting;
variable counter : integer range 0 to N:=0;
variable bit_counter : integer range 0 to 10;

begin
	if rising_edge(clk_i) then
	
		if unit_state = Waiting then
			TXD_o<='1';
			counter:=0;
			bit_counter:=0;
			if Data_ready = '0' then
				unit_state:= Recieving;
			end if;
			
		elsif unit_state = Recieving then
			if Data_ready = '1' then
				temp(0)<='0';
				temp(8 downto 1)<=Data(7 downto 0);
				temp(9)<='1';
				unit_state:= Sending;
			end if;
		end if;
		
		if unit_state = Sending then
			
			if counter = N then
				counter := 0;
				TXD_o<=temp(bit_counter);
				bit_counter := bit_counter + 1;
			elsif( counter /= N) then
				counter := counter + 1;
			end if;
		end if;
		
		if bit_counter = 10 then
			unit_state:=Waiting;
		end if;
		
	end if;
end process;

end Behavioral;
