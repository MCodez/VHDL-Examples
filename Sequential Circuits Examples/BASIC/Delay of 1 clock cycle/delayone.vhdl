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

entity delay1clk is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           din : in  STD_LOGIC;
           dout : out  STD_LOGIC);
end delay1clk;

architecture Behavioral of delay1clk is
signal ff : STD_LOGIC_VECTOR(1 downto 0);
begin
	process(clk,rst)
	begin
		if(rst = '1') then
			ff <= "00";
		elsif(clk'event and clk = '1') then
			ff(1) <= ff(0);
			ff(0) <= din;
		end if;
	end process;
	dout <= ff(1);
end Behavioral;