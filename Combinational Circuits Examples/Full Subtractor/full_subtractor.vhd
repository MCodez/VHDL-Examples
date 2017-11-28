CODE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity full_subtractor_module is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           diff : out  STD_LOGIC;
           borrow : out  STD_LOGIC);
end full_subtractor_module;
architecture Behavioral of full_subtractor_module is
begin
diff <= a xor b xor c;
borrow <= ((not a) and c) or((not a) and b)or (b and c);
end Behavioral;

