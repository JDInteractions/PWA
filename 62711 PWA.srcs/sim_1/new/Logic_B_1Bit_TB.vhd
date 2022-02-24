library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Logic_B_1Bit_tb is
end;

architecture bench of Logic_B_1Bit_tb is

  component Logic_B_1Bit
      Port (  
              B : in STD_LOGIC;
              S0,S1 : in STD_LOGIC;
              Bout : out STD_LOGIC);
  end component;

  signal B: STD_LOGIC;
  signal S0,S1: STD_LOGIC;
  signal Bout: STD_LOGIC;

begin

  uut: Logic_B_1Bit port map ( B    => B,
                               S0   => S0,
                               S1   => S1,
                               Bout => Bout );

  stimulus: process
  begin
  
    -- Put initialisation code here


    -- Put test bench stimulus code here
    wait for 50 ns;
    B <= '1';
    S0 <= '1';
    S1 <= '1';
    wait for 100 ns;

    B <= '0';
    S0 <= '1';
    S1 <= '1';
    wait for 100 ns;
  end process;


end;