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

entity transmitmain is
    Port ( clk : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           serial_out : out  STD_LOGIC);
end transmitmain;

architecture Behavioral of transmitmain is
type s is (idle,start,data,stop);
signal st:s:=idle;
signal temp:std_logic_vector(7 downto 0);
signal temp2:std_logic;
begin

process(clk) 
variable count : integer range 0 to 100 :=0;
variable data_bit : integer range 0 to 7 :=0;
begin
case st is

when idle=>
if rising_edge(clk) then
temp<=data_in;
count:=0;
data_bit:=0;
st<=start;
end if;

when start=>
temp2<='0';
if rising_edge(clk) then
count:=count+1;
end if;
if count=100 then
count:=0;
st<=data;
end if;

when data=>
temp2<=temp(data_bit);
if rising_edge(clk) then
count:=count+1;
end if;
if count=100 then
data_bit:=data_bit+1;
count:=0;
end if;
if data_bit=8 then
st<=stop;
else
st<=data;
end if;

when stop=>
temp2<='1';
if rising_edge(clk) then
count:=count+1;
end if;
if count=100 then
count:=0;
st<=idle;
end if;

when others => st<=idle;
end case;
end process;
serial_out<=temp2;
end Behavioral;
