library IEEE;
use IEEE.std_logic_1164.all;

entity four_adder is
    port (
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        Y : out std_logic_vector(3 downto 0);
        CO : out std_logic);
end entity;

architecture four_adder_arch of four_adder is
    component full_adder
		port (
		A : in std_logic;
		B : in std_logic;
		Cin : in std_logic;
		S : out std_logic;
		Cout : out std_logic);
	end component;

	signal carry : std_logic_vector(3 downto 0);
begin

	adder_0: full_adder port map (
		A(0),
		B(0),
		Cin,
		Y(0),
		carry(0)
	);

	gen_adder: for I in 1 to 3 generate
		adder_i: full_adder port map (
			A(I),
			B(I),
			carry(I - 1),
			Y(I),
			carry(I)
		);
	end generate gen_adder;

    CO <= carry(3);

end architecture four_adder_arch;

