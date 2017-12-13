library IEEE;
use IEEE.std_logic_1164.all;

entity decoder_1to2 is
	port (
		S : in std_logic;
		E : in std_logic;
		A : out std_logic;
		B : out std_logic
	);
end entity;

architecture decoder_1to2_arch of decoder_1to2 is
begin
	process(S, E) is
	begin
		A <= (not S) and E;
		B <= S and E;
	end process;
end architecture decoder_1to2_arch;

library IEEE;
use IEEE.std_logic_1164.all;

entity decoder_4to16 is
	port (
		S : in std_logic_vector(3 downto 0);
		O : out std_logic_vector(15 downto 0)
	);
end entity;

architecture decoder_4to16_arch of decoder_4to16 is
	component decoder_1to2
		port (
			S : in std_logic;
			E : in std_logic;
			A : out std_logic;
			B : out std_logic
		);
	end component;
	signal L0 : std_logic_vector(1 downto 0);
	signal L1 : std_logic_vector(3 downto 0);
	signal L2 : std_logic_vector(7 downto 0);
	--signal L3 : std_logic_vector(15 downto 0);
begin
	gen_L0: for I in 0 to 0 generate
		dec: decoder_1to2 port map (
			S(3),
			'1',
			L0(2*I),
			L0(2*I+1)
		);
	end generate gen_L0;
	gen_L1: for I in 0 to 1 generate
		dec: decoder_1to2 port map (
			S(2),
			L0(I),
			L1(2*I),
			L1(2*I+1)
		);
	end generate gen_L1;
	gen_L2: for I in 0 to 3 generate
		dec: decoder_1to2 port map (
			S(1),
			L1(I),
			L2(2*I),
			L2(2*I+1)
		);
	end generate gen_L2;
	gen_O: for I in 0 to 7 generate
		dec: decoder_1to2 port map (
			S(0),
			L2(I),
			O(2*I),
			O(2*I+1)
		);
	end generate gen_O;
end architecture decoder_4to16_arch;

library IEEE;
use IEEE.std_logic_1164.all;

entity or_16 is
	port (
		X : in std_logic_vector(15 downto 0);
		Y : out std_logic
	);
end entity;

architecture or_16_arch of or_16 is
begin
	Y <= X(0) or X(1) or X(2) or X(3) or X(4) or x(5) or x(6) or x(7) or x(8) or x(9) or x(10) or x(11) or x(12) or x(13) or x(14) or x(15);
end architecture or_16_arch;

library IEEE;
use IEEE.std_logic_1164.all;

entity rom_16x7 is
	port (
		A : in std_logic_vector(3 downto 0);
		data : in std_logic_vector(111 downto 0);
		D : out std_logic_vector(6 downto 0)
	);
end entity;

architecture rom_16x7_arch of rom_16x7 is
	component decoder_4to16
		port (
			S : in std_logic_vector(3 downto 0);
			O : out std_logic_vector(15 downto 0)
		);
	end component;
	component or_16
		port (
			X : in std_logic_vector(15 downto 0);
			Y : out std_logic
		);
	end component;
	signal decoder_out : std_logic_vector(15 downto 0);
	signal or_in : std_logic_vector(111 downto 0);
begin
	decoder: decoder_4to16 port map (
		A,
		decoder_out
	);
	gen_or: for I in 0 to 6 generate
		or16: or_16 port map (
			or_in(I * 16 + 15 downto I * 16),
			D(I)
		);
	end generate;
	process(data, decoder_out) is
	begin
		for I in 0 to 15 loop
			for J in 0 to 6 loop
				or_in(J * 16 + I) <= data(I * 7 + J) and decoder_out(I);
			end loop;
		end loop;
	end process;
end architecture rom_16x7_arch;