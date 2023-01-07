library ieee;
use ieee.std_logic_1164.all;
entity DUT is

   port(input_vector: in std_logic_vector(0 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
   component IITB_RISC is
		port(clk,rst: in std_logic;
				dummy_output: out std_logic);

	end component IITB_RISC;
   signal output: std_logic_vector(0 downto 0);
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: IITB_RISC
			port map (
					-- order of inputs inp reset clock
					clk => input_vector(0),
					rst => '0',
					-- order of outputs outp
					dummy_output => output_vector(0));

end DutWrap;
