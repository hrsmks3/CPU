library ieee;
use ieee.std_logic_1164.all;
 
entity shifter is
	port(
		state: in std_logic_vector(4 downto 0);
		
		SE7: in std_logic_vector(15 downto 0);
		B: out std_logic_vector(15 downto 0)
	);
end shifter;



architecture shift of shifter is

constant s19  : std_logic_vector(4 downto 0):= "10011";


function rot(A: in std_logic_vector(15 downto 0))
	return std_logic_vector is
		variable shift : std_logic_vector(15 downto 0):= (others=>'0');
	begin
		shift(15 downto 0):= A;
		
			shift(15 downto 7) := shift(8 downto 0);
			shift(6 downto 0) := "0000000";
		
	return shift;
end rot;

begin
process(state,SE7)
begin
	case state is
		
		when s19 =>
			B <= rot(SE7);
		when others => 
			null;
	end case;
end process;
end shift;