TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY jkflipfloptest IS
END jkflipfloptest;
 
ARCHITECTURE behavior OF jkflipfloptest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT jkflipflopmodule
    PORT(
         j : IN  std_logic;
         k : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         q : OUT  std_logic;
         qb : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal j : std_logic := '0';
   signal k : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal q : std_logic;
   signal qb : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: jkflipflopmodule PORT MAP (
          j => j,
          k => k,
          clk => clk,
          rst => rst,
          q => q,
          qb => qb
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 25 ns;
		clk <= '1';
		wait for 25 ns;
   end process;
 

   -- Stimulus process
   stim_proc1: process
   begin		
      wait for 100 ns;
		j<='1';
		k<='1';
		wait for 100 ns;
		j<='0';
		k<='0';
		wait for 100 ns;
		j<='0';
		k<='1';
		wait for 100 ns;
		j<='1';
		k<='0';
		
   end process;
	stim_proc2:process
	begin
	wait for 50 ns;
	rst<=not rst;
	end process;
END;
