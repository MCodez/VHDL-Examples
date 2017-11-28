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

entity jkflipflopmodule is
    Port ( j : in  STD_LOGIC;
           k : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC;
           qb : out  STD_LOGIC);
end jkflipflopmodule;

architecture Behavioral of jkflipflopmodule is

begin
process (j,k,clk,rst) is
    variable m : std_logic := '0';
    begin
        if (rst='1') then
            m := '0';
        elsif (rising_edge (clk)) then
            if (j/=k) then
                m := j;
            elsif (j='1' and k='1') then
                m := not m;
            end if;
        end if;
        q <= m;
        qb <= not m;
    end process;

end Behavioral;

