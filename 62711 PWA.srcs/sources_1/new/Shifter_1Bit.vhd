----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2022 01:42:15 PM
-- Design Name: 
-- Module Name: Shifter_1Bit - Behavioral
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

entity Shifter_1Bit is
    Port (  X_Shifter : in STD_LOGIC;
            Y_Shifter : in STD_LOGIC;
            K_Shifter : in STD_LOGIC;
            S0_Shifter, S1_Shifter : in STD_LOGIC;
            H_Shifter : out STD_LOGIC);
end Shifter_1Bit;

architecture Behavioral of Shifter_1Bit is
signal X,Y,K: STD_LOGIC;

--component Mux4TO1_1Bit is
--    Port (  X_4Mux : in STD_LOGIC;
--            Y_4Mux : in STD_LOGIC;
--            Z_4Mux : in STD_LOGIC;
--            S0_4Mux, S1_4Mux : in STD_LOGIC;
--            O_4Mux : out STD_LOGIC);
--end component Mux4TO1_1Bit;

begin

H_Shifter <= (X_Shifter AND S1_Shifter AND S0_Shifter) OR (K_Shifter AND S1_Shifter AND NOT S0_Shifter) OR (Y_Shifter AND NOT S1_Shifter AND S0_Shifter) OR (X_Shifter AND NOT S1_Shifter AND NOT S0_Shifter);

--X1: Mux4TO1_1Bit port map (X_4Mux => X_Shifter, Y_4Mux => Y_Shifter, Z_4Mux => K_Shifter, S0_4Mux => S0_Shifter, S1_4Mux => S1_Shifter, O_4Mux => H_Shifter);

--H_Shifter <= (((X_Shifter AND NOT S0_Shifter) OR (Y_Shifter AND S0_Shifter)) AND NOT S1_Shifter) OR ((K_Shifter AND S1_Shifter) OR (K_Shifter AND NOT S1_Shifter));
--H_Shifter <= (((X_Shifter AND NOT S0_Shifter) OR (Y_Shifter AND S0_Shifter)) AND NOT S1_Shifter) OR (K_Shifter AND S1_Shifter);

end Behavioral;
