library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Shifter_8Bit_tb is
end;

architecture bench of Shifter_8Bit_tb is

  component Shifter_8Bit
  generic (width:integer :=7);
      Port ( B_Shifter : in STD_LOGIC_VECTOR(width downto 0);
             S0_Shifter, S1_Shifter : in STD_LOGIC;
             H_Shifter : out STD_LOGIC_VECTOR(width downto 0));
  end component;

  signal B_Shifter: STD_LOGIC_VECTOR(7 downto 0);
  signal S0_Shifter, S1_Shifter: STD_LOGIC;
  signal H_Shifter: STD_LOGIC_VECTOR(7 downto 0);

begin

  -- Insert values for generic parameters !!
  uut: Shifter_8Bit generic map ( width      => 7 )
                       port map ( B_Shifter  => B_Shifter,
                                  S0_Shifter => S0_Shifter,
                                  S1_Shifter => S1_Shifter,
                                  H_Shifter  => H_Shifter );

  stimulus: process
  begin
  
    -- Put initialisation code here
    
    -- Put test bench stimulus code here
    wait for 50 ns;
    B_Shifter <= "00000011";
    S0_Shifter <= '1';
    S1_Shifter <= '1';

    wait for 100 ns;
    end process;

end;