library IEEE;
use IEEE.std_logic_1164.all;

entity SR_flip_flop is
	port (
		S : in std_logic;
		R : in std_logic;
		CLK : in std_logic;
		RST : in std_logic;
		Q : out std_logic
	);
end entity;

architecture SR_flip_flop_arch of SR_flip_flop is
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

end architecture SR_flip_flop_arch;


