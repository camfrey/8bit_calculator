----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2021 12:28:38 PM
-- Design Name: 
-- Module Name: calculator_tb - Behavioral
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

entity calculator_tb is
--  Port ( );
end calculator_tb;

architecture behav of calculator_tb is
--  Declaration of the component that will be instantiated.
component calculator
    Port ( instruction : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC);
end component;
--  Specifies which entity is bound with the component.
signal inst : std_logic_vector(7 downto 0);
signal clk : std_logic;
begin
--  Component instantiation.
DUT: calculator port map (instruction => inst, clk => clk);

--  This process does the real job.
process
type pattern_type is record
--  The inputs of the shift_reg.
instruction : STD_LOGIC_VECTOR (7 downto 0);
clk : STD_LOGIC;
--  The expected outputs of the shift_reg.
end record;
--  The patterns to apply.
type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array := --Test various forms of shifting and loading
(("10000010", '0'),
("10000010", '1'), --Load inital 2 to reg 0
("10010100", '0'),
("10010100", '1'),--Load inital 4 to reg 1
("10101000", '0'),
("10101000", '1'),--Load inital -8 to reg 2
("00000111", '0'),
("00000111", '1'),--Add reg 0 and reg 1 to reg 3 (2 + 4 = 6)
("11001100", '0'),
("11001100", '1'),--Display register 3
("00001011", '0'),
("00001011", '1'),--Add reg 0 and reg 2 to reg 3 (2 + -8 = -6)
("11001100", '0'),
("11001100", '1'),--Display register 3
("01000111", '0'),
("01000111", '1'),--sub reg 0 from reg 1 to reg 3( 2 - 4 = -2)
("11001100", '0'),
("11001100", '1'),--Display register 3
("01001111", '0'),
("01001111", '1'),--sub reg 0 from reg 3 to reg 3( 2 - -2 = 4)
("11001100", '0'),
("11001100", '1')
); 
begin
--  Check each pattern.
for n in patterns'range loop
--  Set the inputs.
inst <= patterns(n).instruction;
clk <= patterns(n).clk;
--  Wait for the results.
wait for 1 ns;
--  Check the outputs.
--assert rd1 = patterns(n).rd1
--report "bad rd1 value" severity error;
--assert rd2 = patterns(n).rd2
--report "bad rd2 value" severity error;
end loop;
assert false report "end of test" severity note;
--  Wait forever; this will finish the simulation.
wait;
end process;
end behav;
