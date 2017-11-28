TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY test_bench IS
END test_bench;
 
ARCHITECTURE behavior OF test_bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counterfsm
    PORT(
         en : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         output : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal en : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(2 downto 0);

   

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counterfsm PORT MAP (
          en => en,
          clk => clk,
          reset => reset,
          output => output
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 30 ns;
		clk <= '1';
		wait for 30 ns;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 10 ns;	
		reset <= '1';
      wait for 10 ns;
		reset <= '0';
		wait for 500 ns;
end process;
	
	enable :process
   begin
		en <= '0';
		wait for 30 ns;
		en <= '1';
		wait for 30 ns;
   end process;
	
END;

