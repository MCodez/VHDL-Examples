TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY debouncetest IS
END debouncetest;
 
ARCHITECTURE behavior OF debouncetest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT debounce
    PORT(
         clk : IN  std_logic;
         button : IN  std_logic;
         result : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal button : std_logic := '0';

 	--Outputs
   signal result : std_logic;

   -- Clock period definitions
   --constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: debounce PORT MAP (
          clk => clk,
          button => button,
          result => result
        );

   stim_proc1: process
   begin		
      wait for 100 ns;
		clk <= not clk;
   end process;
	
	stim_proc2: process
	begin
		wait for 170 ns;
		button <= not button;
		wait for 170 ns;
		button <= not button;
		wait for 170 ns;
		button <= not button;
		wait for 170 ns;
		button <= not button;
		wait for 170 ns;
		button <= not button;
		wait for 170 ns;
		button <= not button;
		wait for 170 ns;
		button <= not button;
		wait for 8000 ns;
		button <= not button;
		wait for 170 ns;
		button <= not button;
		wait for 170 ns;
		button <= not button;
		wait for 170 ns;
		button <= not button;
		wait for 170 ns;
		button <= not button;
		wait for 170 ns;
		button <= not button;
		wait for 170 ns;
		button <= not button;
		wait for 8000 ns;
		button <= not button;
		wait;
	end process;

END;