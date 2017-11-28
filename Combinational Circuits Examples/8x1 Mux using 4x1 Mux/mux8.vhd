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

entity eight_one_module is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           e : in  STD_LOGIC;
           f : in  STD_LOGIC;
           g : in  STD_LOGIC;
           h : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           s2 : in  STD_LOGIC;
           s3 : in  STD_LOGIC;
           o : out  STD_LOGIC);
end eight_one_module;

architecture Behavioral of eight_one_module is
signal tmp1 : STD_LOGIC;
signal tmp2 : STD_LOGIC;
begin
four_one_mux_1: entity work.four_one_module PORT MAP(
a =>a,
b =>b,
c =>c,
d =>d,
e => not s3,
s1 => s1,
s2 => s2,
o => tmp1
);

four_one_mux_2: entity work.four_one_module PORT MAP(
a =>e,
b =>f,
c =>g,
d =>h,
e =>s3,
s1 => s1,
s2 => s2,
o => tmp2
);

or_gate: entity work.or_gate_module PORT MAP(
a =>tmp1,
b =>tmp2,
c =>o
);
end Behavioral;
