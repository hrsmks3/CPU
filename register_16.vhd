library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_16 is
	port(
		Din: in std_logic_vector(15 downto 0);
		R_in: in std_logic_vector(15 downto 0);
		Dout: out std_logic_vector(15 downto 0);
		clk, write_signal, clr: in std_logic);
		
end entity;

architecture beh of register_16 is
signal temp1 : std_logic_vector(15 downto 0) :="0000000000000000";
begin
	process(clk, clr)	
	begin
	   Dout <= (others => '0');
		if(falling_edge(clk)) then
			if(write_signal = '1') then
			temp1 <= Din;
			else 
			temp1 <= R_in;
			end if;
	
		end if;
		
		if(clr = '1') then
			temp1 <= (others => '0');
		end if;
		Dout<=temp1;
	end process;
	
end beh;		

--reg: entity work.register_16(beh) port map(Din<= ,Dout<=, clk<= ,write_signal<= ,clr<=);