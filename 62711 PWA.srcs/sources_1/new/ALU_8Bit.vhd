----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2022 05:40:41 PM
-- Design Name: 
-- Module Name: ALU_8Bit - Behavioral
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

entity ALU_8Bit is
generic (width:integer :=7);
    Port (  A_ALU : in STD_LOGIC_VECTOR(width downto 0);
            B_ALU : in STD_LOGIC_VECTOR(width downto 0);
            S0_ALU,S1_ALU,S2_ALU,Cin_ALU : in STD_LOGIC;
            OverFlow : out STD_LOGIC;
            Sout_ALU : out STD_LOGIC_VECTOR(width downto 0));
end ALU_8Bit;

architecture Behavioral of ALU_8Bit is
signal Sout_Arith, Sout_Logic : STD_LOGIC_VECTOR(width downto 0);


component Arithmetic_Circuit is
generic (width:integer :=7);
    Port ( A : in STD_LOGIC_VECTOR(width downto 0);
           B : in STD_LOGIC_VECTOR(width downto 0);
           S0,S1 : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Sout : out STD_LOGIC_VECTOR(width downto 0);
           OverFlow : out STD_LOGIC);
end component Arithmetic_Circuit;

component LogicCircuit_8Bit is
generic (width:integer :=7);
    Port ( A : in STD_LOGIC_VECTOR(width downto 0);
           B : in STD_LOGIC_VECTOR(width downto 0);
           S0,S1 : in STD_LOGIC;
           Sout : out STD_LOGIC_VECTOR(width downto 0));
end component LogicCircuit_8Bit;

component Mux2TO1_8Bit is
generic (width:integer :=7);
    Port (  X_2Mux : in STD_LOGIC_VECTOR(width downto 0);
            Y_2Mux : in STD_LOGIC_VECTOR(width downto 0);
            S2_2Mux : in STD_LOGIC;
            Z_2Mux : out STD_LOGIC_VECTOR(width downto 0));
end component Mux2TO1_8Bit;


begin

X1: Arithmetic_Circuit port map (A => A_ALU, B => B_ALU, S0 => S0_ALU, S1 => S1_ALU, Cin => Cin_ALU, Sout => Sout_Arith, OverFlow => OverFlow);
X2: LogicCircuit_8Bit port map (A => A_ALU, B => B_ALU, S0 => Cin_ALU, S1 => S0_ALU, Sout => Sout_Logic);
X3: Mux2TO1_8Bit port map (X_2Mux => Sout_Arith, Y_2Mux => Sout_Logic, S2_2Mux => S2_ALU ,Z_2Mux => Sout_ALU);


--Sout_ALU <= Sout_Arith when S2_ALU = '0' else
            --Sout_Logic when S2_ALU = '1' else
            --X"00";

--Sout_ALU <= (Sout_Arith AND NOT S2_ALU) OR (Sout_Logic AND S2_ALU);
--S2_ALU needs to be 8 bit?


end Behavioral;
