TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY full_by_half_testbench IS
END full_by_half_testbench;
 ARCHITECTURE behavior OF full_by_half_testbench IS 
    COMPONENT full_module
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         c : IN  std_logic;
         sum : OUT  std_logic;
         carry : OUT  std_logic
        );
    END COMPONENT;
    
  signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal c : std_logic := '0';
   signal sum : std_logic;
   signal carry : std_logic;
BEGIN
   uut: full_module PORT MAP (
          a => a,
          b => b,
          c => c,
          sum => sum,
          carry => carry
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
	stim_proc3: process
   begin		
      wait for 25 ns;
		c <= not c;
   end process;
END;