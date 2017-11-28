CODE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity maindice is
    Port ( switch : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           clkc : in  STD_LOGIC;
           resetc : inout  STD_LOGIC;
           enable : inout  STD_LOGIC;
			  tempcount : out STD_LOGIC_VECTOR(2 downto 0);
			  victory : out STD_LOGIC;
			  storage2 : inout STD_LOGIC_VECTOR(2 downto 0);
           storage : inout  STD_LOGIC_VECTOR (2 downto 0));
end maindice;

architecture Behavioral of maindice is
type s is (a,b,c,d,e);
signal st:s;
signal count : std_logic_vector(2 downto 0);
begin
-- Counter 
process(clkc,resetc,enable) begin
if resetc='1' then
count<="001";
elsif rising_edge(clkc) then
if enable='1' then
if count="110" then
count<="001";
else
count<=count+1;
end if;
end if;
end if;
end process;

-- Main
process(clk,reset) begin
if reset='1' then
st<=a;
resetc<='1';
enable<='0';
elsif rising_edge(clk) then

case st is 
when a=> 
if switch='1' then
st<=a;
resetc<='1';
enable<='0';
tempcount<=count;
else 
st<=b;
resetc<='0';
enable<='1';
tempcount<=count;
end if;

when b=>
if switch='0' then
st<=b;
resetc<='0';
enable<='1';
tempcount<=count;
else
st<=c;
storage<=count;
resetc<='1';
enable<='0';
tempcount<=count;
end if;

when c=>
if switch='1' then
st<=c;
resetc<='1';
enable<='0';
else
st<=d;
resetc<='0';
enable<='1';
end if;

when d=>
if switch='0' then
st<=d;
resetc<='0';
enable<='1';
else
st<=e;
storage2<=count;
resetc<='1';
enable<='0';
end if;

when e=>
st<=a;
resetc<='1';
enable<='0';
if(storage=storage2) then
victory<='1';
else 
victory<='0';
end if;

when others=> NULL;
end case;
end if;
end process;

end Behavioral;
