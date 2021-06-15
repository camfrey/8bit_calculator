----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2021 11:20:41 AM
-- Design Name: 
-- Module Name: muxTwoOne - Behavioral
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

entity muxTwoOne is
    generic(n : positive := 4);
    port(	I0:	in std_logic_vector (n - 1 downto 0); -- 4 input vectors
            I1:	in std_logic_vector (n - 1 downto 0); -- with variable widths
            sel: in std_logic; --Select bits
            O:	out std_logic_vector(n - 1 downto 0) -- output vector
        );
end muxTwoOne;

architecture Behavioral of muxTwoOne is

begin
    with sel select 
        O <= I0 when '0', I1 when others;

end Behavioral;
