----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2022 04:48:04 PM
-- Design Name: 
-- Module Name: LogicCircuit_1Bit - Behavioral
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

entity LogicCircuit_1Bit is
    Port (  A_Circuit : in STD_LOGIC;
            B_Circuit : in STD_LOGIC;
            S0_Circuit,S1_Circuit : in STD_LOGIC;
            Sout_Circuit : out STD_LOGIC);
end LogicCircuit_1Bit;

architecture Behavioral of LogicCircuit_1Bit is
signal X,Y,K,J: STD_LOGIC;
begin
    --Sout_Circuit <= A_Circuit OR B_Circuit when S0_Circuit = '0' AND S1_Circuit = '0' else
                    --A_Circuit AND B_Circuit when S0_Circuit = '1' AND S1_Circuit = '0' else
                    --A_Circuit XOR B_Circuit when S0_Circuit = '0' AND S1_Circuit = '1' else
                    --NOT A_Circuit when S0_Circuit = '1' AND S1_Circuit = '1'else
                    --'0';

X <= A_Circuit OR B_Circuit;
Y <= A_Circuit AND B_Circuit;
K <= A_Circuit XOR B_Circuit;
J <= NOT A_Circuit;

Sout_Circuit <= (J AND S1_Circuit AND S0_Circuit) OR (K AND S1_Circuit AND NOT S0_Circuit) OR (Y AND NOT S1_Circuit AND S0_Circuit) OR (X AND NOT S1_Circuit AND NOT S0_Circuit);

end Behavioral;

