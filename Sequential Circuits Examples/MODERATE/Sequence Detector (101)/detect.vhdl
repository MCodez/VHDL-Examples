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

entity detect is
    Port ( x : in  STD_LOGIC;
           y : out  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end detect;

architecture Behavioral of detect is
signal z:std_logic;
type s is (a,b,c,d);
signal st,nst:s;

begin

process(clk,reset) begin
if (reset='1') then
st<=a;
z<='0';
elsif (rising_edge(clk)) then
case st is 
when a=> 
if (x='1') then
st<=b;
z<='0';
else
st<=a;
z<='0';
end if;

when b=> 
if (x='1') then
st<=b;
z<='0';
else
st<=c;
z<='0';
end if;

when c=> 
if (x='1') then
st<=d;
z<='1';
else
st<=a;
z<='0';
end if;

when d=> 
if (x='1') then
st<=b;
z<='0';
else
st<=c;
z<='0';
end if;
when others => NULL;
end case;
end if;
end process;
y<=z;

end Behavioral;