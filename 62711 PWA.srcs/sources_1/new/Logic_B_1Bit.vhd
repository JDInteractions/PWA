----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2022 10:09:26 AM
-- Design Name: 
-- Module Name: Logic_B_1Bit - Behavioral
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

entity Logic_B_1Bit is
    Port (  B : in STD_LOGIC;
            S0,S1 : in STD_LOGIC;
            Bout : out STD_LOGIC);
end Logic_B_1Bit;

architecture Behavioral of Logic_B_1Bit is
signal Bout2 : STD_LOGIC;

begin

Bout2 <= (B AND S0) OR (not B AND S1);
Bout <= Bout2;

end Behavioral;
