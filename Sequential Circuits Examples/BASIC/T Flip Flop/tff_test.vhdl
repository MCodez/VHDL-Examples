TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY togglefftest IS
END togglefftest;
 
ARCHITECTURE behavior OF togglefftest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT toggleffmodule
    PORT(
         t : IN  std_logic;
         rst : IN  std_logic;
         clk : IN  std_logic;
         q : OUT  std_logic;
         qb : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal t : std_logic := '0';
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal q : std_logic;
   signal qb : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: toggleffmodule PORT MAP (
          t => t,
          rst => rst,
          clk => clk,
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
      t<='0';
		wait for 100 ns;
		t<='1';
		
   end process;
	stim_proc2:process
	begin
	wait for 50 ns;
	rst<=not rst;
	end process;
END;
