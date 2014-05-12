
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ModuleTB IS
END ModuleTB;
 
ARCHITECTURE behavior OF ModuleTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RS232_MODULE
    PORT(
         clk_i : IN  std_logic;
         RXD_i : IN  std_logic;
         TXD_o : OUT  std_logic;
			LOG : INOUT STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal RXD_i : std_logic := '1';
	signal LOG : std_logic:= '0';

 	--Outputs
   signal TXD_o : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 20 ns;
	
	signal WORD1 : STD_LOGIC_VECTOR(7 downto 0):="01000001";
	signal WORD2 : STD_LOGIC_VECTOR(7 downto 0):="00000000";
	signal WORD3 : STD_LOGIC_VECTOR(7 downto 0):="01000100";
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RS232_MODULE PORT MAP (
          clk_i => clk_i,
          RXD_i => RXD_i,
          TXD_o => TXD_o,
			 LOG => LOG
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 
	process
	begin
		wait for 1 ms;
		RXD_i <= '0';
		wait for 102 us;
		RXD_i <= WORD1(0);
		wait for 102 us;
		RXD_i <= WORD1(1);
		wait for 102 us;
		RXD_i <= WORD1(2);
		wait for 102 us;
		RXD_i <= WORD1(3);
		wait for 102 us;
		RXD_i <= WORD1(4);
		wait for 102 us;
		RXD_i <= WORD1(5);
		wait for 102 us;
		RXD_i <= WORD1(6);
		wait for 102 us;
		RXD_i <= WORD1(7);
		wait for 102 us;
		RXD_i <= '1';
		wait for 600 us;		--- 2 WORD
		RXD_i <= '0';
		wait for 102 us;
		RXD_i <= WORD2(0);
		wait for 102 us;
		RXD_i <= WORD2(1);
		wait for 102 us;
		RXD_i <= WORD2(2);
		wait for 102 us;
		RXD_i <= WORD2(3);
		wait for 102 us;
		RXD_i <= WORD2(4);
		wait for 102 us;
		RXD_i <= WORD2(5);
		wait for 102 us;
		RXD_i <= WORD2(6);
		wait for 102 us;
		RXD_i <= WORD2(7);
		wait for 102 us;
		RXD_i <= '1';
		wait for 123.8101 us;		--- 3 WORD
		RXD_i <= '0';
		wait for 102 us;
		RXD_i <= WORD3(0);
		wait for 102 us;
		RXD_i <= WORD3(1);
		wait for 102 us;
		RXD_i <= WORD3(2);
		wait for 102 us;
		RXD_i <= WORD3(3);
		wait for 102 us;
		RXD_i <= WORD3(4);
		wait for 102 us;
		RXD_i <= WORD3(5);
		wait for 102 us;
		RXD_i <= WORD3(6);
		wait for 102 us;
		RXD_i <= WORD3(7);
		wait for 102 us;
		RXD_i <= '1';
		wait;
		
end process;
END;
