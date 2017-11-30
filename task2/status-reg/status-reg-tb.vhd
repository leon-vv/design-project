library IEEE;
use IEEE.std_logic_1164.all;

entity status_reg_tb is
end entity;

architecture status_reg_tb_arch of status_reg_tb is

    component status_reg is
        port (
            D : in std_logic;
            CE : in std_logic;
            CLK : in std_logic;
            Q : out std_logic
        );
    end component;

    signal CLK : std_logic := '1';
    signal D, CE, Q: std_logic;
begin

    CLK <= not CLK after 30 ns;

    ff: status_reg port map(D, CE, CLK, Q);
    process begin

        for I in std_logic range '0' to '1' loop
            D <= I;
            
        for J in std_logic range '0' to '1' loop
            CE <= J;

            wait for 100 ns;
        end loop;
        end loop;

    end process;

end architecture status_reg_tb_arch;
