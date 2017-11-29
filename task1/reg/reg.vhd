library IEEE;
use IEEE.std_logic_1164.all;

entity SRFF is
	port (
		S : in std_logic;
		R : in std_logic;
		CLK : in std_logic;
		RST : in std_logic;
		Q : out std_logic
	);
end entity;

architecture SRFF_arch of SRFF is
begin
	process(CLK, RST) is
	begin
		if RST = '1' then
			Q <= '0';
		elsif rising_edge(CLK) then
			if R = '1' then
				Q <= '0';
			elsif S = '1' then
				Q <= '1';
			end if;
		end if;
	end process;
end architecture SRFF_arch;

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
	component SRFF
		port (
		S : in std_logic;
		R : in std_logic;
		CLK : in std_logic;
		RST : in std_logic;
		Q : out std_logic
	);
	end component;
	signal S_ff : std_logic_vector(3 downto 0);
	signal R_ff : std_logic_vector(3 downto 0);
begin
	process(D) is
	begin
		for I in 0 to 3 loop
			S_ff(I) <= D(I) and CE;
			R_ff(I) <= (not D(I)) and CE;
		end loop;
	end process;

	gen_reg: for I in 0 to 3 generate
		sr: SRFF port map (
			S_ff(I),
			R_ff(I),
			C,
			R,
			Q(I)
		);
	end generate gen_reg;

end architecture reg_arch;
