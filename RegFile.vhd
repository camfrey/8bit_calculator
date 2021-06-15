----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2021 11:07:10 AM
-- Design Name: 
-- Module Name: RegFile - Behavioral
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

entity RegFile is
    Port ( rs1 : in STD_LOGIC_VECTOR (1 downto 0);
           rs2 : in STD_LOGIC_VECTOR (1 downto 0);
           ws : in STD_LOGIC_VECTOR (1 downto 0);
           wd : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           we : in STD_LOGIC;
           rd1 : out STD_LOGIC_VECTOR (7 downto 0);
           rd2 : out STD_LOGIC_VECTOR (7 downto 0));
end RegFile;

architecture Behavioral of RegFile is
    component Reg
        generic (n : positive := 8);
        Port ( Din : in STD_LOGIC_VECTOR (n - 1 downto 0);
               en : in STD_LOGIC;
               clk : in STD_LOGIC;
               Dout : out STD_LOGIC_VECTOR (n - 1 downto 0));
    end component;
    
    component mux
        generic(n : positive := 8);
        port(	I0:	in std_logic_vector (n - 1 downto 0); -- 4 input vectors
                I1:	in std_logic_vector (n - 1 downto 0); -- with variable widths
                I2:	in std_logic_vector (n - 1 downto 0);
                I3:	in std_logic_vector (n - 1 downto 0);
                sel: in std_logic_vector (1 downto 0); --Select bits
                O:	out std_logic_vector(n - 1 downto 0) -- output vector
            );
    end component;
    
    component demux
    port(	input:	in std_logic;
            sel: in std_logic_vector (1 downto 0); --Select bits
            output:	out std_logic_vector (3 downto 0)
            );
    end component;
    
    signal we_in0,we_in1,we_in2,we_in3 : std_logic;
    signal reg_out0,reg_out1,reg_out2,reg_out3 : std_logic_vector(7 downto 0);
    signal rd1_out,rd2_out : std_logic_vector(7 downto 0) := (others => '0');
    
begin

    reg0 : Reg port map (Din => wd, en => we_in0, clk => clk, Dout => reg_out0);
    reg1 : Reg port map (Din => wd, en => we_in1, clk => clk, Dout => reg_out1);
    reg2 : Reg port map (Din => wd, en => we_in2, clk => clk, Dout => reg_out2);
    reg3 : Reg port map (Din => wd, en => we_in3, clk => clk, Dout => reg_out3);
    
    muxRS1 : mux port map (I0 => reg_out0,I1 => reg_out1,I2 => reg_out2,I3 => reg_out3,sel => rs1, O => rd1_out);
    muxRS2 : mux port map (I0 => reg_out0,I1 => reg_out1,I2 => reg_out2,I3 => reg_out3,sel => rs2, O => rd2_out);
    demuxWS : demux port map (input => we, sel => ws, output(0) => we_in0, output(1) => we_in1, output(2) => we_in2, output(3) => we_in3);
    
    rd1 <= rd1_out;
    rd2 <= rd2_out;

end Behavioral;
