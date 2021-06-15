----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2021 12:11:03 PM
-- Design Name: 
-- Module Name: print - Behavioral
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

entity print is
    Port ( value : in STD_LOGIC_VECTOR (7 downto 0);
           reg : in STD_LOGIC_VECTOR (1 downto 0);
           enable,clk : in STD_LOGIC);
end print;

architecture Behavioral of print is

signal clk_and_en : std_logic;

begin

clk_and_en <= clk and enable;

process (clk_and_en) begin
    if(rising_edge(clk_and_en)) then
        report "Register " & integer'image(to_integer(unsigned(reg))); 
        report "Contains the value of " & integer'image(to_integer(signed(value)));
    end if;
end process;

end Behavioral;
