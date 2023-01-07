library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity alu is
port( pc_out, t3_out, t1_out,t2_out: in std_logic_vector(15 downto 0);
alu_c: out std_logic_vector(15 downto 0);
carry_flag,zero_flag: out std_logic;
clk: in std_logic;
current_state : in std_logic_vector(4 downto 0)
);
end alu;




architecture func of alu is
constant S1 : std_logic_vector(4 downto 0):= "00001";
constant S4 : std_logic_vector(4 downto 0):= "00100";
constant S7 : std_logic_vector(4 downto 0):= "00111";
constant S10 : std_logic_vector(4 downto 0):= "01010";
constant S13: STD_LOGIC_VECTOR(4 downto 0) := "01101";
constant S15: STD_LOGIC_VECTOR(4 downto 0) := "01111";
constant S16: STD_LOGIC_VECTOR(4 downto 0) := "10000";
constant S22: STD_LOGIC_VECTOR(4 downto 0) := "10110";
constant S23: STD_LOGIC_VECTOR(4 downto 0) := "10111";





-----------------
function add(A: in std_logic_vector(15 downto 0); B: in std_logic_vector(15 downto 0))
return std_logic_vector is

variable sum,carry: std_logic_vector(16 downto 0) := (others => '0');
begin

sum(0):= A(0) xor B(0);
carry(0):= A(0) and B(0);
addit: for i in 1 to 15 loop
carry(i) := (A(i) and B(i)) or (carry(i-1) and A(i)) or (carry(i-1) and B(i));
sum(i) := carry(i - 1) xor A(i) xor B(i);
end loop addit;
sum(16) := carry(15);
return sum;
end add;
--------------
function sub(A: in std_logic_vector(15 downto 0); B: in std_logic_vector(15 downto 0))
return std_logic_vector is

variable diff,borr: std_logic_vector(16 downto 0) := (others => '0');

begin

diff(0):= A(0) xor B(0);
borr(0):= (not A(0)) and B(0);
diffit: for i in 1 to 15 loop
borr(i) := (borr(i-1) and (A(i) xnor B(i)) )or ( not(A(i)) and B(i) );
diff(i) := borr(i - 1) xor A(i) xor B(i);
end loop diffit;
diff(16) := borr(15);
return diff;
end sub;

signal op: std_logic_vector(2 downto 0) :="000";
signal alu_a, alu_b: std_logic_vector(15 downto 0) :="0000000000000000";



begin
alu1: process(clk,alu_a,alu_b,op) is
variable sum: std_logic_vector(16 downto 0);
variable diff: std_logic_vector(16 downto 0);
variable temp: std_logic_vector(15 downto 0);
variable subb,add1: std_logic_vector(15 downto 0);
begin
if falling_edge(clk) then
	if(op = "000") then
		temp := alu_a;
		carry_flag <= sum(16);
	elsif(op="001") then
		sum := add(alu_a,alu_b);
		temp := sum(15 downto 0);
		carry_flag <= sum(16);

	elsif(op = "010") then
		temp := alu_a nand alu_b;
		carry_flag <= sum(16);
	
	elsif(op = "011") then
		add1:= "0000000000000001";
		sum := add(alu_a,add1);
		temp := sum(15 downto 0);
		carry_flag <= sum(16);
	elsif(op = "100") then
		subb :="1111111111111111";
		sum := add(alu_a,subb);
		temp := sum(15 downto 0);
		carry_flag <= sum(16);
    elsif(op = "101") then
		
		diff:= sub(alu_a,alu_b);
		temp := diff(15 downto 0);
		carry_flag <= diff(16);    
end if;




if (to_integer(unsigned(temp)) = 0) then
zero_flag <= '1';
else zero_flag <= '0';
end if;
alu_C <= temp;



end if;
end process;



alu2:process(current_state)
begin
case current_state is
when S15|S22 =>
op <="100";
alu_a<=t3_out;

when S1=>
op <="011";
alu_a<=pc_out;

when S13=>
op <="011";
alu_a<=t1_out;

when S23 =>
op<="010";
alu_a<=t1_out;
alu_b<=t2_out;

when S4|S10 =>
op<="001";
alu_a<=t1_out;
alu_b<=t2_out;

when S16=>
op<="001";
alu_a<=t3_out;
alu_b<=t2_out;

when S7=>
op<="101";
alu_a<=t1_out;
alu_b<=t2_out;


when others =>
op<="000";
alu_a<="0000000000000000";
end case;



end process;



end architecture;