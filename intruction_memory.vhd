----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2017 08:17:30 PM
-- Design Name: 
-- Module Name: intruction_memory - Behavioral
-- Project Name: 
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

entity intruction_memory is
    Port ( I : in unsigned (6 downto 0);                    --Address port
                                                            --CLK signal not required
           Read_Instruction : out unsigned (31 downto 0));  --Read port
end intruction_memory;

architecture instr_mem of intruction_memory is

type RAMtype is array (0 to 31) of unsigned (31 downto 0);
signal RAM: RAMtype := (others => (others => '1'));

begin

    Read_Instruction <= RAM(to_integer(I)); --reading the data from PC+4(next instruction)

end instr_mem;
