library IEEE;
use IEEE.std_logic_1164.all;

entity status_reg is
	port (
		D : in std_logic;
		CE : in std_logic;
		CLK : in std_logic;
		Q : out std_logic
	);

end entity;

architecture status_reg_arch of status_reg is
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

    signal not_D : std_logic;
begin

    not_D <= not D;

    ff: SR_flip_flop port map(D, not_D, CE, CLK, '0', Q);

end architecture;



