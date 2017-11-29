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
	process(A, B, Cin) is
	begin
		S <= (A xor B) xor Cin;
		Cout <= ((A xor B) and Cin) or (A and B);
	end process;
end architecture adder_arch;

library IEEE;
use IEEE.std_logic_1164.all;

entity alu is
	port (
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		S0 : in std_logic;
		S1 : in std_logic;
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
	signal carry : std_logic_vector(2 downto 0);
	signal comp : std_logic_vector(3 downto 0);
begin
	process(A, B, S0, S1) is
	begin
		for I in 0 to 3 loop
			if I > 0 then
				shl(I) <= A(I - 1);
			else
				shl(I) <= '0';
			end if;
			if I < 3 then
				shr(I) <= A(I + 1);
			else
				shr(I) <= '0';
			end if;
			comp(I) <= not A(I);
			res(I) <=
				(add(I) and (S0 nor S1)) or
				(shl(I) and (not S0 and S1)) or
				(shr(I) and (S0 and not S1)) or
				(comp(I) and (S0 and S1));
		end loop;
	end process;
	adder_0: adder port map (
		A(0),
		B(0),
		'0',
		add(0),
		carry(0)
	);
	gen_alu: for I in 1 to 3 generate
		adder_i: adder port map (
			A(I),
			B(I),
			carry(I - 1),
			add(I),
			carry(I)
		);
	end generate gen_alu;
end architecture alu_arch;