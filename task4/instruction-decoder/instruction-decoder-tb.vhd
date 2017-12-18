library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instruction_decoder_tb is
end instruction_decoder_tb;

architecture instruction_decoder_tb_arch of instruction_decoder_tb is

    component instruction_decoder is
        port (
			OPC : in std_logic_vector(2 downto 0);
			control : out std_logic_vector(7 downto 0)
		);
    end component;

    for test_id : instruction_decoder use entity work.instruction_decoder;
    signal OPC : std_logic_vector(2 downto 0);
	signal control : std_logic_vector(7 downto 0);
begin

    test_id: instruction_decoder port map(OPC, control);

    process begin
		for I in 0 to 8 loop
			OPC <= std_logic_vector(to_unsigned(I, 3));
			wait for 100 ns;
		end loop;
    end process;

end instruction_decoder_tb_arch;
