library ieee;
use ieee.std_logic_1164.all;

entity mux4_to_1_tb is
end mux4_to_1_tb;

architecture mux4_to_1_tb_arch of mux4_to_1_tb is

    component mux4_to_1 is
        port(
            i : in std_logic_vector(0 to 3);
            s : in std_logic_vector(0 to 1);
            y : out std_logic);
    end component;

    for mux : mux4_to_1 use entity work.mux4_to_1;
    signal i : std_logic_vector(0 to 3);
    signal s : std_logic_vector(0 to 1);
    signal y: std_logic;
begin

    mux: mux4_to_1 port map(i, s, y);

    process begin
        i <= "0101";
        s <= "00";
        wait for 100 ns;
        s <= "01";
        wait for 100 ns;
        s <= "10";
        wait for 100 ns;
        s <= "11";
        wait for 100 ns;
        i <= "1010";
        s <= "00";
        wait for 100 ns;
        s <= "01";
        wait for 100 ns;
        s <= "10";
        wait for 100 ns;
        s <= "11";
        wait for 100 ns;

    end process;

end mux4_to_1_tb_arch;


