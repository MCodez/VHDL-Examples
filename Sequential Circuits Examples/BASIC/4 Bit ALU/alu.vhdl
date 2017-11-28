CODE

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity alumodule is
    Port ( alusel:in STD_LOGIC_VECTOR(1 downto 0);
				a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           y : out  STD_LOGIC_VECTOR (3 downto 0);
           nf,zf,cf,ovf: out STD_LOGIC;
			  clk: in STD_LOGIC;
			  quotient:out std_logic_vector(3 downto 0);
			  remainder:out std_logic_vector(3 downto 0);
			  mul : out  STD_LOGIC_VECTOR (7 downto 0));
end alumodule;
architecture Behavioral of alumodule is
function multiply(a,b:std_logic_vector(3 downto 0))
return std_logic_vector is
variable pv,bp:std_logic_vector(7 downto 0);
begin
pv:="00000000";
bp:="0000"&b;
for i in 0 to 3 loop
	if a(i)='1' then
		pv:=pv+bp;
	end if;
	bp:=bp(6 downto 0)&'0';
end loop;
return pv;
end function;
function divide1(a,b:std_logic_vector(3 downto 0))
return std_logic_vector is
variable Auns, Buns, Quns, Runs: unsigned(3 downto 0);
begin
Auns := unsigned(a);
Buns := unsigned(b);
Quns := Auns/Buns;
Runs := Auns rem Buns;
return std_logic_vector(Quns);
end function;
function divide2(a,b:std_logic_vector(3 downto 0))
return std_logic_vector is
variable Auns, Buns, Quns, Runs: unsigned(3 downto 0);
begin
Auns := unsigned(a);
Buns := unsigned(b);
Quns := Auns/Buns;
Runs := Auns rem Buns;
return std_logic_vector(Runs);
end function;
begin
process(a,b,alusel,clk)
variable temp: std_logic_vector(4 downto 0);
variable yv: std_logic_vector(3 downto 0);
variable cfv,zfv:std_logic;
variable m:std_logic_vector(7 downto 0);
variable q:std_logic_vector(3 downto 0);
variable r:std_logic_vector(3 downto 0);
begin
if(clk'event and clk='1')then
cf<='0';
ovf<='0';
temp:="00000";
zfv:='0';
case alusel is 
	when "00" =>
		temp:=('0'&a)+('0'&b);
		yv:=temp(3 downto 0);
		cfv:=temp(4);
		ovf<=yv(3) xor a(3) xor b(3) xor cfv;
		cf<=cfv;
		m:="00000000";
		q:="0000";
		r:="0000";
	when "01" =>
		temp:=('0'&a)-('0'&b);
		yv:=temp(3 downto 0);
		cfv:=temp(4);
		ovf<=yv(3) xor a(3) xor b(3) xor cfv;
		cf<=cfv;
		m:="00000000";
		q:="0000";
		r:="0000";
	when "10" =>
		m:=multiply(a,b);
		zfv:='1';
		yv:="0000";
		cf<='0';
		ovf<='0';
		q:="0000";
		r:="0000";
	when "11"=>
		q:=divide1(a,b);
		r:=divide2(a,b);
		yv:="0000";
		m:="00000000";
	when others=>
		yv:=a;
		m:="00000000";
		q:="0000";
		r:="0000";
end case;
for i in 0 to 3 loop
	zfv:=zfv or yv(i);
end loop;
y<=yv;
mul<=m;
quotient<=q;
remainder<=r;
zf<=not zfv;
nf<=yv(3);
end if;
end process;
end Behavioral;