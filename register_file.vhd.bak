library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
entity register_file is
--generic();
port(
D3: in std_logic_vector(15 downto 0);
D1,D2: out std_logic_vector(15 downto 0);
A1,A2,A3: in std_logic_vector(2 downto 0);
clk,write_signal,clr: in std_logic
); 

--write_signal is one if we are writing to RF
end entity;


architecture beh of register_file is
  type r is array(0 to 7) of std_logic_vector(15 downto 0);
  signal registers : r;
  signal reg_sel: std_logic_vector(7 downto 0);
 
  --signal registers : r:= (others=>x"0000");
begin

   map_registers: 
	for i in 0 to 7 generate
	  reg: entity work.register_16(beh) port map(Din => D3,Dout =>registers(i), clk=>clk ,write_signal=>reg_sel(i) ,clr=>clr);
	end generate map_registers;
  proc : process (A3,write_signal) is
  begin

		reg_sel <= (others => '0');
		reg_sel(to_integer(unsigned(A3))) <= write_signal;	

	end process;
	
	D1 <= registers(to_integer(unsigned(A1)));
	D2 <= registers(to_integer(unsigned(A2)));

end  architecture;







