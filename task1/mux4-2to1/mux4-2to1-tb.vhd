library ieee;
use ieee.std_logic_1164.all;

entity mux4_2to1_tb is
end mux4_2to1_tb;

architecture mux4_2to1_tb_arch of mux4_2to1_tb is

    component mux4_2to1 is
        port(
            D0 : in std_logic_vector(3 downto 0);
            D1 : in std_logic_vector(3 downto 0);
            S : in std_logic;
            O : out std_logic_vector(3 downto 0));
    end component;

    for mux : mux4_2to1 use entity work.mux4_2to1;
    signal D0 : std_logic_vector(3 downto 0);
    signal D1 : std_logic_vector(3 downto 0);
    signal S : std_logic;
    signal O: std_logic_vector(3 downto 0);
begin
    mux: mux4_2to1 port map(D0, D1, S, O);

    process begin
        D0 <= "0101";
        D1 <= "1010";
        S <= '0';
        wait for 100 ns;
        S <= '1';
        wait for 100 ns;
        S <= '0';
        wait for 100 ns;
        S <= '1';
        wait for 100 ns;
        S <= '0';
        wait for 100 ns;
        D0 <= "1111";
        wait for 100 ns;
        D1 <= "0000";
        S <= '1';
        wait for 100 ns;
    end process;

end mux4_2to1_tb_arch;


