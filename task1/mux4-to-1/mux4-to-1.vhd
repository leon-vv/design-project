library ieee;
use ieee.std_logic_1164.all;

entity mux4_to_1 is
    port(
        i : in std_logic_vector(0 to 3);
        s : in std_logic_vector(0 to 1);
        y : out std_logic);
end mux4_to_1;

architecture mux4_to_1_arch of mux4_to_1 is

    component mux2_to_1 is 
        port(
            i0 : in std_logic;
            i1 : in std_logic;
            s : in std_logic;
            e : in std_logic;
            y : out std_logic);
    end component;

    for mux_a : mux2_to_1 use entity work.mux2_to_1;
    for mux_b : mux2_to_1 use entity work.mux2_to_1;

    signal ns0, a, b: std_logic;
begin
    ns0 <= not s(0);
    mux_a : mux2_to_1 port map(i(1), i(0), s(1), s(0), a);
    mux_b : mux2_to_1 port map(i(3), i(2), s(1), ns0, b);

    y <= a or b;
end mux4_to_1_arch;

