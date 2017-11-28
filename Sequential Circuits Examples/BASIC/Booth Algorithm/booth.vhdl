CODE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity boothmodule is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           o : out  STD_LOGIC_VECTOR (7 downto 0));
end boothmodule;

architecture Behavioral of boothmodule is

function booth(a,b:std_logic_vector(3 downto 0))
return std_logic_vector is
variable ac,ar,br:std_logic_vector(3 downto 0);
variable y:std_logic_vector(7 downto 0);
variable q:std_logic;

begin
ac:="0000";
y:="00000000";
q:='0';
ar:=a;
br:=b;
for i in 0 to 3 loop
	if (br(0) = q) then
		y:=ac&br;
		ac:=y(7)&y(7 downto 5);
		br:=y(4 downto 1);
		q:=y(0);
	elsif (br(0)='1' and q='0') then
		ac:=ac-ar;
		y:=ac&br;
		ac:=y(7)&y(7 downto 5);
		br:=y(4 downto 1);
		q:=y(0);
	else
		ac:=ac+ar;
		y:=ac&br;
		ac:=y(7)&y(7 downto 5);
		br:=y(4 downto 1);
		q:=y(0);
	end if;
end loop;
return ac&br;
end function;

begin

o<=booth(a,b);
end Behavioral;