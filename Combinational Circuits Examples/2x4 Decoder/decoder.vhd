CODE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity decodermodule is
    Port ( input : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end decodermodule;
architecture Behavioral of decodermodule is
begin
output(0) <= (not input(1))and(not input(0));
output(1) <= (not input(1))and(input(0));
output(2) <= (input(1))and(not input(0));
output(3) <= (input(1))and(input(0));
end Behavioral;
