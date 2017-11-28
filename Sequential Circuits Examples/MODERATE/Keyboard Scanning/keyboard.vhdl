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

entity scanmain is
    Port ( column : inout  STD_LOGIC_VECTOR (2 downto 0);
				invalue : in STD_LOGIC_VECTOR (3 downto 0);
           row : inout  STD_LOGIC_VECTOR (3 downto 0);
           value : out  STD_LOGIC_VECTOR (3 downto 0);
			  resetc : inout STD_LOGIC;
			  enable : inout STD_LOGIC;
           clk : in  STD_LOGIC;
			  clkc : in STD_LOGIC;
           reset : in  STD_LOGIC);
end scanmain;

architecture Behavioral of scanmain is

function save(a:std_logic_vector(6 downto 0))
return std_logic_vector is
variable re:std_logic_vector(3 downto 0);
begin
case a is
when "1000100" => re:="0001";
when "0100100" => re:="0100";
when "0010100" => re:="0111";
when "0001100" => re:="1111";
when "1000010" => re:="0010";
when "0100010" => re:="0101";
when "0010010" => re:="1000";
when "0001010" => re:="0000";
when "1000001" => re:="0011";
when "0100001" => re:="0110";
when "0011001" => re:="1001";
when "0001001" => re:="1100";
when others => NULL;
end case;
return re;
end function;

function decode(a:std_logic_vector(3 downto 0))
return std_logic_vector is
variable re:std_logic_vector(6 downto 0);
begin
case a is
when "0001" => re:="1000100";
when "0100" => re:="0100100";
when "0111" => re:="0010100";
when "1111" => re:="0001100";
when "0010" => re:="1000010";
when "0101" => re:="0100010";
when "1000" => re:="0010010";
when "0000" => re:="0001010";
when "0011" => re:="1000001";
when "0110" => re:="0100001";
when "1001" => re:="0011001";
when "1100" => re:="0001001";
when others => re:="0000000";
end case;
return re;
end function;

type s is (a,b,c,d,e,f,g);
signal st:s;
signal count:std_logic_vector(2 downto 0);
signal overflow,k:std_logic;
signal val:std_logic_vector(6 downto 0);
signal temp:std_logic_vector(6 downto 0);
begin
-- Counter
process(resetc,enable,clkc) begin
if resetc='1' then
count<="000";
elsif (rising_edge(clkc)) then
count<=count+1;
if (count="111") then
overflow<='1';
else
overflow<='0';
end if;
end if;
end process;


-- Keyboard
process(reset,clk) begin
if reset='1' then
st<=a;
resetc<='1';
enable<='0';
elsif (rising_edge(clk)) then
temp<=decode(invalue);
row<=temp(6) & temp(5) & temp(4) & temp(3);
column<=temp(2) & temp(1) & temp(0);
k<=row(1) or row(2) or row(3) or row(0);
case st is

when a=>

if k='1' then
resetc<='0';
enable<='1';
st<=b;
else
st<=a;
end if;

when b=>

if overflow='1' then
resetc<='1';
enable<='0';
st<=c;
else
resetc<='0';
enable<='1';
st<=b;
end if;

when c=>

resetc<='1';
enable<='0';
--k<=row(0) or row(1) or row(2) or row(3);
if k='1' then
st<=d;
else
st<=a;
end if;

when d=>
if column="100" then

st<=g;
resetc<='1';
enable<='0';
else
st<=e;
end if;

when e=>
if column="010" then

st<=g;
resetc<='1';
enable<='0';
else

resetc<='1';
enable<='0';
st<=g;
end if;

when g=>

val<=row&column;
value<=save(val);
resetc<='1';
enable<='0';
st<=a;

when others => NULL;
end case;
end if;
end process;

end Behavioral;
