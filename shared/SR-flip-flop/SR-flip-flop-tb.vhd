library IEEE;
use IEEE.std_logic_1164.all;

entity SR_flip_flop_tb is
end entity;

architecture SR_flip_flop_tb_arch of SR_flip_flop_tb is

    component SR_flip_flop is
        port (
            S : in std_logic;
            R : in std_logic;
            CLK : in std_logic;
            RST : in std_logic;
            Q : out std_logic
        );
    end component;

    signal CLK : std_logic := '1';
    signal S, R, RST, Q: std_logic;
begin

    CLK <= not CLK after 25 ns;

    ff: SR_flip_flop port map(S, R, CLK, RST, Q);
    process begin

        for I in std_logic range '0' to '1' loop
            S <= I;
            
        for J in std_logic range '0' to '1' loop
            R <= J;

        for K in std_logic range '0' to '1' loop
            RST <= K;

            wait for 100 ns;
        end loop;
        end loop;
        end loop;

    end process;

end architecture SR_flip_flop_tb_arch;
