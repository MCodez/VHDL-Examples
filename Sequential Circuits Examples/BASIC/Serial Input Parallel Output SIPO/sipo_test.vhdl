TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sipotest IS
END sipotest;
 
ARCHITECTURE behavior OF sipotest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT siporegister
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         s_in : IN  std_logic;
         p_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal s_in : std_logic := '0';

 	--Outputs
   signal p_out : std_logic_vector(3 downto 0);

   -- Clock period definitions
   --constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: siporegister PORT MAP (
          clk => clk,
          rst => rst,
          s_in => s_in,
          p_out => p_out
        );
		  
   stim_proc1: process
   begin		
      wait for 100 ns;
		clk <= not clk;
   end process;
	
	stim_proc2: process
   begin		
      wait for 40 ns;
		rst <= not rst;
		wait for 100 ns;
		rst <= not rst;
		wait;
   end process;
	
	stim_proc3: process
   begin		
      wait for 200 ns;
		s_in <= not s_in;
   end process;

END;