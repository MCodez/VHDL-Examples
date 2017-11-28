CODE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity bidirectmodule is
    Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           m : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           y : out  STD_LOGIC_VECTOR (3 downto 0));
end bidirectmodule;
architecture Behavioral of bidirectmodule is
begin
process(clk,m,rst)
variable temp:STD_LOGIC_VECTOR(3 downto 0);
begin
if (rst='1') then
temp:="0000";
end if;
if (clk'event and clk='1') then
	if (m='1') then
		temp:=d(2 downto 0) &'0';
	else
		temp:='0' & d(3 downto 1);
	end if;
end if;
y<=temp;
end process;
end Behavioral;

