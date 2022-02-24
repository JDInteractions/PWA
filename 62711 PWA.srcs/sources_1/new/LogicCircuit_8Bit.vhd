----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2022 05:17:26 PM
-- Design Name: 
-- Module Name: LogicCircuit_8Bit - Behavioral
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

entity LogicCircuit_8Bit is
generic (width:integer :=7);
    Port ( A : in STD_LOGIC_VECTOR(width downto 0);
           B : in STD_LOGIC_VECTOR(width downto 0);
           S0,S1 : in STD_LOGIC;
           Sout : out STD_LOGIC_VECTOR(width downto 0));
end LogicCircuit_8Bit;

architecture Behavioral of LogicCircuit_8Bit is

component LogicCircuit_1Bit is
    Port (  A_Circuit : in STD_LOGIC;
            B_Circuit : in STD_LOGIC;
            S0_Circuit,S1_Circuit : in STD_LOGIC;
            Sout_Circuit : out STD_LOGIC);
end component LogicCircuit_1Bit;

begin

GEN_LogicCircuit_8Bit: for i in 0 to width generate

    LogicCircuit_8Bit: if (i <= width) generate
        UX: LogicCircuit_1Bit port map (A_Circuit => A(i), B_Circuit => B(i), S0_Circuit => S0, S1_Circuit => S1, Sout_Circuit => Sout(i));
    end generate LogicCircuit_8Bit;
    
end generate GEN_LogicCircuit_8Bit;

end Behavioral;
