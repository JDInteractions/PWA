library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity FullAdder8Bit_tb is
end;

architecture bench of FullAdder8Bit_tb is

  component FullAdder8Bit
  generic (width:integer :=7);
      Port ( A : in STD_LOGIC_VECTOR(width downto 0);
             B : in STD_LOGIC_VECTOR(width downto 0);
             Cin : in STD_LOGIC;
             Sout : out STD_LOGIC_VECTOR(width downto 0);
             Cout : out STD_LOGIC;
             OverFlow : out STD_LOGIC);
  end component;

  signal A: STD_LOGIC_VECTOR(7 downto 0);
  signal B: STD_LOGIC_VECTOR(7 downto 0);
  signal Cin: STD_LOGIC;
  signal Sout: STD_LOGIC_VECTOR(7 downto 0);
  signal Cout: STD_LOGIC;
  signal OverFlow: STD_LOGIC;

begin

  -- Insert values for generic parameters !!
  uut: FullAdder8Bit generic map ( width    =>  7)
                        port map ( A        => A,
                                   B        => B,
                                   Cin      => Cin,
                                   Sout     => Sout,
                                   Cout     => Cout,
                                   OverFlow => OverFlow );

  stimulus: process
  begin
  
    -- Put initialisation code here
    
    -- Put test bench stimulus code here
    wait for 50 ns;
    A <= "11111111";
    B <= "11111111";
    Cin <= '1';
    wait for 100 ns;
    end process;

end;
