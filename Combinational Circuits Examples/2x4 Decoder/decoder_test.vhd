TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY decodertestbench IS
END decodertestbench;
ARCHITECTURE behavior OF decodertestbench IS 
    COMPONENT decodermodule
    PORT(
         input : IN  std_logic_vector(1 downto 0);
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
   signal input : std_logic_vector(1 downto 0) := (others => '0');
   signal output : std_logic_vector(3 downto 0);
BEGIN
   uut: decodermodule PORT MAP (
          input => input,
          output => output
        );
   stim_proc: process
   begin		
      wait for 80 ns;
		input(0) <= '0';
		input(1) <= '0';
		wait for 80 ns;
		input(0) <='0';
		input(1) <='1';
		wait for 80 ns;
		input(0) <='1';
		input(1) <='0';
		wait for 80 ns;
		input(0) <='1';
		input(1) <='1';
   end process;
END;

