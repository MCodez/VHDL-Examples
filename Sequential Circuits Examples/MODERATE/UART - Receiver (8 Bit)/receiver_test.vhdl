TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
ENTITY Uart_rx_tb IS
END Uart_rx_tb;
ARCHITECTURE behavior OF Uart_rx_tb IS
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT UART_RX
PORT(
rx_serial : IN std_logic;
data : OUT std_logic_vector(7 downto 0);
clk : IN std_logic
);
END COMPONENT;
--Inputs
signal rx_serial : std_logic := '0';
signal clk : std_logic := '0';
--Outputs
signal data : std_logic_vector(7 downto 0);
-- Clock period definitions
BEGIN
-- Instantiate the Unit Under Test (UUT)
uut: UART_RX PORT MAP (
rx_serial => rx_serial,
data => data,
clk => clk
);
-- Stimulus process
stim_proc: process
begin
wait for 0.5 ns ;
clk <= not clk ;
end process;
A: process
begin
rx_serial <= '1' ;
wait for 50 ns ;
rx_serial <= '0';
wait for 100 ns ;
rx_serial <= '1';
wait for 100 ns ;
rx_serial <= '0';
wait for 100 ns ;
rx_serial <= '0';
wait for 100 ns ;
rx_serial <= '0';
wait for 100 ns ;
rx_serial <= '1';
wait for 100 ns ;
rx_serial <= '0';
wait for 100 ns ;
rx_serial <= '0';
wait for 100 ns ;
rx_serial <= '0';
wait for 100 ns ;
rx_serial <= '0';
wait for 100 ns ;
rx_serial <= '1' ;
wait for 100 ns ;
end process ;
END;