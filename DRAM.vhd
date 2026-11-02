library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dram_512x16 is
port(
    clk      : in std_logic;
    enable   : in std_logic;
    addr     : in std_logic_vector(8 downto 0); -- 9 bits Log(512)
    data_in  : in std_logic_vector(15 downto 0);
    data_out : out std_logic_vector(15 downto 0)
);
end dram_512x16;

architecture Behavioral of dram_512x16 is
    type ram is array (0 to 511) of std_logic_vector(15 downto 0);
    signal BloqueRam : ram := (others => (others => '0'));
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if enable = '1' then
                BloqueRam(to_integer(unsigned(addr))) <= data_in; 
            end if;
        end if;
    end process;
    
    data_out <= BloqueRAM(to_integer(unsigned(addr)));
end Behavioral;
