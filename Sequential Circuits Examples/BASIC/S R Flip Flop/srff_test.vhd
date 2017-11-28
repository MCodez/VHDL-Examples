TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY srflipfloptest IS
END srflipfloptest;
 
ARCHITECTURE behavior OF srflipfloptest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT srflipflopmodule
    PORT(
         s : IN  std_logic;
         r : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         qb : OUT  std_logic;
         q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal s : std_logic := '0';
   signal r : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal qb : std_logic;
   signal q : std_logic;

   -- Clock period definitions
  -- constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: srflipflopmodule PORT MAP (
          s => s,
          r => r,
          clk => clk,
          reset => reset,
          qb => qb,
          q => q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 50 ns;
		clk <= '1';
		wait for 50 ns;
   end process;
 

   -- Stimulus process
   
	stim_proc1: process
   begin		
      wait for 100 ns;
		s<='1';
		r<='0';
		wait for 100 ns;
		s<='0';
		r<='1';
		wait for 100 ns;
		s<='0';
		r<='0';
		wait for 100 ns;
		s<='1';
		r<='1';
	end process;
	
	stim_proc2:process
	begin
	wait for 200 ns;
		reset<=not reset;
	end process;
	
END;
