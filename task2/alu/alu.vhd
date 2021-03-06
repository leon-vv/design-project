library IEEE;
use IEEE.std_logic_1164.all;

entity alu is
	port (
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		S : in std_logic_vector(1 downto 0);
		res : out std_logic_vector(3 downto 0);
		CO : out std_logic);
end entity;

architecture alu_arch of alu is
	component four_adder
        port (
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            Cin : in std_logic;
            Y : out std_logic_vector(3 downto 0);
            CO : out std_logic);
	end component;

	signal shl : std_logic_vector(3 downto 0);
	signal shr : std_logic_vector(3 downto 0);
	signal comp : std_logic_vector(3 downto 0);
	signal add_out : std_logic_vector(3 downto 0);
begin

    adder : four_adder port map (A, B, '0', add_out, CO);

	shl(0) <= '0';
	shr(3) <= '0';
	
	gen_alu:
	for I in 0 to 3 generate

		gen_shiftl: if I > 0 generate
			shl(I) <= A(I - 1);
		end generate;

		gen_shiftr: if I < 3 generate
			shr(I) <= A(I + 1);
		end generate;

		comp(I) <= not A(I);

		res(I) <=
			(add_out(I) and (s(0) nor s(1))) or
			(shl(I) and (not s(0) and s(1))) or
			(shr(I) and (s(0) and not s(1))) or
			(comp(I) and (s(0) and s(1)));

	end generate gen_alu;

end architecture alu_arch;
