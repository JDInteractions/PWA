----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2022 09:54:30 AM
-- Design Name: 
-- Module Name: Logic_B_input - Behavioral
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

entity Logic_B_8Bit is
generic (width:integer :=7);
    Port (  B_Logic : in STD_LOGIC_VECTOR(width downto 0);
            S0_Logic,S1_Logic : in STD_LOGIC;
            Bout_Logic : out STD_LOGIC_VECTOR(width downto 0));
end Logic_B_8Bit;

architecture Behavioral of Logic_B_8Bit is
--signal Bout2 : STD_LOGIC_VECTOR(7 downto 0);

component Logic_B_1Bit is
    Port (  B : in STD_LOGIC;
            S0,S1 : in STD_LOGIC;
            Bout : out STD_LOGIC);
end component Logic_B_1Bit;

begin

GEN_B_LOGIC: for i in 0 to width generate

    Logic_B: if (i <= width) generate
        UX: Logic_B_1Bit port map (B => B_Logic(i), S0 => S0_Logic, S1 => S1_Logic, Bout => Bout_Logic(i));
    end generate Logic_B;
    
end generate GEN_B_LOGIC;

end Behavioral;
