----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2021 10:52:35 AM
-- Design Name: 
-- Module Name: Reg - Behavioral
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

entity Reg is
    generic (n : positive := 8);
    Port ( Din : in STD_LOGIC_VECTOR (n - 1 downto 0);
           en : in STD_LOGIC;
           clk : in STD_LOGIC;
           Dout : out STD_LOGIC_VECTOR (n - 1 downto 0));
end Reg;

architecture Behavioral of Reg is
    component DFlipFlop
          Port ( D : in STD_LOGIC;
           en : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC);
    end component;
begin

   gen_n_reg: 
   for I in 0 to n - 1 generate
      regn : DFlipFlop port map
        (Din(I), clk, en, Dout(I));
   end generate gen_n_reg;

end Behavioral;
