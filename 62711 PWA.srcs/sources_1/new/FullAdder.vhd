----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2022 11:03:14 AM
-- Design Name: 
-- Module Name: 1BitFullAdder - Behavioral
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

entity FullAdder1Bit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Sout : out STD_LOGIC;
           Cout : out STD_LOGIC);
end FullAdder1Bit;

architecture Behavioral of FullAdder1Bit is
signal G, P : STD_LOGIC;


begin

G <= A AND B;
P <= A XOR B;
Cout <= G OR (P AND Cin);
Sout <= P XOR Cin;


end Behavioral;