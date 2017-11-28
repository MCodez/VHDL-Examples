TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY maintest IS
END maintest;
 
ARCHITECTURE behavior OF maintest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT maindice
    PORT(
         switch : IN  std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic;
         clkc : IN  std_logic;
         resetc : INOUT  std_logic;
         enable : INOUT  std_logic;
			victory : OUT std_logic;
         tempcount : OUT  std_logic_vector(2 downto 0);
			storage2 : INOUT  std_logic_vector(2 downto 0);
         storage : INOUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal switch : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal clkc : std_logic := '0';

	--BiDirs
   signal resetc : std_logic;
   signal enable : std_logic;
	signal storage2 : std_logic_vector(2 downto 0):=(others=>'0');
   signal storage : std_logic_vector(2 downto 0):=(others=>'0');

 	--Outputs
   signal tempcount : std_logic_vector(2 downto 0);
	signal victory : std_logic;
	

   -- Clock period definitions
   constant clk_period : time := 20 ns;
   constant clkc_period : time := 5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: maindice PORT MAP (
          switch => switch,
          reset => reset,
          clk => clk,
          clkc => clkc,
          resetc => resetc,
          enable => enable,
			 victory => victory,
          tempcount => tempcount,
			 storage2 => storage2,
          storage => storage
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
   switch_proc: process
   begin		
      switch<='1';
		wait for 2*clk_period;
		switch<='0';
		wait for 4*clk_period;
		switch<='1';
		wait for 2*clk_period;
		switch<='0';
		wait for 5*clk_period;
		switch<='1';
		wait for 100*clk_period;
   end process;
	
	reset_proc:process
	begin
	reset<='1';
	wait for clk_period;
	reset<='0';
	wait for 100*clk_period;
	end process;

END;
