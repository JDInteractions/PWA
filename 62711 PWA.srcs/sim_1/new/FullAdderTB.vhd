----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2022 11:18:18 AM
-- Design Name: 
-- Module Name: FullAdderTB - Behavioral
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

entity FullAdderTB is
end FullAdderTB;

architecture Behavioral of FullAdderTB is


    component  FullAdder1Bit
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               Cin : in STD_LOGIC;
               Sout : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end component;

signal A : STD_LOGIC := '0';
signal B : STD_LOGIC := '0';
signal Cin : STD_LOGIC := '0';

signal Sout : STD_LOGIC;
signal Cout : STD_LOGIC;

   -- Clock period definitions
    signal stop : std_logic := '1';
    constant clock_period : time := 2 ns;


begin
    uut: FullAdder1Bit port map (
    A => A,
    B => B,
    Cin => Cin,
    Sout => Sout,
    Cout => Cout);
    
    
    stim_proc : process 
    begin
    wait for 50 ns;
    A <= '1';
    B <= '1';
    Cin <= '1';
    wait for 100 ns;
    A <= '0';
    B <= '1';
    Cin <= '1'; 
    wait for 100 ns;
    end process;
 
end;
    