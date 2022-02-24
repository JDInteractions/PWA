----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2022 05:03:02 PM
-- Design Name: 
-- Module Name: Mux2TO1 - Behavioral
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

entity Mux2TO1_1Bit is
    Port (  X_2Mux : in STD_LOGIC;
            Y_2Mux : in STD_LOGIC;
            S2_2Mux : in STD_LOGIC;
            Z_2Mux : out STD_LOGIC);
end Mux2TO1_1Bit;

architecture Behavioral of Mux2TO1_1Bit is

begin

Z_2Mux <= (X_2Mux AND NOT S2_2Mux) OR (Y_2Mux AND S2_2Mux);

end Behavioral;
