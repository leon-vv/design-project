library ieee;
use ieee.std_logic_1164.all;

entity mux1_2to1_tb is
end mux1_2to1_tb;

architecture mux1_2to1_tb_arch of mux1_2to1_tb is

    component mux1_2to1 is
        port(
            D0 : in std_logic;
            D1 : in std_logic;
            S : in std_logic;
            E : in std_logic;
            O : out std_logic);
    end component;

    for mux : mux1_2to1 use entity work.mux1_2to1;
    signal D0, D1, S, E, Y: std_logic;
begin

    mux: mux1_2to1 port map(D0, D1, S, E, Y);

    process begin
        D0 <= '1';
        D1 <= '0';
        E <= '1';
        S <= '1';
        wait for 100 ns;
        S <= '0';
        wait for 100 ns;
        E <= '0';
        wait for 100 ns;
        E <= '1';
        D0 <= '0';
        D1 <= '1';
        S <= '1';
        wait for 100 ns;
    end process;

end mux1_2to1_tb_arch;


