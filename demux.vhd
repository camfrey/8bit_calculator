----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2021 11:41:21 AM
-- Design Name: 
-- Module Name: demux - Behavioral
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

entity demux is
    port(	input:	in std_logic;
            sel: in std_logic_vector (1 downto 0); --Select bits
            output:	out std_logic_vector (3 downto 0));
end demux;

architecture behav of demux is
begin
    with sel select 
        output <= "000" & input when "00",
                "00" & input & '0' when "01",
                '0' & input & "00" when "10",
                input & "000" when others;
end behav;
