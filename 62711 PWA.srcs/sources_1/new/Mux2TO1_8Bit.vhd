----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2022 05:05:31 PM
-- Design Name: 
-- Module Name: Mux2TO1_8Bit - Behavioral
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

entity Mux2TO1_8Bit is
generic (width:integer :=7);
    Port (  X_2Mux : in STD_LOGIC_VECTOR(width downto 0);
            Y_2Mux : in STD_LOGIC_VECTOR(width downto 0);
            S2_2Mux : in STD_LOGIC;
            Z_2Mux : out STD_LOGIC_VECTOR(width downto 0));
end Mux2TO1_8Bit;

architecture Behavioral of Mux2TO1_8Bit is

component Mux2TO1_1Bit is
    Port (  X_2Mux : in STD_LOGIC;
            Y_2Mux : in STD_LOGIC;
            S2_2Mux : in STD_LOGIC;
            Z_2Mux : out STD_LOGIC);
end component Mux2TO1_1Bit;


begin

GEN_Mux2TO1_8Bit: for i in 0 to width generate

    GEN_Mux2TO1_8Bit: if (i <= width) generate
        UX: Mux2TO1_1Bit port map (X_2Mux => X_2Mux(i), Y_2Mux => Y_2Mux(i), Z_2Mux => Z_2Mux(i), S2_2Mux => S2_2Mux);
    end generate GEN_Mux2TO1_8Bit;
    
end generate GEN_Mux2TO1_8Bit;



end Behavioral;
