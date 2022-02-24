library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity LogicCircuit_8Bit_tb is
end;

architecture bench of LogicCircuit_8Bit_tb is

  component LogicCircuit_8Bit
  generic (width:integer :=7);
      Port ( A : in STD_LOGIC_VECTOR(width downto 0);
             B : in STD_LOGIC_VECTOR(width downto 0);
             S0,Cin : in STD_LOGIC;
             Sout : out STD_LOGIC_VECTOR(width downto 0));
  end component;

  signal A: STD_LOGIC_VECTOR(7 downto 0);
  signal B: STD_LOGIC_VECTOR(7 downto 0);
  signal S0,Cin: STD_LOGIC;
  signal Sout: STD_LOGIC_VECTOR(7 downto 0);

begin

  -- Insert values for generic parameters !!
  uut: LogicCircuit_8Bit generic map ( width =>  7)
                            port map ( A     => A,
                                       B     => B,
                                       S0    => S0,
                                       Cin   => Cin,
                                       Sout  => Sout );

  stimulus: process
  begin
  
    -- Put initialisation code here
    
    -- Put test bench stimulus code here
    wait for 50 ns;
    A <= "00000101";
    B <= "00000011";
    Cin <= '1';
    S0 <= '0';
    wait for 100 ns;
    end process;

end;