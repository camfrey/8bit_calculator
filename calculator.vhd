----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2021 10:42:45 AM
-- Design Name: 
-- Module Name: calculator - Behavioral
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

entity calculator is
    Port ( instruction : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC);
end calculator;

architecture Behavioral of calculator is

component regFile
    Port ( rs1 : in STD_LOGIC_VECTOR (1 downto 0);
           rs2 : in STD_LOGIC_VECTOR (1 downto 0);
           ws : in STD_LOGIC_VECTOR (1 downto 0);
           wd : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           we : in STD_LOGIC;
           rd1 : out STD_LOGIC_VECTOR (7 downto 0);
           rd2 : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component ALU
    Port ( input0 : in STD_LOGIC_VECTOR (7 downto 0);
           input1 : in STD_LOGIC_VECTOR (7 downto 0);
           op : in STD_LOGIC_VECTOR (1 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0);
           equal : out STD_LOGIC);
end component;

component muxTwoOne
    generic(n : positive := 2);
    port(	I0:	in std_logic_vector (n - 1 downto 0); -- 4 input vectors
            I1:	in std_logic_vector (n - 1 downto 0); -- with variable widths
            sel: in std_logic; --Select bits
            O:	out std_logic_vector(n - 1 downto 0) -- output vector
        );
end component;

component print
    Port ( value : in STD_LOGIC_VECTOR (7 downto 0);
           reg : in STD_LOGIC_VECTOR (1 downto 0);
           enable,clk : in STD_LOGIC);
end component;

signal we_sig,rs1_sel_sig,rs2_sel_sig,equal_sig,print_en : std_logic := '0';
signal rs1_sig,rs2_sig,ws_sig : std_logic_vector (1 downto 0) := "00";
signal ALU_out,rd1_sig,rd2_sig,wd_sig,sign_extension : std_logic_vector (7 downto 0) := "00000000";
signal LI : std_logic_vector( 3 downto 0) := "0000";

begin

we_sig <= not (instruction(7) and instruction(6));
rs1_sel_sig <= instruction(7) and instruction(6);
rs2_sig <= instruction(3 downto 2);
print_en <= instruction(7) and instruction(6);
LI <= instruction(3 downto 0);
sign_extension <= std_logic_vector(resize(signed(LI), sign_extension'length));

muxRS1 : muxTwoOne port map(I0 => instruction(5 downto 4), I1 => instruction(3 downto 2), sel => rs1_sel_sig, O => rs1_sig);
muxWS : muxTwoOne port map(I0 => instruction(1 downto 0), I1 => instruction(5 downto 4), sel => instruction(7), O => ws_sig);
muxWD : muxTwoOne generic map(n => 8) port map(I0 => ALU_out, I1 => sign_extension, sel => instruction(7), O => wd_sig);

regFile0 : regFile port map(rs1 => rs1_sig, rs2 => instruction(3 downto 2), ws =>  ws_sig, wd => wd_sig, clk => clk, we => we_sig, rd1 => rd1_sig, rd2 => rd2_sig);
alu0 : ALU port map(input0 => rd1_sig, input1 => rd2_sig, op => instruction(7 downto 6), output => ALU_out, equal => equal_sig);
printReg : print port map(value => rd1_sig, reg => instruction(3 downto 2), enable => print_en, clk => clk);

end Behavioral;
