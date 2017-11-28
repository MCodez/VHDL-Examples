TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY uart_tx_tb IS
END uart_tx_tb;
 
ARCHITECTURE behavior OF uart_tx_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT UART_Transmitter
    PORT(
         clk : IN  std_logic;
         data_in : IN  std_logic_vector(7 downto 0);
         serial_out : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal clk : std_logic := '0';
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');

  --Outputs
   signal serial_out : std_logic;


BEGIN

-- Instantiate the Unit Under Test (UUT)
   uut: UART_Transmitter PORT MAP (
          clk => clk,
          data_in => data_in,
          serial_out => serial_out
        );

   -- Clock process definitions
   clk_process :process
   begin
clk <= '0';
wait for 0.1ns;
clk <= '1';
wait for 0.1ns;
   end process;


   -- Stimulus process
   stim_proc: process
   begin
        data_in <= "11100101";
  wait for 200ns;
  data_in <= "11111010";
  wait for 200ns;
  data_in <= "00101010";
  wait for 200ns;
  data_in <= "00111010";
  wait for 200ns;
  data_in <= "10100110";
  wait for 200ns;


   end process;

END;