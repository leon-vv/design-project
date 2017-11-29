library IEEE;
use IEEE.std_logic_1164.all;

entity adder is
	port (
		A : in std_logic;
		B : in std_logic;
		Cin : in std_logic;
		S : out std_logic;
		Cout : out std_logic
	);
end entity;

architecture adder_arch of adder is
begin
    S <= (A xor B) xor Cin;
    Cout <= ((A xor B) and Cin) or (A and B);
end architecture adder_arch;

library IEEE;
use IEEE.std_logic_1164.all;

entity alu is
	port (
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		S : in std_logic_vector(1 downto 0);
		res : out std_logic_vector(3 downto 0);
		CO : out std_logic
	);
end entity;

architecture alu_arch of alu is
	component adder
		port (
		A : in std_logic;
		B : in std_logic;
		Cin : in std_logic;
		S : out std_logic;
		Cout : out std_logic
	);
	end component;

	signal shl : std_logic_vector(3 downto 0);
	signal shr : std_logic_vector(3 downto 0);
	signal add : std_logic_vector(3 downto 0);
	signal carry : std_logic_vector(3 downto 0);
	signal comp : std_logic_vector(3 downto 0);
begin

	gen_alu:
	for I in 0 to 3 generate

		gen_shiftl:
		case I generate
			when 1 to 3 => shl(I) <= A(I - 1);
			when 0 => shl(0) <= '0';
		end generate;

		gen_shiftr:
		case I generate
			when 0 to 2 => shr(I) <= A(I + 1);
			when 3 => shr(I) <= '0';
		end generate;

		comp(I) <= not A(I);

		res(I) <=
			(add(I) and (s(0) nor s(1))) or
			(shl(I) and (not s(0) and s(1))) or
			(shr(I) and (s(0) and not s(1))) or
			(comp(I) and (s(0) and s(1)));

	end generate gen_alu;

	adder_0: adder port map (
		A(0),
		B(0),
		'0',
		add(0),
		carry(0)
	);

	gen_adder: for I in 1 to 3 generate
		adder_i: adder port map (
			A(I),
			B(I),
			carry(I - 1),
			add(I),
			carry(I)
		);
	end generate gen_adder;

    CO <= carry(3);

end architecture alu_arch;
