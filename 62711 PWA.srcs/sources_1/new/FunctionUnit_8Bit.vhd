----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2022 05:54:11 PM
-- Design Name: 
-- Module Name: FunctionUnit_8Bit - Behavioral
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

entity FunctionUnit_8Bit is
generic (width:integer :=7);
    Port (  A_FU : in STD_LOGIC_VECTOR(width downto 0);
            B_FU : in STD_LOGIC_VECTOR(width downto 0);
            FS0, FS1, FS2, FS3 : in STD_LOGIC;
            OverFlow_FU : out STD_LOGIC;
            Sout_FU : out STD_LOGIC_VECTOR(width downto 0));
end FunctionUnit_8Bit;

architecture Behavioral of FunctionUnit_8Bit is
signal Sout_ALU, Sout_Shifter : STD_LOGIC_VECTOR(width downto 0);
signal MF : STD_LOGIC;

component ALU_8Bit is
generic (width:integer :=7);
    Port (  A_ALU : in STD_LOGIC_VECTOR(width downto 0);
            B_ALU : in STD_LOGIC_VECTOR(width downto 0);
            S0_ALU,S1_ALU,S2_ALU,Cin_ALU : in STD_LOGIC;
            OverFlow : out STD_LOGIC;
            Sout_ALU : out STD_LOGIC_VECTOR(width downto 0));
end component ALU_8Bit;

component Shifter_8Bit is
generic (width:integer :=7);
    Port ( B_Shifter : in STD_LOGIC_VECTOR(width downto 0);
           S0_Shifter, S1_Shifter : in STD_LOGIC;
           H_Shifter : out STD_LOGIC_VECTOR(width downto 0));
end component Shifter_8Bit;

component Mux2TO1_8Bit is
generic (width:integer :=7);
    Port (  X_2Mux : in STD_LOGIC_VECTOR(width downto 0);
            Y_2Mux : in STD_LOGIC_VECTOR(width downto 0);
            S2_2Mux : in STD_LOGIC;
            Z_2Mux : out STD_LOGIC_VECTOR(width downto 0));
end component Mux2TO1_8Bit;



begin

MF <= FS2 AND FS3;

X1: ALU_8Bit port map (A_ALU => A_FU, B_ALU => B_FU, Cin_ALU => FS0, S0_ALU => FS1, S1_ALU => FS2, S2_ALU => FS3, OverFlow => OverFlow_FU, Sout_ALU => Sout_ALU);
X2: Shifter_8Bit port map (B_Shifter => B_FU, S0_Shifter => FS0, S1_Shifter => FS1, H_Shifter => Sout_Shifter);
X3: Mux2TO1_8Bit port map (X_2Mux => Sout_ALU, Y_2MUX => Sout_Shifter, S2_2Mux => MF, Z_2Mux => Sout_FU);



end Behavioral;
