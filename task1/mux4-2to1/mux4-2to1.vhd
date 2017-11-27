library ieee;
use ieee.std_logic_1164.all;

entity mux4_2to1 is
    port(
        D0 : in std_logic_vector(0 to 3);
        D1 : in std_logic_vector(0 to 3);
        S : in std_logic;
        O : out std_logic_vector(0 to 3));
end mux4_2to1;

architecture mux4_2to1_arch of mux4_2to1 is

    component mux1_2to1 is 
        port(
            D0 : in std_logic;
            D1 : in std_logic;
            S : in std_logic;
            E : in std_logic;
            O : out std_logic);
    end component;

begin
    gen_mux: for I in 0 to 3 generate
        mux: mux1_2to1 port map(
                D0(I),
                D1(I),
                S,
                '1',
                O(I)
            );
    end generate gen_mux;

end mux4_2to1_arch;

