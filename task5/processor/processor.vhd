library ieee;
use ieee.std_logic_1164.all;

entity processor is
   port (
    data : in std_logic_vector(111 downto 0);
    CLK : in std_logic;
    RST : in std_logic;
    register_a : out std_logic_vector(3 downto 0);
    register_b : out std_logic_vector(3 downto 0));
end processor;

architecture processor_arch of processor is

    component mux4_2to1 is
        port(
            D0 : in std_logic_vector(3 downto 0);
            D1 : in std_logic_vector(3 downto 0);
            S : in std_logic;
            O : out std_logic_vector(3 downto 0));
    end component;

    component reg is
        port (
			D : in std_logic_vector(3 downto 0);
			CE : in std_logic;
			C : in std_logic;
			R : in std_logic;
			Q : out std_logic_vector(3 downto 0)
		);
    end component;

    component alu
        port (
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            S : in std_logic_vector(1 downto 0);
            res : out std_logic_vector(3 downto 0);
            CO : out std_logic);
    end component;

    component status_reg is
        port (
            D : in std_logic;
            CE : in std_logic;
            CLK : in std_logic;
            Q : out std_logic);
    end component;

    component program_counter
        port (
            RomD : in std_logic_vector(3 downto 0);
            Carry : in std_logic;
            LD : in std_logic;
            CLK : in std_logic;
            RST : in std_logic;
            Q : out std_logic_vector(3 downto 0));
    end component;

    component rom_16x7 is
        port (
			A : in std_logic_vector(3 downto 0);
			data : in std_logic_vector(111 downto 0);
			D : out std_logic_vector(6 downto 0));
    end component;


    component instruction_decoder is
        port (
			OPC : in std_logic_vector(2 downto 0);
			control : out std_logic_vector(7 downto 0));
    end component;

    -- The signals are named as follows:
    -- the first part is the name of the component the signals
    -- originate from. The second part is the output port name
    -- of this component.
    -- Signal that are not prefixed with a component name 
    -- are input and output ports of the processor itself, see
    -- the first part of the file.
    signal program_counter_q, alu_res : std_logic_vector(3 downto 0);
    signal rom_d : std_logic_vector(6 downto 0);
    signal instruction_decoder_control : std_logic_vector(7 downto 0);

    -- Mux and registers are suffixed with the register letter (A or B)
    signal mux4_2to1_a_o,
           mux4_2to1_b_o,
           register_a_q,
           register_b_q : std_logic_vector(3 downto 0);

    signal status_reg_q, alu_co : std_logic;
         
begin

    -- Labels end in comp which stands for 'component'

    program_counter_comp : program_counter port map (
        rom_d(3 downto 0),
        status_reg_q, 
        instruction_decoder_control(6),
        CLK,
        RST,
        program_counter_q);

    rom_16x7_comp: rom_16x7 port map (
        program_counter_q,
        data,
        rom_d);
    
    instruction_decoder_comp: instruction_decoder port map (
        rom_d(6 downto 4),
        instruction_decoder_control);

    mux4_2to1_b_comp : mux4_2to1 port map (
        register_a_q,
        rom_d(3 downto 0),
        instruction_decoder_control(2),
        mux4_2to1_b_o);
    
    register_b_comp : reg port map (
        mux4_2to1_b_o,
        instruction_decoder_control(0),
        CLK,
        RST,
        register_b_q);

    alu_comp : alu port map (
        register_a_q,
        register_b_q,
        instruction_decoder_control(5 downto 4),
        alu_res,
        alu_co);
    
    mux4_2to1_a_comp : mux4_2to1 port map (
        alu_res,
        rom_d(3 downto 0),
        instruction_decoder_control(3),
        mux4_2to1_a_o);

    register_a_comp : reg port map (
        mux4_2to1_a_o,
        instruction_decoder_control(1),
        CLK,
        RST,
        register_a_q);

    status_reg_comp : status_reg port map (
        alu_co,
        instruction_decoder_control(7),
        CLK,
        status_reg_q);

    register_a <= register_a_q;
    register_b <= register_b_q;

end processor_arch;


