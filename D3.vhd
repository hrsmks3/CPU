library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity D3 is
	port (t3 : IN STD_LOGIC_VECTOR(15 downto 0);
				Shifter : IN STD_LOGIC_VECTOR(15 downto 0);
				PC : IN STD_LOGIC_VECTOR(15 downto 0);
				current_state : IN STD_LOGIC_VECTOR(4 downto 0);

				output : OUT STD_LOGIC_VECTOR(15 downto 0));
end D3;


architecture beh of D3 is
  constant S2 : std_logic_vector(4 downto 0):= "00010";
  constant S5 : std_logic_vector(4 downto 0):= "00101";
  constant S9 : std_logic_vector(4 downto 0):= "01001";
  constant S17: STD_LOGIC_VECTOR(4 downto 0) := "10001";
  constant S18: STD_LOGIC_VECTOR(4 downto 0) := "10010";
  constant S19: STD_LOGIC_VECTOR(4 downto 0) := "10011";

  begin
    process (current_state, t3, Shifter, PC)
    begin
      case current_state is
         when S2 =>
				output <= PC;
					
			when S5|S9|S17|S18 =>
				output <= t3;
				
			when S19 =>
				output <= Shifter;
				
			when others =>
				output <= "0000000000000000";
				
      end case;
    end process;
end beh;
