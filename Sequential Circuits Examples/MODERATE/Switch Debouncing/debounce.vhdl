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

entity debounce is
    Port ( clk : in  STD_LOGIC;
           button : in  STD_LOGIC;
           result : out  STD_LOGIC);
end debounce;

architecture Behavioral of debounce is
signal ff : STD_LOGIC_VECTOR(1 downto 0);
signal counter : STD_LOGIC_VECTOR(1 downto 0);
signal counter_clr : STD_LOGIC;
begin
	counter_clr <= ff(0) xor ff(1);
	process(clk,button)
	begin
			if(clk'event and clk = '1') then
				ff(1) <= ff(0);
				ff(0) <= button;
				if(counter_clr = '1') then
					counter <= (others => '0');
				elsif(counter="11") then
					result <= ff(1);
				else
					counter <= counter + 1;
				end if;
			end if;
	end process;
end Behavioral;

