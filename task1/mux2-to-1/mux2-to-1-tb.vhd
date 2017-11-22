library ieee;
use ieee.std_logic_1164.all;

entity mux2_to_1_tb is
end mux2_to_1_tb;

architecture mux2_to_1_tb_arch of mux2_to_1_tb is

    component mux2_to_1 is
        port(
            i0 : in std_logic;
            i1 : in std_logic;
            s : in std_logic;
            e : in std_logic;
            y : out std_logic);
    end component;

    for mux : mux2_to_1 use entity work.mux2_to_1;
    signal i0, i1, s, e, y: std_logic;
begin

    mux: mux2_to_1 port map(i0, i1, s, e, y);

    process begin
        i0 <= '0';
        i1 <= '1';
        s <= '1';
        e <= '1';
        wait for 100 ns;
        e <= '0';
        wait for 100 ns;
        e <= '1';
        i0 <= '1';
        s <= '0';
        wait for 100 ns;
    end process;
end mux2_to_1_tb_arch;


