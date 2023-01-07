library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity IR is
	port (Mem_d : IN STD_LOGIC_VECTOR(15 downto 0);
				current_state : IN STD_LOGIC_VECTOR(4 downto 0);

				output : OUT STD_LOGIC_VECTOR(15 downto 0));
			
end IR;

--IR: entity work.IR port map(Mem_d <= ,current_state <= ,output <= ,ir_write); 
architecture beh of IR is
  constant S1 : std_logic_vector(4 downto 0):= "00001";  

  begin
    process (current_state, Mem_d)
    begin
      case current_state is
        when S1 =>
				output <= Mem_d;
				
			when others =>
				output <= "0000000000000000";
				
				
				
      end case;
    end process;
end beh;
