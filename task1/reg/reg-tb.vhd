library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_tb is
end reg_tb;

architecture reg_tb_arch of reg_tb is

    component reg is
        port (
			D : in std_logic_vector(3 downto 0);
			CE : in std_logic;
			C : in std_logic;
			R : in std_logic;
			Q : out std_logic_vector(3 downto 0)
		);
    end component;

    for test_reg : reg use entity work.reg;
    signal D : std_logic_vector(3 downto 0);
	signal CE : std_logic;
	signal C : std_logic := '1';
	signal R : std_logic;
	signal Q : std_logic_vector(3 downto 0);
begin

    C <= not C after 30 ns;
    test_reg: reg port map(D, CE, C, R, Q);

    process begin

        for I in 0 to 15 loop
            D <= std_logic_vector(to_unsigned(I, 4));

            for I in std_logic range '0' to '1' loop
                CE <= I;

                for J in std_logic range '0' to '1' loop
                    R <= J;

                    wait for 100 ns;
                end loop;

            end loop;

        end loop;

    end process;

end reg_tb_arch;

