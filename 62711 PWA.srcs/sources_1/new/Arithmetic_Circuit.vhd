----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2022 09:20:20 AM
-- Design Name: 
-- Module Name: Arithmetic_Circuit - Behavioral
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

entity Arithmetic_Circuit is
generic (width:integer :=7);
    Port ( A : in STD_LOGIC_VECTOR(width downto 0);
           B : in STD_LOGIC_VECTOR(width downto 0);
           S0,S1 : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Sout : out STD_LOGIC_VECTOR(width downto 0);
           OverFlow : out STD_LOGIC);
end Arithmetic_Circuit;

architecture Behavioral of Arithmetic_Circuit is


component FullAdder8Bit is
generic (width:integer :=7);
    Port ( A : in STD_LOGIC_VECTOR(width downto 0);
           B : in STD_LOGIC_VECTOR(width downto 0);
           Cin : in STD_LOGIC;
           Sout : out STD_LOGIC_VECTOR(width downto 0);
           Cout : out STD_LOGIC;
           OverFlow : out STD_LOGIC);
end component FullAdder8Bit;

component Logic_B_8Bit is
generic (width:integer :=7);
    Port (  B_Logic : in STD_LOGIC_VECTOR(width downto 0);
            S0_Logic,S1_Logic : in STD_LOGIC;
            Bout_Logic : out STD_LOGIC_VECTOR(width downto 0));
end component Logic_B_8Bit;

signal BoutLogic : STD_LOGIC_VECTOR(width downto 0);
begin

X1: Logic_B_8Bit port map (B_Logic => B, S0_Logic => S0, S1_Logic => S1, Bout_Logic => BoutLogic);
X2: FullAdder8Bit port map (A => A, B => BoutLogic, Cin => Cin, Sout => Sout, OverFlow => OverFlow);  


end Behavioral;
