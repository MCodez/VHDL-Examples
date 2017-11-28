CODE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate_module is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           o : out  STD_LOGIC);
end and_gate_module;

architecture Behavioral of and_gate_module is

begin

o <= a and b;
end Behavioral;