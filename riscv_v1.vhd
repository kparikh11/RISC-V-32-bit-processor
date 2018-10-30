----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2017 09:30:36 PM
-- Design Name: 
-- Module Name: riscv_v1 - Behavioral
-- Project Name: RISC-V Single Cycle Implemetation
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity riscv_v1 is
  Port ( CLK : in STD_LOGIC;
         RST: in STD_LOGIC;
         Addr_out : out unsigned (31 downto 0);
         Write_Enable_m : in STD_LOGIC);
end riscv_v1;

architecture structure_proc of riscv_v1 is

component register_file is
    Port ( SR1 : in unsigned (4 downto 0);              --Sourcde Register adress
           SR2 : in unsigned (4 downto 0);              --Source Register address
           DR : in unsigned (4 downto 0);               --Desitnation Register address
           Write_Data3 : in unsigned (31 downto 0);     --Write port
           Read_Data1 : out unsigned (31 downto 0);     --Read port
           Read_Data2 : out unsigned (31 downto 0);     --Read port
           Write_Enable3 : in STD_LOGIC;                --Control(Enable) bit
           CLK : in STD_LOGIC);
end component;

signal state, n_state : integer range 0 to 4 := 0;
signal pc, n_pc : unsigned (31 downto 0);

constant addi: unsigned(5 downto 0) := "001000"; -- 8
constant andi: unsigned(5 downto 0) := "001100"; -- 12
constant ori: unsigned(5 downto 0) := "001101"; -- 13
constant lw: unsigned(5 downto 0) := "100011"; -- 35
constant sw: unsigned(5 downto 0) := "101011"; -- 43
constant beq: unsigned(5 downto 0) := "000100"; -- 4
constant bne: unsigned(5 downto 0) := "000101"; -- 5
constant jump: unsigned(5 downto 0) := "000010"; -- 2

signal Instr: unsigned (31 downto 0);
    alias opcode: unsigned(5 downto 0) is Instr(31 downto 26);
    alias SR1: unsigned(4 downto 0) is Instr(25 downto 21);
    alias SR2: unsigned(4 downto 0) is Instr(20 downto 16);
    alias F_Code: unsigned(5 downto 0) is Instr(5 downto 0);
    alias NumShift: unsigned(4 downto 0) is Instr(10 downto 6);
    alias ImmField: unsigned (15 downto 0) is Instr(15 downto 0);


begin

process(state, pc, Instr)
begin
    case state is
        when 0 =>   --fetch instrucion
            n_pc <= pc + 4;  
        when 1 =>   --Decode instruction
             n_pc <= pc +1;
        when 2 =>   --Execute instrucion
            n_pc <= pc +1;
        when 3 =>   --Memory instrucion
             n_pc <= pc +1; 
        when 4 =>   --WriteBeck instruction
             n_pc <= pc +1; 
    end case;
end process;

end structure_proc;
