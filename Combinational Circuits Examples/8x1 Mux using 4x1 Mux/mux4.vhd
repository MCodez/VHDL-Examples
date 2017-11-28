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

entity four_one_module is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           e : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           s2 : in  STD_LOGIC;
           o : out  STD_LOGIC);
end four_one_module;

architecture Behavioral of four_one_module is

begin

o <= (((not s1) and (not s2) and a) or ((not s1) and (s2) and b) or ((s1) and (not s2) and c) or (s1 and s2 and d))and e;

end Behavioral;
