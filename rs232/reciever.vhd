
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Receiver IS
	PORT(
		clk_i : in STD_LOGIC;
		RxD : in STD_LOGIC;
		Data : out STD_LOGIC_VECTOR(7 downto 0);
		Data_Ready : out STD_LOGIC;
		LOG : INOUT STD_LOGIC:= '0'
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

signal sync_RxD : STD_LOGIC:= '1';
signal snf_RxD : STD_LOGIC:= '1';
signal msg : STD_LOGIC_VECTOR(9 downto 0):=(others=>'0');
type state is (Init, Waiting, Reciving, Recived);

BEGIN

	syn_rxd : synchronizer
		PORT MAP(clk_i => clk_i, sig_i => RxD, sync_sig_o => sync_RxD);
	
	ftr_rxd : filter
		PORT MAP(clk_i => clk_i, button => sync_RxD, Output => snf_RxD);
		
		
	process(clk_i)
	
	variable counter : integer range 0 to 2*clock_freq/rs232_freq:= 0;
	variable hcounter : integer range 0 to clock_freq/rs232_freq:= 0;
	variable bit_counter : integer range 0 to 10:= 0;
	variable unit_state : state:= Init;
	
	begin
		if rising_edge(clk_i) then
		
		-- Obsluga stanu recivera
			
			if (unit_state /= Reciving and unit_state /= Waiting) and snf_RxD = '0' then
				unit_state:= Waiting;
				counter:= 0;
				hcounter:= 0;
				bit_counter:= 0;
				Data_Ready <= '0';
			elsif unit_state = Recived then
				Data <= msg(8 downto 1);
				Data_Ready <= '1';
			end if;					
		
		--Odbieranie wiadomosci

		if unit_state = Waiting then
			
			if hcounter = (clock_freq/rs232_freq)/2 then
				msg <= snf_RxD & msg(9 downto 1);
				unit_state:= Reciving;
				bit_counter:= 1;
				if snf_RxD = '0' then
					msg <= snf_RxD & msg(9 downto 1);
					LOG <= NOT LOG;
					unit_state:= Reciving;
					bit_counter:= 1;
				else
					unit_state:= Init;
				end if;
				
			elsif hcounter /= (clock_freq/rs232_freq)/2 then
				hcounter:= hcounter +1;
			end if;
		
		elsif unit_state = Reciving then
			if counter = (clock_freq/rs232_freq) then
				msg <= snf_RxD & msg(9 downto 1);
				LOG <= NOT LOG;
				counter := 0;
				bit_counter := bit_counter + 1;
			elsif counter /= (clock_freq/rs232_freq) then
				counter := counter + 1;
			end if;
			
			if bit_counter = 10 then
				unit_state:= Recived;
			end if;
		end if;
			
		end if;
	end process;
	
END Behavioral;
