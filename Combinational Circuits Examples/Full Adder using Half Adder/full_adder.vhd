CODE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_module is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end full_module;

architecture Behavioral of full_module is
signal tmp1: std_logic;
signal tmp2: std_logic;
signal tmp3: std_logic;
begin
half_adder_1: entity work.half_module PORT MAP (
a => a,
b => b,
sum => tmp1,
carry => tmp2
);
half_adder_2: entity work.half_module PORT MAP (
a => c,
b => tmp1,
sum => sum,
carry => tmp3
);
or_gate_1 : entity work.or_gate PORT MAP(
a => tmp2,
b => tmp3,
c => carry
);

end Behavioral;
