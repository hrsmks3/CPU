library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Temp2 is
	port (d2 : IN STD_LOGIC_VECTOR(15 downto 0);
				SE7 : IN STD_LOGIC_VECTOR(15 downto 0);
				SE10 : IN STD_LOGIC_VECTOR(15 downto 0);
				current_state : IN STD_LOGIC_VECTOR(4 downto 0);

				output : OUT STD_LOGIC_VECTOR(15 downto 0));
				
end Temp2;

architecture beh of Temp2 is
  constant S3 : std_logic_vector(4 downto 0):= "00011";
  constant S6: STD_LOGIC_VECTOR(4 downto 0) := "00110";
  constant S15: STD_LOGIC_VECTOR(4 downto 0) := "01111";
  constant S17: STD_LOGIC_VECTOR(4 downto 0) := "10001";
  constant S21: STD_LOGIC_VECTOR(4 downto 0) := "10101";
  
  begin
    process (current_state, d2, SE7, SE10)
    begin
      case current_state is
        when S3|S6 =>
				output <= d2;
					
			when S17 =>
				output <= SE7;
		      
			when S15|S21 =>
				output <= SE10;
				
			when others =>
				output <= "0000000000000000";
				
				
      end case;
    end process;
end beh;
