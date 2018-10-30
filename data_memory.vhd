----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2017 08:17:30 PM
-- Design Name: 
-- Module Name: data_memory - Behavioral
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

entity data_memory is
    Port ( D : in unsigned (6 downto 0);            --Address port
           Write_Data : in unsigned (31 downto 0);  --Write port
           Read_Data : out unsigned (31 downto 0);  --Read port
           Memory_write_Enable : in STD_LOGIC;      --Control( Memory Enable ) bit
           CLK : in STD_LOGIC);
end data_memory;

architecture data_mem of data_memory is

type RAMtype2 is array (0 to 127) of unsigned (31 downto 0);
signal RAM2: RAMtype2 := (others => (others => '0'));

begin

    process(clk)
    begin
        if CLK = '1' and CLK'event then
            if Memory_write_Enable = '1' then
                RAM2(to_integer(D))<= Write_Data;   --Writing the data into address(ALUout)
            end if;
                Read_Data <= RAM2(to_integer(D));   --Reading the data from the address(ALUout)
        end if;
    end process;

end data_mem;
