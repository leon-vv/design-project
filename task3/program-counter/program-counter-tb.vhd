library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity program_counter_tb is
end entity program_counter_tb;

architecture program_counter_tb_arch of program_counter_tb is

    component program_counter
        port (
            RomD : in std_logic_vector(3 downto 0);
            Carry : in std_logic;
            LD : in std_logic;
            CLK : in std_logic;
            RST : in std_logic;
            Q : out std_logic_vector(3 downto 0));
    end component;

    signal CLK : std_logic := '1';
    signal D : std_logic_vector(3 downto 0);
    signal Carry, LD, RST : std_logic;
    signal Q : std_logic_vector(3 downto 0);
begin

    CLK <= not CLK after 30 ns;

    counter : program_counter port map (D, Carry, LD, CLK, RST, Q);
    
    process begin
        for I in 0 to 100 loop
            D <= std_logic_vector(to_unsigned(I + 10, 4));

            -- Use prime numbers as mod to generate all combinations
            Carry <= std_logic(to_unsigned(I mod 2, 1)(0));
            LD <= std_logic(to_unsigned(I mod 3, 1)(0));
            RST <= std_logic(to_unsigned(I mod 5, 1)(0));
            wait for 100 ns;
        end loop;
    end process;

end architecture program_counter_tb_arch;


