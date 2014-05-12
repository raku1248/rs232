--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:26:37 05/10/2014
-- Design Name:   
-- Module Name:   D:/PROGRAMOWANIE/Github/rstryhard/ReceiverTB.vhd
-- Project Name:  rstryhard
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Receiver
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ReceiverTB IS
END ReceiverTB;
 
ARCHITECTURE behavior OF ReceiverTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Receiver
    PORT(
         clk_i : IN  std_logic;
         RxD : IN  std_logic;
         Data : OUT  std_logic_vector(7 downto 0);
         Data_Ready : OUT  std_logic;
			LOG : inout STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal RxD : std_logic := '1';
	signal LOG: std_logic:='0';

 	--Outputs
   signal Data : std_logic_vector(7 downto 0):=(others=>'0');
   signal Data_Ready : std_logic:= '0';
	signal WORD : std_logic_vector(7 downto 0):="01100110";

   -- Clock period definitions
   constant clk_i_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Receiver PORT MAP (
          clk_i => clk_i,
          RxD => RxD,
          Data => Data,
          Data_Ready => Data_Ready,
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
	RxD <='0';
	wait for 0.102 ms;
	RxD <=WORD(0);
	wait for 0.102 ms;
	RxD <=WORD(1);
	wait for 0.102 ms;
	RxD <=WORD(2);
	wait for 0.102 ms;
	RxD <=WORD(3);
	wait for 0.102 ms;
	RxD <=WORD(4);
	wait for 0.102 ms;
	RxD <=WORD(5);
	wait for 0.102 ms;
	RxD <=WORD(6);
	wait for 0.102 ms;
	RxD <=WORD(7);
	wait for 0.102 ms;
	RxD <='1';
	wait;
end process;


END;
