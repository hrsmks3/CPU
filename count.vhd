library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity count is 
	port(	inc, rst: in std_logic;
			op: out std_logic_vector(2 downto 0));
end count;

architecture beh of count is 
begin
process(inc,rst)
variable addr: integer := 0;
begin
	addr := addr + 1;
	if (rst = '1' or addr = 8) then
		addr := 0;
	end if;
	op <= std_logic_vector(to_unsigned(addr,3));
end process;
end architecture;

