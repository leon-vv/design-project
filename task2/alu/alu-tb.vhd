library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu_tb is
end entity;

architecture alu_tb_arch of alu_tb is

    component alu
        port (
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            S : in std_logic_vector(1 downto 0);
            res : out std_logic_vector(3 downto 0);
            CO : out std_logic
        );
    end component;

    signal A : std_logic_vector(3 downto 0);
    signal B : std_logic_vector(3 downto 0);
    signal S : std_logic_vector(1 downto 0);
    signal res : std_logic_vector(3 downto 0);
    signal CO : std_logic;

begin
    
    -- ALU component
    alu_comp : alu port map (A, B, S, res, CO);

    process begin

        for I in 0 to 13 loop
            A <= std_logic_vector(to_unsigned(I, 4));
            B <= std_logic_vector(to_unsigned(I + 2, 4));

            S <= "00";
            wait for 100 ns;
            S <= "01";
            wait for 100 ns;
            S <= "10";
            wait for 100 ns;
            S <= "11";
            wait for 100 ns;

        end loop;
    end process;

end architecture;
