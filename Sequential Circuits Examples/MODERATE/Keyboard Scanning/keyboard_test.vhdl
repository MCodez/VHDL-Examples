TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY scantest IS
END scantest;
 
ARCHITECTURE behavior OF scantest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT scanmain
    PORT(
         column : INOUT  std_logic_vector(2 downto 0);
         row : INOUT  std_logic_vector(3 downto 0);
			invalue : IN std_logic_vector(3 downto 0);
         value : OUT  std_logic_vector(3 downto 0);
        
         resetc : INOUT  std_logic;
         enable : INOUT  std_logic;
         clk : IN  std_logic;
         clkc : IN  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   
   signal clk : std_logic := '0';
   signal clkc : std_logic := '0';
   signal reset : std_logic := '0';
	signal invalue : std_logic_vector(3 downto 0);
	--BiDirs
   signal column : std_logic_vector(2 downto 0);
   signal resetc : std_logic;
   signal enable : std_logic;
	signal row : std_logic_vector(3 downto 0);
 	--Outputs
   signal value : std_logic_vector(3 downto 0);
  

   -- Clock period definitions
   constant clk_period : time := 20 ns;
   constant clkc_period : time := 5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: scanmain PORT MAP (
          column => column,
          row => row,
          value => value,
			 invalue => invalue,
          
          resetc => resetc,
          enable => enable,
          clk => clk,
          clkc => clkc,
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
 
   clkc_process :process
   begin
		clkc <= '0';
		wait for clkc_period/2;
		clkc <= '1';
		wait for clkc_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      reset<='1';
		wait for 2*clk_period;
		reset<='0';
		wait for 100*clk_period;
   end process;
	
	sti_proc: process
   begin		
      invalue<="1000";
		wait for 1*clk_period;
		invalue<="0010";
		wait for 1*clk_period;
		invalue<="0110";
		wait for 0.5*clk_period;
		invalue<="1000";
		wait for 100*clk_period;
   end process;
	
END;
