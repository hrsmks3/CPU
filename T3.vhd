library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Temp3 is
	port (d3 : IN STD_LOGIC_VECTOR(15 downto 0);	
				alu_out : IN STD_LOGIC_VECTOR(15 downto 0);
				current_state : IN STD_LOGIC_VECTOR(4 downto 0);
				Mem_D : IN STD_LOGIC_VECTOR(15 downto 0);
				output : OUT STD_LOGIC_VECTOR(15 downto 0));
				
end Temp3;

architecture beh of Temp3 is
  constant S1 : std_logic_vector(4 downto 0):= "00001";
  constant S4 : std_logic_vector(4 downto 0):= "00100";
  constant S7 : std_logic_vector(4 downto 0):= "00111";
  constant S8 : std_logic_vector(4 downto 0):= "01000";
  constant S10 : std_logic_vector(4 downto 0):= "01010";
  constant S14: STD_LOGIC_VECTOR(4 downto 0) := "01110";
  constant S15: STD_LOGIC_VECTOR(4 downto 0) := "01111";
  constant S22: STD_LOGIC_VECTOR(4 downto 0) := "10110";
  constant S23: STD_LOGIC_VECTOR(4 downto 0) := "10111";
  
  begin
    process (current_state, d3, alu_out)
    begin
      case current_state is
			
					
			when S1|S4|S7|S10|S15|S22|S23 =>
				output <= alu_out;
				
			when S8|S14 =>
				output <= Mem_D;
				
			when others =>
				output <= "0000000000000000";
				
				
      end case;
    end process;
end beh;
