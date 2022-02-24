----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2022 06:54:36 PM
-- Design Name: 
-- Module Name: Mux3TO1 - Behavioral
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

entity Mux3TO1_1Bit is
    Port (  X_3Mux : in STD_LOGIC;
            Y_3Mux : in STD_LOGIC;
            Z_3Mux : in STD_LOGIC;
            S0_3Mux, S1_3Mux : in STD_LOGIC;
            O_3Mux : out STD_LOGIC);
end Mux3TO1_1Bit;

architecture Behavioral of Mux3TO1_1Bit is
signal Mux2out : STD_LOGIC;

component Mux2TO1_1Bit is
    Port (  X_2Mux : in STD_LOGIC;
            Y_2Mux : in STD_LOGIC;
            S2_2Mux : in STD_LOGIC;
            Z_2Mux : out STD_LOGIC);
end component Mux2TO1_1Bit;


begin

X1: Mux2TO1_1Bit port map (X_2Mux => X_3Mux, Y_2Mux => Y_3Mux, S2_2Mux => S0_3Mux, Z_2Mux => Mux2out);
X2: Mux2TO1_1Bit port map (X_2Mux => Mux2out, Y_2Mux => Z_3Mux, S2_2Mux => S1_3Mux, Z_2Mux => O_3Mux);

end Behavioral;
