TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY bidirectionaltestbench IS
END bidirectionaltestbench;
ARCHITECTURE behavior OF bidirectionaltestbench IS 
    COMPONENT bidirectmodule
    PORT(
         d : IN  std_logic_vector(3 downto 0);
         m : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         y : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
   signal d : std_logic_vector(3 downto 0) := "1010";
   signal m : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '1';
   signal y : std_logic_vector(3 downto 0);
BEGIN
   uut: bidirectmodule PORT MAP (
          d => d,
          m => m,
          clk => clk,
          rst => rst,
          y => y
        );
   clock_proc: process
   begin		
      wait for 50 ns;	
		clk<=not clk;
		wait for 50 ns;
   end process;
	
	m_proc:process
	begin
		wait for 100 ns;
		m<= not m;
		wait for 100 ns;
	end process;
	
	rst_proc:process
	begin
		wait for 10 ns;
		rst<=not rst;
		wait for 200 ns;
	end process;
END;
