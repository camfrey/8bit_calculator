----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2021 10:25:06 PM
-- Design Name: 
-- Module Name: fullAdder - Behavioral
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

entity fullAdder is
    generic(n : positive := 8);
    Port ( A : in STD_LOGIC_VECTOR (n - 1 downto 0);
           B : in STD_LOGIC_VECTOR (n - 1 downto 0);
           S : out STD_LOGIC_VECTOR (n - 1 downto 0);
           Cout : out STD_LOGIC);
end fullAdder;

architecture Behavioral of fullAdder is

    component fullAddComp is
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               Cin : in STD_LOGIC;
               S : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end component;
    
    component halfAddComp is
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               S : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end component;
    
    signal carry : STD_LOGIC_VECTOR (n-1 downto 0);
    signal B_xor_sub : STD_LOGIC_VECTOR(n-1 downto 0);
begin

gen_add_sub : for I in 0 to n - 1 generate
    
    lower_bit : if I = 0 generate
        U0 : halfAddComp port map
            (A(0), B(0), S(I),carry(0));
        end generate lower_bit;
        
    upper_bits : if I > 0 generate
        UX : fullAddComp port map
            (A(I), B(I),carry(I-1), S(I),carry(I));
        end generate upper_bits;
end generate gen_add_sub;

Cout <= carry(n-1);

end Behavioral;
