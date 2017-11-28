CODE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity d_module is
    Port ( D : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end d_module;
architecture Behavioral of d_module is
begin
	process(rst,clk)
	begin
	if (rst='1') then
	Q<='0';
	elsif (clk'event and clk='1' ) then
	Q<=D;
	end if;
	end process;
end Behavioral;

