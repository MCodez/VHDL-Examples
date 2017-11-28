CODE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity recmain is
port (
rx_serial : in std_logic ;
data : out std_logic_vector( 7 downto 0 ) ;
clk : in std_logic );
end recmain;
architecture Behavioral of recmain is
signal count : integer := 0 ;
signal rx_sta :std_logic_vector(1 downto 0 ) ;
signal rx_bit : integer := 0 ;
begin
process(clk)
variable rx_status : std_logic_vector(1 downto 0) := "00" ;
begin
	if(rising_edge(clk)) then
		case rx_status is
		when "00" =>
			rx_bit <= 0 ;
			count <= 0 ;
			if rx_serial <= '0' then
				rx_status := "01";
			else
				rx_status := "00" ;
			end if ;
		when "01" =>
			if(count = 50) then
			if (rx_serial = '0') then
				count <= 0 ;
				rx_status := "10" ;
			else
				rx_status := "00" ;
			end if ;
			else
				count <= count +1 ;
				rx_status := "01" ;
			end if ;
		when "10" =>
			if( count = 100) then
				data(rx_bit) <= rx_serial ;
				count <= 0 ;
			if(rx_bit <7) then
				rx_bit <= rx_bit +1 ;
				rx_status := "10" ;
			else
				rx_bit <= 0 ;
				rx_status := "11" ;
			end if ;
			else
				count<= count +1 ;
				rx_status := "10" ;
			end if ;
		when "11" =>
			if( count = 100 ) then
				count <= 0 ;
				rx_status := "00" ;
			else
				count <= count + 1 ;
				rx_status := "11" ;
			end if ;
		when others =>
			rx_status := "00" ;
		end case ;
	end if ;
rx_sta <= rx_status ;
end process ;
end Behavioral;
