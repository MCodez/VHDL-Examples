TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY half_subtractor_testbench IS
END half_subtractor_testbench;
ARCHITECTURE behavior OF half_subtractor_testbench IS 
    COMPONENT half_subtractor_module
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         diff : OUT  std_logic;
         borrow : OUT  std_logic
        );
    END COMPONENT;
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal diff : std_logic;
   signal borrow : std_logic;
BEGIN
   uut: half_subtractor_module PORT MAP (
          a => a,
          b => b,
          diff => diff,
          borrow => borrow
        );
   stim_proc1: process
   begin		
   wait for 100 ns;
	a <= not a;
	end process;
stim_proc2: process
   begin		
   wait for 50 ns;
	b <= not b;
	end process;
END;
