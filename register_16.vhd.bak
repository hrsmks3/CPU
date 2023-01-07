library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_16 is
	port(
		Din: in std_logic_vector(15 downto 0);
		Dout: out std_logic_vector(15 downto 0);
		clk, write_signal, clr: in std_logic);
		
end entity;

architecture beh of register_16 is
begin
	process(clk, clr)	
	begin
		if(falling_edge(clk) and write_signal = '1') then
		Dout <= Din;
		end if;
		
		if(clr = '1') then
			Dout <= (others => '0');
		end if;
	end process;
	
end beh;		

--reg: entity work.register_16(beh) port map(Din<= ,Dout<=, clk<= ,write_signal<= ,clr<=);