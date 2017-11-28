CODE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity half_subtractor_module is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           diff : out  STD_LOGIC;
           borrow : out  STD_LOGIC);
end half_subtractor_module;
architecture Behavioral of half_subtractor_module is
begin
diff <= a xor b;
borrow <= (not a)and b;
end Behavioral;

