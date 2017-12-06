library IEEE;
use IEEE.std_logic_1164.all;

entity 4_adder is
    port (
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        Cin : in std_logic_vector;
        Y : out std_logic_vector(3 downto 0);
        CO : out std_logic_vector);
end entity;

architecture 4_adder of 4_adder_arch is
    component adder
		port (
		A : in std_logic;
		B : in std_logic;
		Cin : in std_logic;
		S : out std_logic;
		Cout : out std_logic);
	end component;

    signal add : std_logic_vector(3 downto 0); 
	signal carry : std_logic_vector(3 downto 0);
begin

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

end architecture 4_adder_arch;

