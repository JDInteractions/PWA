library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Shifter_1Bit_tb is
end;

architecture bench of Shifter_1Bit_tb is

  component Shifter_1Bit
      Port (  X_Shifter : in STD_LOGIC;
              Y_Shifter : in STD_LOGIC;
              K_Shifter : in STD_LOGIC;
              S0_Shifter, S1_Shifter : in STD_LOGIC;
              H_Shifter : out STD_LOGIC);
  end component;

  signal X_Shifter: STD_LOGIC;
  signal Y_Shifter: STD_LOGIC;
  signal K_Shifter: STD_LOGIC;
  signal S0_Shifter, S1_Shifter: STD_LOGIC;
  signal H_Shifter: STD_LOGIC;

begin

  uut: Shifter_1Bit port map ( X_Shifter  => X_Shifter,
                               Y_Shifter  => Y_Shifter,
                               K_Shifter  => K_Shifter,
                               S0_Shifter => S0_Shifter,
                               S1_Shifter => S1_Shifter,
                               H_Shifter  => H_Shifter );

  stimulus: process
  begin
  
    -- Put initialisation code here
    
    -- Put test bench stimulus code here
    wait for 50 ns;
    X_Shifter <= '0';
    Y_Shifter <= '0';
    K_Shifter <= '1';
    S0_Shifter <= '0';
    S1_Shifter <= '1';

    wait for 100 ns;
    end process;

end;