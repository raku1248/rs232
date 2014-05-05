
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Receiver IS
	PORT(
		clk_i : in STD_LOGIC;
		RxD : in STD_LOGIC;
		Data : out STD_LOGIC_VECTOR(7 downto 0);
		Data_Ready : out STD_LOGIC
		);
END Receiver;

ARCHITECTURE Behavioral OF Receiver IS

COMPONENT synchronizer IS
	PORT(
		clk_i : IN STD_LOGIC;
		sig_i : IN STD_LOGIC;
		sync_sig_o : OUT STD_LOGIC
		);
END COMPONENT;

COMPONENT filter IS
	PORT(
		clk_i : IN STD_LOGIC;
		button : IN STD_LOGIC;
		Output : OUT STD_LOGIC:= '0'
		);
END COMPONENT;

--------------------------------------------------

constant clock_freq : integer := 50_000_000;	--in Hz
constant rs232_freq : integer := 9_600;		--in Hz

signal sync_RxD : STD_LOGIC:= '0';
signal snf_RxD : STD_LOGIC:= '0';

BEGIN

	sync_rxd : synchronizer
		PORT MAP(clk_i => clk_i, sig_i => RxD, sync_sig_o => sync_RxD);
	
	ftr_rxd : filter
		PORT MAP(clk_i => clk_i, button => sync_RxD, Output => snf_RxD);
		
		
	process(clk_i)
	
	variable counter : integer range 0 to clock_freq/keyboard_freq:= '0';
	
	begin
		if rising_edge(clk_i) then
			
			if counter = 33 then		--	<==== eror
				counter := 0;
			elsif( counter /= clock_freq/rs232_freq) then
				counter := counter + 1;
			end if;
			
			if(counter = clock_freq/rs232_freq) then
				Data_Ready <= '1';
				-- 																		<===== przekazanie slowa
			else
				Data_Ready <= '0';
			end if;
		end if;
	end process;
	
END Behavioral;

