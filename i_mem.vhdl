library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity i_mem is
port(
Dout: out std_logic_vector(15 downto 0);
Addr: in std_logic_vector(15 downto 0);
state: in std_logic_vector(4 downto 0);
clk: in std_logic
); 

--write_signal is one if we are writing to RF
end entity;

architecture beh of i_mem is
  type m is array(0 to 2**6 - 1) of std_logic_vector(15 downto 0);
  signal RAM: m:= ( 
					0 => "0000000001010000",
					
					others=>x"0000"
				  );
begin
  
  proc : process (clk) is
  begin
  if state = "00001" then
	Dout <= RAM(to_integer(unsigned(Addr)));
  end if;
  end process;
end architecture;







