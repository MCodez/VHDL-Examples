TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY half_adder_testbench IS
END half_adder_testbench;
 
ARCHITECTURE behavior OF half_adder_testbench IS 
    COMPONENT half_adder_module
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         sum : OUT  std_logic;
         carry : OUT  std_logic
        );
    END COMPONENT;
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal sum : std_logic;
   signal carry : std_logic;
BEGIN
   uut: half_adder_module PORT MAP (
          a => a,
          b => b,
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
	  
END;
