library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RS232_MODULE is
	port(
		clk_i: in std_logic;
		RXD_i: in std_logic;
		TXD_o: out std_logic;
		LOG : INOUT STD_LOGIC
	);
end RS232_MODULE;

architecture Behavioral of RS232_MODULE is

component Receiver is
	port(
		clk_i : in STD_LOGIC;
		RxD : in STD_LOGIC;
		Data : out STD_LOGIC_VECTOR(7 downto 0);
		Data_Ready : out STD_LOGIC;
		LOG : INOUT STD_LOGIC
	);
end component;

component transmitter is
	port(
		Data: in std_logic_vector(7 downto 0);
		clk_i: in std_logic;
		Data_ready: in std_logic;
		TXD_o: out std_logic
	);
end component;

component adder is
	port(
		clk_i : in std_logic;
		Data_ready_i: in std_logic;
		Data_ready_o: out std_logic;
		sig_i : in std_logic_vector(7 downto 0);
		added_sig_o : out std_logic_vector(7 downto 0)
	);
end component;

signal d_ready_r : std_logic:='0';
signal d_ready_t : std_logic:='0';
signal data_r : std_logic_vector(7 downto 0):=(others=>'0');
signal data_added : std_logic_vector(7 downto 0 ):=(others=>'0');


begin
	getit: Receiver	port map(
								clk_i=>clk_i,
								RxD=>RXD_i,
								Data=>data_r,
								Data_Ready=>d_ready_r,
								LOG => LOG
							);
	
	addit: adder		port map(
								clk_i=>clk_i,
								Data_ready_i=>d_ready_r,
								Data_ready_o=>d_ready_t,
								sig_i=>data_r,
								added_sig_o=>data_added
							);
	sendit: transmitter		port map(
										Data=>data_added,
										clk_i=>clk_i,
										Data_ready=>d_ready_t,
										TXD_o=>TXD_o
									);
	
end Behavioral;
