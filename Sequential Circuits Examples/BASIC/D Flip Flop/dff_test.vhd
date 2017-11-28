TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY dflipfloptest IS
END dflipfloptest;
ARCHITECTURE behavior OF dflipfloptest IS 
    COMPONENT d_module
    PORT(
         D : IN  std_logic;
         rst : IN  std_logic;
         clk : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
   signal D : std_logic := '0';
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal Q : std_logic;
   constant clk_period : time := 10 ns;
BEGIN
   uut: d_module PORT MAP (
          D => D,
          rst => rst,
          clk => clk,
          Q => Q
        );
   clk_process :process
   begin
		clk <= '0';
		wait for 100 ns;
		clk <= '1';
		wait for 100 ns;
   end process;
   stim_proc1: process
   begin		
   wait for 100 ns;
	d<=not d;
	end process;
	stim_proc2: process
	begin
	wait for 50 ns;
	rst<=not rst;
	end process;
END;
