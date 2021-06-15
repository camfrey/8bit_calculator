----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2021 10:53:44 PM
-- Design Name: 
-- Module Name: fullSubComp - Behavioral
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

entity fullSubComp is
    Port ( A,B,C : in STD_LOGIC;
           diff,borrow : out STD_LOGIC);
end fullSubComp;

architecture Behavioral of fullSubComp is

begin

diff <= (A xor B) xor C; 
borrow <= ((not A) and (B or C)) or (B and C);

end Behavioral;
