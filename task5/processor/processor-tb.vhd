library ieee;
use ieee.std_logic_1164.all;

entity processor_tb is
end processor_tb;

architecture processor_tb_arch of processor_tb is

    component processor is
        port (
			data : in std_logic_vector(111 downto 0);
			CLK : in std_logic;
			RST : in std_logic;
			register_a : out std_logic_vector(3 downto 0);
			register_b : out std_logic_vector(3 downto 0)
		);
    end component;

    for test_processor : processor use entity work.processor;
    signal data : std_logic_vector(111 downto 0);
    signal CLK : std_logic;
    signal RST : std_logic;
    signal register_a : std_logic_vector(3 downto 0);
    signal register_b : std_logic_vector(3 downto 0);
begin

    test_processor: processor port map(data, CLK, RST, register_a, register_b);

    process begin
		CLK <= '0';
		
		-- X = 12, Y = 5
		data(6 downto 0)		<= "1000101"; -- LDA Y
		data(13 downto 7)		<= "0110000"; -- NOTA
		data(20 downto 14)		<= "1010001"; -- LDB 1
		data(27 downto 21)		<= "0000000"; -- ADDAB
		data(34 downto 28)		<= "1100000"; -- MAB
		data(41 downto 35)		<= "1001100"; -- LDA X
		data(48 downto 42)		<= "0010000"; -- SHRA
		data(55 downto 49)		<= "0000000"; -- ADDAB
		data(62 downto 56)		<= "1100000"; -- MAB
		data(69 downto 63)		<= "1100000"; -- 
		data(76 downto 70)		<= "1100000"; -- 
		data(83 downto 77)		<= "1100000"; -- 
		data(90 downto 84)		<= "1100000"; -- 
		data(97 downto 91)		<= "1100000"; -- 
		data(104 downto 98)		<= "1100000"; -- 
		data(111 downto 105)	<= "1100000"; -- 
		
		RST <= '1';
		wait for 100 ns;
		RST <= '0';
		wait for 100 ns;
		
		for I in 0 to 16 loop
			CLK <= '0';
			wait for 100 ns;
			CLK <= '1';
			wait for 100 ns;
		end loop;
		
		-- X = 10, Y = 11
		data(6 downto 0)		<= "1001011"; -- LDA Y
		data(13 downto 7)		<= "0110000"; -- NOTA
		data(20 downto 14)		<= "1010001"; -- LDB 1
		data(27 downto 21)		<= "0000000"; -- ADDAB
		data(34 downto 28)		<= "1100000"; -- MAB
		data(41 downto 35)		<= "1001010"; -- LDA X
		data(48 downto 42)		<= "0010000"; -- SHRA
		data(55 downto 49)		<= "0000000"; -- ADDAB
		data(62 downto 56)		<= "1100000"; -- MAB
		data(69 downto 63)		<= "1100000"; -- 
		data(76 downto 70)		<= "1100000"; -- 
		data(83 downto 77)		<= "1100000"; -- 
		data(90 downto 84)		<= "1100000"; -- 
		data(97 downto 91)		<= "1100000"; -- 
		data(104 downto 98)		<= "1100000"; -- 
		data(111 downto 105)	<= "1100000"; -- 
		
		RST <= '1';
		wait for 100 ns;
		RST <= '0';
		wait for 100 ns;
		
		for I in 0 to 16 loop
			CLK <= '0';
			wait for 100 ns;
			CLK <= '1';
			wait for 100 ns;
		end loop;
    end process;

end processor_tb_arch;
