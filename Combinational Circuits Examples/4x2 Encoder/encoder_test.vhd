TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY encodertestbench IS
END encodertestbench;
ARCHITECTURE behavior OF encodertestbench IS 
    COMPONENT encodermodule
    PORT(
         input : IN  std_logic_vector(3 downto 0);
         output : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
   signal input : std_logic_vector(3 downto 0) := (others => '0');
   signal output : std_logic_vector(1 downto 0);
BEGIN
   uut: encodermodule PORT MAP (
          input => input,
          output => output
        );
   stim_proc: process
   begin		
     wait for 80 ns;
	  input(0)<='1';
	  input(1) <='0';
	  input(2) <='0';
	  input(3) <='0';
	  wait for 80 ns;
	  input(0)<='0';
	  input(1) <='1';
	  input(2) <='0';
	  input(3) <='0';
	  wait for 80 ns;
	  input(0)<='0';
	  input(1) <='0';
	  input(2) <='1';
	  input(3) <='0';
	  wait for 80 ns;
	  input(0)<='0';
	  input(1) <='0';
	  input(2) <='0';
	  input(3) <='1';
   end process;

END;

