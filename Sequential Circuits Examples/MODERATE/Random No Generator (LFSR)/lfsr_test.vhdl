TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY lfsrtest IS
END lfsrtest;
 
ARCHITECTURE behavior OF lfsrtest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lfsrmain
    PORT(
         clk : IN  std_logic;
         r_out : OUT  std_logic_vector(7 downto 0);
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal r_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lfsrmain PORT MAP (
          clk => clk,
          r_out => r_out,
          reset => reset
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      reset<='1';
		wait for 2*clk_period;
		reset<='0';
		wait for 100*clk_period;
   end process;

END;
