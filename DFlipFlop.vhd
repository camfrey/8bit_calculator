----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2021 10:40:28 AM
-- Design Name: 
-- Module Name: DFlipFlop - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DFlipFlop is
    Port ( D : in STD_LOGIC;
           en : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC := '0');
end DFlipFlop;

architecture Behavioral of DFlipFlop is

signal clk_and_en : std_logic;
begin

clk_and_en <= clk and en;

process (clk_and_en) begin
    if(rising_edge(clk_and_en)) then
            Q <= D;
    end if;

end process;


end Behavioral;
