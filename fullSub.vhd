----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2021 10:53:44 PM
-- Design Name: 
-- Module Name: fullSub - Behavioral
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

entity fullSub is
    generic (n : positive := 8);
    Port ( A,B : in STD_LOGIC_VECTOR (n - 1 downto 0);
           diff : out STD_LOGIC_VECTOR (n - 1 downto 0);
           borrow : out STD_LOGIC);
end fullSub;

architecture Behavioral of fullSub is
    component fullSubComp is
        Port ( A,B,C : in STD_LOGIC;
               diff,borrow : out STD_LOGIC);
    end component;
    
    component halfSubComp is
        Port ( A,B : in STD_LOGIC;
               diff,borrow : out STD_LOGIC);
    end component;
    
    signal borrowSig : STD_LOGIC_VECTOR (n-1 downto 0);
begin

gen_sub : for I in 0 to n - 1 generate
    
    lower_bit : if I = 0 generate
        U0 : halfSubComp port map
            (A(0), B(0), diff(I),borrowSig(0));
        end generate lower_bit;
        
    upper_bits : if I > 0 generate
        UX : fullSubComp port map
            (A(I), B(I),borrowSig(I-1), diff(I),borrowSig(I));
        end generate upper_bits;
end generate gen_sub;

borrow <= borrowSig(n-1);


end Behavioral;
