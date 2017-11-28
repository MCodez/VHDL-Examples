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

entity lfsrmain is
    Port ( clk : in  STD_LOGIC;
           r_out : out  STD_LOGIC_VECTOR (7 downto 0);
           reset : in  STD_LOGIC);
end lfsrmain;

architecture Behavioral of lfsrmain is
signal temp:std_logic:='0';
signal ff:std_logic_vector(7 downto 0);
begin
temp<=ff(0) xor ff(2) xor ff(3) xor ff(4);
process(clk,reset) begin
if reset='1' then
ff<="00000001";
elsif rising_edge(clk) then
ff<=temp & ff(7 downto 1);
end if;
end process;
r_out<=ff;

end Behavioral;