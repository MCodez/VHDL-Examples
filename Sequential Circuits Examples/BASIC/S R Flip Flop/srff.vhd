CODE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity srflipflopmodule is
    Port ( s : in  STD_LOGIC;
           r : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  reset : in STD_LOGIC;
			  qb :OUT STD_LOGIC;
           q : out  STD_LOGIC);
end srflipflopmodule;

architecture Behavioral of srflipflopmodule is

begin
process (s,r,clk,reset) is
    begin
        if (reset='1') then
            q <= '0';
            qb <= '1';
        elsif (rising_edge (clk)) then
            if (s/=r) then
                q <= s;
                qb <= r;
            elsif (s='1' and r='1') then
                q <= 'Z';
                qb <= 'Z';
            end if;
        end if;
end process;
end Behavioral;

