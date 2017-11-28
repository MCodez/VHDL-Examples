TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY delay1clktest IS
END delay1clktest;
 
ARCHITECTURE behavior OF delay1clktest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT delay1clk
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         din : IN  std_logic;
         dout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal din : std_logic := '0';

 	--Outputs
   signal dout : std_logic;

   -- Clock period definitions
   --constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: delay1clk PORT MAP (
          clk => clk,
          rst => rst,
          din => din,
          dout => dout
        );
 

   -- Stimulus process
   stim_proc1: process
   begin		
      wait for 100 ns;	
			clk <= not clk;
   end process;
	
	stim_proc2: process
   begin		
      wait for 100 ns;	
			rst <= not rst;
		wait for 200 ns;
			rst <= not rst;
		wait;
   end process;
	
	stim_proc3: process
   begin		
      wait for 100 ns;	
			din <= not din;
   end process;
	
	
	
END;