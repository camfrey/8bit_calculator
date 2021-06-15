----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2021 10:08:29 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( input0 : in STD_LOGIC_VECTOR (7 downto 0);
           input1 : in STD_LOGIC_VECTOR (7 downto 0);
           op : in STD_LOGIC_VECTOR (1 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0);
           equal : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

function logical_and(input0,input1 : in std_logic_vector) return std_logic_vector is
  variable res_v : std_logic_vector(7 downto 0);  -- Null slv vector will also return '1'
begin
  for i in input0'range loop
    res_v(i) := not (input0(i) xor input1(i));
  end loop;
  return res_v;
end function;

function and_reduct(input : in std_logic_vector) return std_logic is
  variable res_v : std_logic := '1';  -- Null slv vector will also return '1'
begin
  for i in input'range loop
    res_v := res_v and input(i);
  end loop;
  return res_v;
end function;

component fullAdder is
    generic(n : positive := 8);
    Port ( A : in STD_LOGIC_VECTOR (n - 1 downto 0);
           B : in STD_LOGIC_VECTOR (n - 1 downto 0);
           S : out STD_LOGIC_VECTOR (n - 1 downto 0);
           Cout : out STD_LOGIC);
    end component;
    
component fullSub is
    generic (n : positive := 8);
    Port ( A,B : in STD_LOGIC_VECTOR (n - 1 downto 0);
           diff : out STD_LOGIC_VECTOR (n - 1 downto 0);
           borrow : out STD_LOGIC);
    end component;
    
component mux is
    generic(n : positive := 8);
    port(	I0:	in std_logic_vector (n - 1 downto 0); -- 4 input vectors
            I1:	in std_logic_vector (n - 1 downto 0); -- with variable widths
            I2:	in std_logic_vector (n - 1 downto 0);
            I3:	in std_logic_vector (n - 1 downto 0);
            sel: in std_logic_vector (1 downto 0); --Select bits
            O:	out std_logic_vector(n - 1 downto 0) -- output vector
        );
    end component;
        
signal dumbyCout,dumbyBorrow, equalSig,subSig: STD_LOGIC;
signal FAsig,DifSig : STD_LOGIC_VECTOR (7 downto 0);
signal eqSig : STD_LOGIC_VECTOR(7 downto 0);

begin

FA : fullAdder port map (A => input0, B => input1, S => FAsig, Cout => dumbyCout);
FS : fullSub port map (A => input0, B => input1, diff => DifSig, borrow => dumbyBorrow);
mux1 : mux port map (I0 => FAsig, I1 => DifSig, I2 => (others => '0'), I3 => (others => '0'), sel => op, O => output);

eqSig <= logical_and(input0,input1);
equal <= and_reduct(eqSig);

end Behavioral;
