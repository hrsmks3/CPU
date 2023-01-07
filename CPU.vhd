library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use work.all;

entity IITB_CPU is
port(clk,rst: in std_logic;
		output: out std_logic);

end IITB_CPU;

architecture f of IITB_CPU is
signal instruction: std_logic_vector(15 downto 0);
signal C, Z:std_logic;
signal count_val: std_logic_vector(2 downto 0);
signal current_state: std_logic_vector(4 downto 0);

component datapath is
port(
current_state : in std_logic_vector(4 downto 0);
instruction: out std_logic_vector(15 downto 0);
clr, clk: in std_logic;
carry_flag, zero_flag: out std_logic;
count_output: out std_logic_vector(2 downto 0)
);
end component;

begin
datapath1: datapath port map(current_state => current_state, instruction => instruction, clk => clk, clr => rst, carry_flag => C, zero_flag => Z, count_output => count_val);
controller: entity work.fsm_controller port map(opcode => instruction(15 downto 12), CZ => instruction(7 downto 0),count => count_val ,C => C,Z=>Z ,clk=> clk, output => current_state);
end architecture;