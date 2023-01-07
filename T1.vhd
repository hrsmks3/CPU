library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Temp1 is
	port (d1 : IN STD_LOGIC_VECTOR(15 downto 0);
				SE : IN STD_LOGIC_VECTOR(15 downto 0);
				alu_out : IN STD_LOGIC_VECTOR(15 downto 0);
				current_state : IN STD_LOGIC_VECTOR(4 downto 0);

				output : OUT STD_LOGIC_VECTOR(15 downto 0));
				
end Temp1;

architecture beh of Temp1 is
  constant S3 : std_logic_vector(4 downto 0):= "00011";
  constant S6: STD_LOGIC_VECTOR(4 downto 0) := "00110";
  constant S10: STD_LOGIC_VECTOR(4 downto 0) := "01010";
  constant S12: STD_LOGIC_VECTOR(4 downto 0) := "01100";
  constant S13: STD_LOGIC_VECTOR(4 downto 0) := "01101";
  constant S21: STD_LOGIC_VECTOR(4 downto 0) := "10101";

  begin
    process (current_state, d1,SE,alu_out)
    begin
      case current_state is
        when S3|S10|S12|S21 =>
				output <= d1;
			
					
			when S13 =>
				output <= alu_out;
				
				
			when S6 =>
				output <= SE;
				
				
			when others =>
				output <= "0000000000000000";
				
				
      end case;
    end process;
end beh;
