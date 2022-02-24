library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ALU_8Bit_tb is
end;

architecture bench of ALU_8Bit_tb is

  component ALU_8Bit
  generic (width:integer :=7);
      Port (  A_ALU : in STD_LOGIC_VECTOR(width downto 0);
              B_ALU : in STD_LOGIC_VECTOR(width downto 0);
              S0_ALU,S1_ALU,S2_ALU,Cin_ALU : in STD_LOGIC;
              OverFlow : out STD_LOGIC;
              Sout_ALU : out STD_LOGIC_VECTOR(width downto 0));
  end component;

  signal A_ALU: STD_LOGIC_VECTOR(7 downto 0);
  signal B_ALU: STD_LOGIC_VECTOR(7 downto 0);
  signal S0_ALU,S1_ALU,S2_ALU,Cin_ALU: STD_LOGIC;
  signal OverFlow: STD_LOGIC;
  signal Sout_ALU: STD_LOGIC_VECTOR(7 downto 0);

begin

  -- Insert values for generic parameters !!
  uut: ALU_8Bit generic map ( width    => 7 )
                   port map ( A_ALU    => A_ALU,
                              B_ALU    => B_ALU,
                              S0_ALU   => S0_ALU,
                              S1_ALU   => S1_ALU,
                              S2_ALU   => S2_ALU,
                              Cin_ALU  => Cin_ALU,
                              OverFlow => OverFlow,
                              Sout_ALU => Sout_ALU );

  stimulus: process
  begin
  
    -- Put initialisation code here
    
    -- Put test bench stimulus code here
    wait for 50 ns;
    A_ALU <= "00000111";
    B_ALU <= "00000011";
    Cin_ALU <= '0';
    S0_ALU <= '0';
    S1_ALU <= '1';
    S2_ALU <= '1';
    wait for 100 ns;
    end process;

end;
