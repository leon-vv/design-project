library IEEE;
use IEEE.std_logic_1164.all;

entity instruction_decoder is
	port (
		OPC : in std_logic_vector(2 downto 0);
		control : out std_logic_vector(7 downto 0)
	);
end entity;

--- Instruction set:
--- 0xx		ALU operation xx stored in register A
--- 000		ADDAB
--- 001		SHLA
--- 010		SHRA
--- 011		NOTA
--- 100		LDA
--- 101		LDB
--- 110		MAB
--- 111		JC

architecture instruction_decoder_arch of instruction_decoder is
	signal REG_B_CE : std_logic;
	signal REG_A_CE : std_logic;
	signal MUX_B_S : std_logic;
	signal MUX_A_S : std_logic;
	signal ALU_S : std_logic_vector(1 downto 0);
	signal PC_LD : std_logic;
	signal Status_CE : std_logic;
begin
	ALU_S <= OPC(1 downto 0);
	Status_CE <= not OPC(2);
	
	REG_A_CE <= (not OPC(2)) or (OPC(0) nor OPC(1));
	MUX_A_S <= OPC(2);
	
	REG_B_CE <= OPC(2) and (OPC(0) xor OPC(1));
	MUX_B_S <= OPC(0);
	
	PC_LD <= OPC(2) and OPC(0) and OPC(1);
	
	control(0) <= REG_B_CE;
	control(1) <= REG_A_CE;
	control(2) <= MUX_B_S;
	control(3) <= MUX_A_S;
	control(5 downto 4) <= ALU_S;
	control(6) <= PC_LD;
	control(7) <= Status_CE;
end architecture instruction_decoder_arch;