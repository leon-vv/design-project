library IEEE;
use IEEE.std_logic_1164.all;

entity program_counter is
    port (
        RomD : in std_logic_vector(3 downto 0);
        Carry : in std_logic;
        LD : in std_logic;
        CLK : in std_logic;
        RST : in std_logic;
        Q : out std_logic_vector(3 downto 0));

end entity program_counter;

architecture program_counter_arch of program_counter is

	component four_adder
        port (
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            Cin : in std_logic;
            Y : out std_logic_vector(3 downto 0);
            CO : out std_logic);
	end component;

    component SR_flip_flop 
        port (
            S : in std_logic;
            R : in std_logic;
            E : in std_logic;
            CLK : in std_logic;
            RST : in std_logic;
            Q : out std_logic);
    end component;

    component mux4_2to1
        port(
            D0 : in std_logic_vector(3 downto 0);
            D1 : in std_logic_vector(3 downto 0);
            S : in std_logic;
            O : out std_logic_vector(3 downto 0));
    end component;

    -- Select for MUX
    signal sel : std_logic;
    signal adder_out : std_logic_vector(3 downto 0);
    signal mux_out : std_logic_vector(3 downto 0);
    signal mux_out_inverted : std_logic_vector(3 downto 0);
    signal state : std_logic_vector(3 downto 0);
begin

    sel <= Carry and LD;

    increment: four_adder port map (state, "0000", '1', adder_out, open);

    mux: mux4_2to1 port map (adder_out, RomD, sel, mux_out);

    gen_state: for I in 0 to 3 generate
        Q(I) <= state(I);
        mux_out_inverted(I) <= not mux_out(I);
        sr : SR_flip_flop port map (
                mux_out(I),
                mux_out_inverted(I),
                '1',
                CLK,
                RST,
                state(I));
    end generate;

end architecture program_counter_arch;
        

