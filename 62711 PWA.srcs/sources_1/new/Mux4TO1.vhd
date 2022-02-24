----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2022 07:14:37 PM
-- Design Name: 
-- Module Name: Mux4TO1 - Behavioral
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

entity Mux4TO1_1Bit is
    Port (  X_4Mux : in STD_LOGIC;
            Y_4Mux : in STD_LOGIC;
            Z_4Mux : in STD_LOGIC;
            S0_4Mux, S1_4Mux : in STD_LOGIC;
            O_4Mux : out STD_LOGIC);
end Mux4TO1_1Bit;

architecture Behavioral of Mux4TO1_1Bit is
signal Mux2out, Mux2out2 : STD_LOGIC;
--signal hej : STD_LOGIC := '0';

component Mux2TO1_1Bit is
    Port (  X_2Mux : in STD_LOGIC;
            Y_2Mux : in STD_LOGIC;
            S2_2Mux : in STD_LOGIC;
            Z_2Mux : out STD_LOGIC);
end component Mux2TO1_1Bit;

begin

X1: Mux2TO1_1Bit port map (X_2Mux => X_4Mux, Y_2Mux => Y_4Mux, S2_2Mux => S0_4Mux, Z_2Mux => Mux2out);

X2: Mux2TO1_1Bit port map (X_2Mux => Mux2out, Y_2Mux => Z_4Mux, S2_2Mux => S0_4Mux, Z_2Mux => Mux2out2);

X3: Mux2TO1_1Bit port map (X_2Mux => Mux2out, Y_2Mux => Mux2out2, S2_2Mux => S1_4Mux, Z_2Mux => O_4Mux);

end Behavioral;
