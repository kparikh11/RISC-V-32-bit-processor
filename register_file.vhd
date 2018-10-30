----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2017 08:17:30 PM
-- Design Name: 
-- Module Name: register_file - Behavioral
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

entity register_file is
    Port ( SR1 : in unsigned (4 downto 0);              --Sourcde Register adress
           SR2 : in unsigned (4 downto 0);              --Source Register address
           DR : in unsigned (4 downto 0);               --Desitnation Register address
           Write_Data3 : in unsigned (31 downto 0);     --Write port
           Read_Data1 : out unsigned (31 downto 0);     --Read port
           Read_Data2 : out unsigned (31 downto 0);     --Read port
           Write_Enable3 : in STD_LOGIC;                --Control(Enable) bit
           CLK : in STD_LOGIC);
end register_file;

architecture registers of register_file is

type RAMtype1 is array (0 to 31) of unsigned (31 downto 0);
signal RAM1 : RAMtype1 := (others => (others => '1'));

begin

    process(clk)
    begin
        if CLK = '1' and CLK'event then
            if Write_Enable3 = '1' then
                RAM1(to_integer(DR)) <= Write_Data3;    --writing the data into desination register
            end if;
        end if;
    end process;

Read_Data1 <= RAM1(to_integer(SR1));    --reading data from source register
Read_Data2 <= RAM1(to_integer(SR2));    --reading data from source register

end registers;
