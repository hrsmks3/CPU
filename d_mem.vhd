library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity d_mem is
--generic();
port(
T1: in std_logic_vector(15 downto 0);
d2: in std_logic_vector(15 downto 0);
Dout: out std_logic_vector(15 downto 0);
Addr: in std_logic_vector(15 downto 0);
state: in std_logic_vector(4 downto 0);
clk: in std_logic
); 

--write_signal is one if we are writing to RF
end entity;

architecture beh of d_mem is
  type m is array(0 to 2**6 - 1) of std_logic_vector(15 downto 0);
  signal RAM: m;
begin
  
  proc : process (clk) is
  begin
  case state is 
	when "01000"|"01110"  =>
		Dout <= RAM(to_integer(unsigned(Addr)));
	when "01011" =>
		if falling_edge(clk) then
			RAM(to_integer(unsigned(Addr))) <= T1;  -- Write
		end if;
	when "10100" =>
		if falling_edge(clk) then
			RAM(to_integer(unsigned(Addr))) <= d2;  -- Write
		end if;
	when others =>
		null;
  end case;
  end process;
end architecture;







