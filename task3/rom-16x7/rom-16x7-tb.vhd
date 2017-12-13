library ieee;
use ieee.std_logic_1164.all;

entity rom_16x7_tb is
end rom_16x7_tb;

architecture rom_16x7_tb_arch of rom_16x7_tb is

    component rom_16x7 is
        port (
			A : in std_logic_vector(3 downto 0);
			D : out std_logic_vector(6 downto 0);
			data : in std_logic_vector(111 downto 0)
		);
    end component;

    for test_rom : rom_16x7 use entity work.rom_16x7;
    signal A : std_logic_vector(3 downto 0);
	signal D2 : std_logic_vector(6 downto 0);
	signal data : std_logic_vector(111 downto 0);
begin

    test_rom: rom_16x7 port map(A, D2, data);

    process begin
		data(6 downto 0)		<= "0000001";
		data(13 downto 7)		<= "0000010";
		data(20 downto 14)		<= "0000100";
		data(27 downto 21)		<= "0001000";
		data(34 downto 28)		<= "0010000";
		data(41 downto 35)		<= "0100000";
		data(48 downto 42)		<= "1000000";
		data(55 downto 49)		<= "1111111";
		data(62 downto 56)		<= "1111110";
		data(69 downto 63)		<= "1111101";
		data(76 downto 70)		<= "1111011";
		data(83 downto 77)		<= "1110111";
		data(90 downto 84)		<= "1101111";
		data(97 downto 91)		<= "1011111";
		data(104 downto 98)		<= "0111111";
		data(111 downto 105)	<= "1010101";
	
		A <= "0000";
        wait for 100 ns;
		A <= "0001";
        wait for 100 ns;
		A <= "0010";
        wait for 100 ns;
		A <= "0011";
        wait for 100 ns;
		A <= "0100";
        wait for 100 ns;
		A <= "0101";
        wait for 100 ns;
		A <= "0110";
        wait for 100 ns;
		A <= "0111";
        wait for 100 ns;
		A <= "1000";
        wait for 100 ns;
		A <= "1001";
        wait for 100 ns;
		A <= "1010";
        wait for 100 ns;
		A <= "1011";
        wait for 100 ns;
		A <= "1100";
        wait for 100 ns;
		A <= "1101";
        wait for 100 ns;
		A <= "1110";
        wait for 100 ns;
		A <= "1111";
        wait for 100 ns;
    end process;

end rom_16x7_tb_arch;
