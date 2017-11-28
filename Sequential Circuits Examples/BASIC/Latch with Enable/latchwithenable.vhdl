CODE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity latchen is
    Port ( en : in  STD_LOGIC;
           input : in  STD_LOGIC;
           output : out  STD_LOGIC;
           clk : in  STD_LOGIC);
end latchen;

architecture Behavioral of latchen is
signal y: STD_LOGIC;
type state_type is (S0,S1);
signal state,next_state : state_type;
begin

NEXT_STATE_DECODE : process(state,en,input,clk)
begin
case(state) is
when S0 =>

if(en='0' and input='0') then
next_state<=S0;
y<='0';
else if (en='0' and input='1') then
next_state<=S0;
y<='0';
else if (en='1' and input='0') then
next_state<=S0;
y<='0';
else
next_state<=S1;
y<='1';
end if;
end if;
end if;

when S1 =>
if(en='0' and input='0') then
next_state<=S1;
y<='1';
else if (en='0' and input='1') then
next_state<=S1;
y<='1';
else if (en='1' and input='0') then
next_state<=S0;
y<='0';
else
next_state<=S1;
y<='1';
end if;
end if;
end if;
when others =>
state<=S0;
y<='0';

end case;
end process;

output<=y;


end Behavioral;