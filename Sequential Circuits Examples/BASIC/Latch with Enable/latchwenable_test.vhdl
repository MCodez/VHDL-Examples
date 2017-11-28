TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_bench IS
END test_bench;
 
ARCHITECTURE behavior OF test_bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT latchen
    PORT(
         en : IN  std_logic;
         input : IN  std_logic;
         output : OUT  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal en : std_logic := '0';
   signal input : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal output : std_logic;

   
 
BEGIN
 
	
   uut: latchen PORT MAP (
          en => en,
          input => input,
          output => output,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
	wait for 30 ns;
		clk <= '0';
		wait for 30 ns;
		clk <= '1';
		
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
     wait for 30 ns;
	  en<='0';
	  input<='0';
	  wait for 30 ns;
	  en<='0';
	  input<='1';
	  wait for 30 ns;
	  en<='1';
	  input<='0';
	  wait for 30 ns;
	  en<='1';
	  input<='1';
   end process;

END;
