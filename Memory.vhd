library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory is
--generic();
port(
Din: in std_logic_vector(15 downto 0);
Dout: out std_logic_vector(15 downto 0);
Addr: in std_logic_vector(5 downto 0);
clk,memory_write_enable: in std_logic
); 

--write_signal is one if we are writing to RF
end entity;

architecture beh of memory is
  type m is array(0 to 2**6 - 1) of std_logic_vector(15 downto 0);
  signal RAM: m:= (others=>x"0000");
begin

  proc : process (clk) is
  begin
  Dout <= RAM(to_integer(unsigned(Addr)));
    if falling_edge(clk) then

      if memory_write_enable = '1' then
        RAM(to_integer(unsigned(Addr))) <= Din;  -- Write

      end if;
    end if;
  end  process;
end  architecture;







