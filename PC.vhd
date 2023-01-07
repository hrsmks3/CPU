library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity PC is
	port (d1 : IN STD_LOGIC_VECTOR(15 downto 0);
	d2 : IN STD_LOGIC_VECTOR(15 downto 0);
				alu_out: IN STD_LOGIC_VECTOR(15 downto 0);
				current_state : IN STD_LOGIC_VECTOR(4 downto 0);

				output : OUT STD_LOGIC_VECTOR(15 downto 0));
				
end PC;

architecture beh of PC is
  constant S1 : std_logic_vector(4 downto 0):= "00001";
  constant S16: STD_LOGIC_VECTOR(4 downto 0) := "10000";
  constant S18: STD_LOGIC_VECTOR(4 downto 0) := "10010";
  constant S24: STD_LOGIC_VECTOR(4 downto 0) := "11000";

  begin
    process (current_state,d2,alu_out)
    begin
      case current_state is
        when S1|S16 =>
				output <= alu_out;
					
			when S18 =>
				output <= d2;
			
			when S24 =>
				output <= d1;
				
			when others =>
				null;
				
				
      end case;
    end process;
end beh;
