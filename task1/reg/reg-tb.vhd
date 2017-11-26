library ieee;
use ieee.std_logic_1164.all;

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
	signal C : std_logic;
	signal R : std_logic;
	signal Q : std_logic_vector(3 downto 0);
begin

    test_reg: reg port map(D, CE, C, R, Q);

    process begin
		CE <= '1';
        R <= '1';
		C <= '0';
        wait for 100 ns;
		R <= '0';
        D <= "1010";
		wait for 100 ns;
		C <= '1';
		wait for 100 ns;
		C <= '0';
		wait for 100 ns;
		R <= '1';
		C <= '1';
		wait for 100 ns;
		C <= '0';
		R <= '0';
        wait for 100 ns;
        D <= "0101";
		wait for 100 ns;
		C <= '1';
		wait for 100 ns;
		C <= '0';
		CE <= '0';
		wait for 100 ns;
		C <= '1';
		wait for 100 ns;
		C <= '0';
		wait for 100 ns;
		C <= '1';
		wait for 100 ns;
		C <= '0';
		CE <= '1';
		wait for 100 ns;
		D <= "1001";
		wait for 100 ns;
		C <= '1';
		wait for 100 ns;
		CE <= '0';
		C <= '0';
		wait for 100 ns;
		C <= '1';
		wait for 100 ns;

    end process;

end reg_tb_arch;
