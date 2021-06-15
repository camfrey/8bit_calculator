----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2021 11:10:51 AM
-- Design Name: 
-- Module Name: mux - Behavioral
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

entity mux is
    generic(n : positive := 4);
    port(	I0:	in std_logic_vector (n - 1 downto 0); -- 4 input vectors
            I1:	in std_logic_vector (n - 1 downto 0); -- with variable widths
            I2:	in std_logic_vector (n - 1 downto 0);
            I3:	in std_logic_vector (n - 1 downto 0);
            sel: in std_logic_vector (1 downto 0); --Select bits
            O:	out std_logic_vector(n - 1 downto 0) -- output vector
        );
end mux;

architecture behav of mux is
begin
    with sel select 
        O <= I0 when "00", I1 when "01",I2 when "10", I3 when others;
       
end behav;
