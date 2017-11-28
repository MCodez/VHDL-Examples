TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
ENTITY aluvhdltestbench IS
END aluvhdltestbench;
 ARCHITECTURE behavior OF aluvhdltestbench IS 
    COMPONENT alumodule
    PORT(
         alusel : IN  std_logic_vector(1 downto 0);
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         y : OUT  std_logic_vector(3 downto 0);
         nf : OUT  std_logic;
         zf : OUT  std_logic;
         cf : OUT  std_logic;
         ovf : OUT  std_logic;
			clk: IN std_logic;
         mul : OUT  std_logic_vector(7 downto 0);
			quotient:OUT std_logic_vector(3 downto 0);
			remainder:OUT std_logic_vector(3 downto 0)
        );
    END COMPONENT;
   signal alusel : std_logic_vector(1 downto 0) := "00";
   signal a : std_logic_vector(3 downto 0) := "0100";
   signal b : std_logic_vector(3 downto 0) := "1110";
	signal clk: std_logic:='0';
   signal y : std_logic_vector(3 downto 0);
   signal nf : std_logic;
   signal zf : std_logic;
   signal cf : std_logic;
   signal ovf : std_logic;
   signal mul : std_logic_vector(7 downto 0);
	signal quotient:std_logic_vector(3 downto 0);
	signal remainder:std_logic_vector(3 downto 0);
BEGIN
   uut: alumodule PORT MAP (
          alusel => alusel,
          a => a,
          b => b,
          y => y,
          nf => nf,
          zf => zf,
          cf => cf,
			 clk => clk,
          ovf => ovf,
          mul => mul,
			 quotient => quotient,
			 remainder => remainder
        );
   a_proc: process
   begin		
      wait for 100 ns;
			a<=a+'1';
			wait for 100 ns;
   end process;
	b_proc:process
	begin
	wait for 100 ns;
	b<=b-'1';
	wait for 100 ns;
	end process;
	alusel_proc:process
	begin
	wait for 100 ns;
	alusel<=alusel+'1';
	wait for 100 ns;
	end process;
	clk_proc:process
	begin
	wait for 5 ns;
	clk<=not clk;
	wait for 95 ns;
	end process;
END;
