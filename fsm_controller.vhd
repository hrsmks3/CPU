library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm_controller is
port(	
		opcode:in std_logic_vector(3 downto 0);
		CZ: in std_logic_vector(7 downto 0);
		count: in std_logic_vector(2 downto 0);
		C,Z : in std_logic;
		clk:in std_logic;
		output: out std_logic_vector(4 downto 0)
	);
end fsm_controller;

architecture state_machine of fsm_controller is

constant s1  : std_logic_vector(4 downto 0):= "00001";  
constant s2  : std_logic_vector(4 downto 0):= "00010";
constant s3  : std_logic_vector(4 downto 0):= "00011";
constant s4  : std_logic_vector(4 downto 0):= "00100";
constant s5  : std_logic_vector(4 downto 0):= "00101";
constant s6  : std_logic_vector(4 downto 0):= "00110";
constant s7  : std_logic_vector(4 downto 0):= "00111";
constant s8  : std_logic_vector(4 downto 0):= "01000";
constant s9  : std_logic_vector(4 downto 0):= "01001";  
constant s10 : std_logic_vector(4 downto 0):= "01010";
constant s11 : std_logic_vector(4 downto 0):= "01011";
constant s12 : std_logic_vector(4 downto 0):= "01100";
constant s13 : std_logic_vector(4 downto 0):= "01101";
constant s14 : std_logic_vector(4 downto 0):= "01110";
constant s15 : std_logic_vector(4 downto 0):= "01111";
constant s16 : std_logic_vector(4 downto 0):= "10000";
constant s17 : std_logic_vector(4 downto 0):= "10001";  
constant s18 : std_logic_vector(4 downto 0):= "10010";
constant s19 : std_logic_vector(4 downto 0):= "10011";
constant s20 : std_logic_vector(4 downto 0):= "10100";
constant s21 : std_logic_vector(4 downto 0):= "10101";
constant s22 : std_logic_vector(4 downto 0):= "10110";
constant s23 : std_logic_vector(4 downto 0):= "10111";
constant S24: STD_LOGIC_VECTOR(4 downto 0) := "11000";


signal y_present: std_logic_vector(4 downto 0) :=s24;
signal y_next: std_logic_vector(4 downto 0) :=s24;

begin
output <= y_present;
update: process(clk)
begin
	if(falling_edge(clk)) then
		y_present <= y_next;
	end if;
end process;

next_state:process(y_present,opcode)
begin
	case y_present is
	      when s24 =>
				y_next<=s1;
	 
			when s1=>
				case opcode is
					when "1100" =>		--beq
						y_next<=s3;   
					when "1000" =>      --jal
						y_next<=s17;
					when "1001" =>		--jlr
						y_next<=s22	;   
					when others =>
						y_next<=s2;
				end case;
				
			when s2=>
				case opcode is
					when "0001" =>		--adi  
						y_next<=s21;
					when "0011" =>      --lhi 
						y_next<=s19;    
					when "0100" | "0101" => 		--lw/sw
						y_next<=s6;
					when "0110" | "0111" => 		--lm/sm
						y_next<=s12;
					when "1100" | "1000"|"1001" => 		--beq/jal/jlr
						y_next<=s24;	
					when others =>		--add/nand
						if((CZ(1 downto 0) = "01" and Z = '0') or (CZ(1 downto 0) = "10" and C = '0')) then 
							y_next<=s24;
						else
							y_next<=s3;
						end if;
				end case;
				
			when s3 =>
				case opcode is
					when "1100" =>		--beq
						y_next<=s7;
					when "0010" =>		--nand
						y_next<=s23;	
					when others =>
						y_next<=s4;
				end case;
					
			
			when s4 =>
				case opcode is
					when "0100" => 		--lw
						y_next<=s8;
					when others =>		
						y_next<=s5;
				end case;
				
			when s5 =>
				y_next<=s24;
			
			when s6 =>
				case opcode is
					when "0100" => 		--lw
						y_next<=s4;
					when others =>		
						y_next<=s10;
				end case;
			
			when s7 =>
				if Z = '0' then
					y_next<=s2;	
				else 
					y_next<=s15;
				end if;
				
			when s8 =>
				y_next<=s9;
				
			when s9 =>
				y_next<=s24;
				
			when s10 =>
				y_next<=s11;
				
			when s11 =>
				y_next<=s24;
				
			when s12 =>
				y_next<=s13;
				
			when s13 =>
				case opcode is 
					when "0110" =>
			         
				       		--lm
					L1: for i in 0 to 7 loop
		             if CZ(i) = '1' then
	                 					 
						y_next<=s14;
						else 
						y_next<=s13;
						end if;
						end loop L1;
					when others =>
		            L2: for i in 0 to 7 loop
		             if CZ(i) = '1' then
	                 					 
						y_next<=s20;
						else 
						y_next<=s13;
						end if;
						end loop L2;  			
						
				end case;
				
			when s14 =>
			 if count = "000" then
				y_next<=s24;
			else 
		      y_next<=s13;     	
			end if;
			
			when s15 =>
				y_next<=s16;
				
			when s16 => 
				
					y_next<=s2;
				
				
			when s17 =>
				
					y_next<=s22;
				
			
			when s18 =>
				y_next<=s2;
			
			when s19 =>
				y_next<=s24;
			
			when s20 => 
				 if count = "000" then
				y_next<=s24;
			else 
		      y_next<=s13;     	
			end if;
			
			when s21 =>
				y_next<=s4;
			
			when s22 =>
				case opcode is
					when "1000" => 		--jal
						y_next<=s16;
					when others =>		
						y_next<=s18;
				end case;
				
			when s23 =>
				y_next<=s5;
			
			
			when others =>
				y_next <= s24;
				
		end case;
end process;
end architecture;