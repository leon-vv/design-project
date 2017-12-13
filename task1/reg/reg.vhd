library IEEE;
use IEEE.std_logic_1164.all;

entity reg is
	port (
		D : in std_logic_vector(3 downto 0);
		CE : in std_logic;
		C : in std_logic;
		R : in std_logic;
		Q : out std_logic_vector(3 downto 0)
	);
end entity;

architecture reg_arch of reg is
	component SR_flip_flop
		port (
		S : in std_logic;
		R : in std_logic;
		E : in std_logic;
		CLK : in std_logic;
		RST : in std_logic;
		Q : out std_logic
	);
	end component;

	signal S_ff : std_logic_vector(3 downto 0);
	signal R_ff : std_logic_vector(3 downto 0);
begin

    gen_signal:
    for I in 0 to 3 generate
        S_ff(I) <= D(I) and CE;
        R_ff(I) <= (not D(I)) and CE;
    end generate;

	gen_reg: for I in 0 to 3 generate
		sr: SR_flip_flop port map (
			S_ff(I),
			R_ff(I),
			'1',
			C,
			R,
			Q(I)
		);
	end generate gen_reg;

end architecture reg_arch;
