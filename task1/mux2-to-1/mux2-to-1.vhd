library ieee;
use ieee.std_logic_1164.all;

entity mux2_to_1 is
    port(
        i0 : in std_logic;
        i1 : in std_logic;
        s : in std_logic;
        e : in std_logic;
        y : out std_logic);
end mux2_to_1;

architecture mux2_to_1_arch of mux2_to_1 is
begin
    y <= (i1 and s and e) or (i0 and i1 and s and (not e)) or (i0 and (not s) and e);
end mux2_to_1_arch;

