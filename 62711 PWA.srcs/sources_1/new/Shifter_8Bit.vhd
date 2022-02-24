----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2022 02:36:06 PM
-- Design Name: 
-- Module Name: Shifter_8Bit - Behavioral
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

entity Shifter_8Bit is
generic (width:integer :=7);
    Port ( B_Shifter : in STD_LOGIC_VECTOR(width downto 0);
           S0_Shifter, S1_Shifter : in STD_LOGIC;
           H_Shifter : out STD_LOGIC_VECTOR(width downto 0));
end Shifter_8Bit;

architecture Behavioral of Shifter_8Bit is

component Shifter_1Bit is
    Port (  X_Shifter : in STD_LOGIC;
            Y_Shifter : in STD_LOGIC;
            K_Shifter : in STD_LOGIC;
            S0_Shifter, S1_Shifter : in STD_LOGIC;
            H_Shifter : out STD_LOGIC);
end component Shifter_1Bit;

signal KFirstBit, YLastBit : STD_LOGIC;

begin

KFirstBit <= '0';
YLastBit <= '0';

GEN_SHIFTER: for i in 0 to width generate

    First_Bit: if i=0 generate
        U0: Shifter_1Bit port map (X_Shifter => B_Shifter(i), Y_Shifter => B_Shifter(i+1), K_Shifter => KFirstBit, S0_Shifter => S0_Shifter, S1_Shifter => S1_Shifter, H_Shifter => H_Shifter(i));
    end generate First_Bit;
    
    Bits: if (i>0 and i<width) generate 
        UX: Shifter_1Bit port map (X_Shifter => B_Shifter(i), Y_Shifter => B_Shifter(i+1), K_Shifter => B_Shifter(i-1), S0_Shifter => S0_Shifter, S1_Shifter => S1_Shifter, H_Shifter => H_Shifter(i));  
    end generate Bits;
    
    Last_Bit: if i=width generate
        U: Shifter_1Bit port map (X_Shifter => B_Shifter(i), Y_Shifter => YLastBit, K_Shifter => B_Shifter(i-1), S0_Shifter => S0_Shifter,  S1_Shifter => S1_Shifter, H_Shifter => H_Shifter(i));
    end generate Last_Bit;
end generate GEN_SHIFTER;


end Behavioral;
