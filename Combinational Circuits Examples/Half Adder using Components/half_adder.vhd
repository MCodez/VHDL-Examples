CODE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder_component_module is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end half_adder_component_module;

architecture Behavioral of half_adder_component_module is

begin
and_gate_1 : entity work.and_gate_module PORT MAP (
a => a,
b => b,
o =>carry
);
xor_gate_1: entity work.xor_gate_component PORT MAP(
a => a,
b => b,
o => sum
);
end Behavioral;