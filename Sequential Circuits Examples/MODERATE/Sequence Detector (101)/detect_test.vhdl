TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY detecttest IS
END detecttest;
 
ARCHITECTURE behavior OF detecttest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT detect
    PORT(
         x : IN  std_logic;
         y : OUT  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal y : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: detect PORT MAP (
          x => x,
          y => y,
          clk => clk,
          reset => reset
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      x<='1';
		wait for clk_period;
		x<='0';
		wait for clk_period;
		x<='1';
		wait for clk_period;
		x<='1';
		wait for clk_period;
		
   end process;

END;
