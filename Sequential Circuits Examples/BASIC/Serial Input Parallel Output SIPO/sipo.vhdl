CODE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity siporegister is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           s_in : in  STD_LOGIC;
           p_out : out  STD_LOGIC_VECTOR(3 downto 0));
end siporegister;

architecture Behavioral of siporegister is
signal temp : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
	process(clk,rst)
	begin
		if(rst = '1') then
			temp <= "0000";
		elsif(clk'event and clk = '1') then
			temp(3) <= temp(2);
			temp(2) <= temp(1);
			temp(1) <= temp(0);
			temp(0) <= s_in;
		end if;
	end process;
	p_out <= temp;
end Behavioral;