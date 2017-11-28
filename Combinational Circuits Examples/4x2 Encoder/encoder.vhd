CODE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity encodermodule is
    Port ( input : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (1 downto 0));
end encodermodule;
architecture Behavioral of encodermodule is
begin
output(0) <= ((input(3))and(not input(2))and(not input(1))and(not input(0)))or ((not input(3))and(not input(2))and(input(1))and(not input(0)));
output(1) <= ((input(3))and(not input(2))and(not input(1))and(not input(0)))or((not input(3))and(input(2))and(not input(1))and(not input(0)));
end Behavioral;
