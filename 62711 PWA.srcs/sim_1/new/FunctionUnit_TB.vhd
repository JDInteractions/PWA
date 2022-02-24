library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity FunctionUnit_8Bit_tb is
end;

architecture bench of FunctionUnit_8Bit_tb is

  component FunctionUnit_8Bit
  generic (width:integer :=7);
      Port (  A_FU : in STD_LOGIC_VECTOR(width downto 0);
              B_FU : in STD_LOGIC_VECTOR(width downto 0);
              FS0, FS1, FS2, FS3 : in STD_LOGIC;
              OverFlow_FU : out STD_LOGIC;
              Sout_FU : out STD_LOGIC_VECTOR(width downto 0));
  end component;

  signal A_FU: STD_LOGIC_VECTOR(7 downto 0);
  signal B_FU: STD_LOGIC_VECTOR(7 downto 0);
  signal FS0, FS1, FS2, FS3: STD_LOGIC;
  signal OverFlow_FU: STD_LOGIC;
  signal Sout_FU: STD_LOGIC_VECTOR(7 downto 0);
  signal test : STD_LOGIC_VECTOR(3 downto 0);

begin

  -- Insert values for generic parameters !!
  uut: FunctionUnit_8Bit generic map ( width       => 7 )
                            port map ( A_FU        => A_FU,
                                       B_FU        => B_FU,
                                       FS0         => FS0,
                                       FS1         => FS1,
                                       FS2         => FS2,
                                       FS3         => FS3,
                                       OverFlow_FU => OverFlow_FU,
                                       Sout_FU     => Sout_FU );

  stimulus: process
  begin
  
    -- Put initialisation code here
    
    -- Put test bench stimulus code here
    wait for 50 ns;
    A_FU <= "00000111";
    B_FU <= "00000011";   
        for i in 0 to 15 loop
        test <= std_logic_vector(to_unsigned(i,4));
        FS0 <= test(0);
        FS1 <= test(1);
        FS2 <= test(2);
        FS3 <= test(3);
        wait for 50 ns;
        end loop;
    
    end process;

end;