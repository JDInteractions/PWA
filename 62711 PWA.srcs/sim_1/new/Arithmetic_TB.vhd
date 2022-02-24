library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Arithmetic_Circuit_tb is
end;

architecture bench of Arithmetic_Circuit_tb is

  component Arithmetic_Circuit
  generic (width:integer :=7);
      Port ( A : in STD_LOGIC_VECTOR(width downto 0);
             B : in STD_LOGIC_VECTOR(width downto 0);
             S0,S1 : in STD_LOGIC;
             Cin : in STD_LOGIC;
             Sout : out STD_LOGIC_VECTOR(width downto 0);
             OverFlow : out STD_LOGIC);
  end component;

  signal A: STD_LOGIC_VECTOR(7 downto 0);
  signal B: STD_LOGIC_VECTOR(7 downto 0);
  signal S0,S1: STD_LOGIC;
  signal Cin: STD_LOGIC;
  signal Sout: STD_LOGIC_VECTOR(7 downto 0);
  signal OverFlow: STD_LOGIC;

begin

  -- Insert values for generic parameters !!
  uut: Arithmetic_Circuit generic map ( width    => 7 )
                             port map ( A        => A,
                                        B        => B,
                                        S0       => S0,
                                        S1       => S1,
                                        Cin      => Cin,
                                        Sout     => Sout,
                                        OverFlow => OverFlow );

  stimulus: process
  begin
  
    -- Put initialisation code here
    
    -- Put test bench stimulus code here
    wait for 50 ns;
    S0 <= '1';
    S1 <= '1';
    Cin <= '0';
    A <= "00000101";
    B <= "00000011";
    wait for 100 ns;
    end process;

end;