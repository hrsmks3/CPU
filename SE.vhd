library ieee;
use ieee.std_logic_1164.all;

entity SE is 
	generic(
		extend : integer := 10
	);
	port(
		A: in std_logic_vector(15-extend downto 0);
		B: out std_logic_vector(15 downto 0)
	);
end SE;

architecture se of SE is
begin 
process(A)
variable temp: std_logic_vector(15 downto 0):= (others => '0');
variable ones: std_logic_vector(extend-1 downto 0):= (others => '1');
begin
	temp(15-extend downto 0) := A;
	if A(15-extend) = '1' then
		temp(15 downto 16-extend) := ones;
	end if;
	B <= temp;
end process;
end architecture;

--SE: entity work.se port map (A <= , B <= );