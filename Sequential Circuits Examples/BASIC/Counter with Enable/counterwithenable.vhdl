CODE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity counterfsm is
    Port ( en : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (2 downto 0));
end counterfsm;

architecture Behavioral of counterfsm is
signal y : STD_LOGIC_VECTOR(2 downto 0);
type state_type is (S0,S1,S2,S3,S4,S5,S6,S7);
signal state,next_state :state_type;

begin
SYNC_PROC : process(clk)
begin
if (rising_edge(clk)) then
if (reset='1') then
state<=S0;

else
state<=next_state;
end if;
end if;
end process;

NEXT_STATE_DECODE : process(state,en,clk)
begin
case(state) is 
when S0 => 
if (en='1') then
next_state<=S1;
y<="001";
--else
--next_state<=S0;
--y<="000";
end if;

when S1 => 
if (en='1') then
next_state<=S2;
y<="010";
--else
--next_state<=S1;
--y<="001";
end if;

when S2 => 
if (en='1') then
next_state<=S3;
y<="011";
--else
--next_state<=S2;
--y<="010";
end if;

when S3 => 
if (en='1') then
next_state<=S4;
y<="100";
--else
--next_state<=S3;
--y<="011";
end if;

when S4 => 
if (en='1') then
next_state<=S5;
y<="101";
--else
--next_state<=S4;
--y<="100";
end if;

when S5 => 
if (en='1') then
next_state<=S6;
y<="110";
--else
--next_state<=S5;
--y<="101";
end if;

when S6 => 
if (en='1') then
next_state<=S7;
y<="111";
--else
--next_state<=S6;
--y<="110";
end if;

when S7 => 
if (en='1') then
next_state<=S0;
y<="000";
--else
--next_state<=S7;
--y<="111";
end if;

when others =>
next_state <= S0;
y<="000";
end case;
end process;

output<=y;
end Behavioral;
