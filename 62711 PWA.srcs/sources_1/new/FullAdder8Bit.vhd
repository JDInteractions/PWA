----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2022 11:03:14 AM
-- Design Name: 
-- Module Name: 1BitFullAdder - Behavioral
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

entity FullAdder8Bit is
generic (width:integer :=7);
    Port ( A : in STD_LOGIC_VECTOR(width downto 0);
           B : in STD_LOGIC_VECTOR(width downto 0);
           Cin : in STD_LOGIC;
           Sout : out STD_LOGIC_VECTOR(width downto 0);
           Cout : out STD_LOGIC;
           OverFlow : out STD_LOGIC);
end FullAdder8Bit;

architecture Behavioral of FullAdder8Bit is
signal cc: std_logic_vector(width downto 0);
signal Cout_Logic: STD_LOGIC;


component FullAdder1Bit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Sout : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component FullAdder1Bit;

begin

GEN_ADD: for i in 0 to width generate

    First_Bit: if i=0 generate
        U0: FullAdder1Bit port map (A => A(i), B => B(i), Cin => Cin, Cout => cc(0), Sout => Sout(i));
    end generate First_Bit;
    
    Bits: if (i>0 and i<width) generate 
        UX: FullAdder1Bit port map (A => A(i), B => B(i), Cin => cc(i-1), Cout => cc(i), Sout => Sout(i));    
    end generate Bits;
    
    Last_Bit: if i=width generate
        U: FullAdder1Bit port map (A => A(i), B => B(i), Cin => cc(i-1), Cout => Cout_Logic, Sout => Sout(i));
    end generate Last_Bit;
end generate GEN_ADD;

Cout <= Cout_Logic;
OverFlow <= Cout_Logic XOR cc(width-1);

end Behavioral;