library ieee;
use ieee.std_logic_1164.all;

entity mux2_to_1 is
    port(
        D0 : in std_logic;
        D1 : in std_logic;
        S : in std_logic;
        E : in std_logic;
        O : out std_logic);
end mux2_to_1;

architecture mux2_to_1_arch of mux2_to_1 is
begin
    O <= (D1 and S and E) or (D0 and D1 and S and (not E)) or (D0 and (not S) and E);
end mux2_to_1_arch;

