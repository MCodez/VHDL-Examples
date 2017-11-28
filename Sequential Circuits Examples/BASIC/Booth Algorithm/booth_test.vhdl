TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY boothtest IS
END boothtest;
 
ARCHITECTURE behavior OF boothtest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT boothmodule
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := "1011";
   signal b : std_logic_vector(3 downto 0) := "1011";

 	--Outputs
   signal o : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: boothmodule PORT MAP (
          a => a,
          b => b,
          o => o
        );

   -- Clock process definitions
   input_proc: process
   begin		
    wait for 100 ns;	
		a<="1101";
		b<="0110";
		wait for 100 ns;
		a<="1111";
		b<="0101";
		wait for 100 ns; 
  end process;
	

END;