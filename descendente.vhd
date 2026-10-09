LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity descendente is
    Port (
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
        ena : in  STD_LOGIC;
        q   : out STD_LOGIC_VECTOR(3 downto 0)
    );
end descendente;

architecture Behavioral of descendente is
    signal cuenta : STD_LOGIC_VECTOR(3 downto 0);
begin

    process(clk, rst)
    begin
        if rst = '1' then
            cuenta <= "0000";
        elsif rising_edge(clk) then
            if ena = '1' then
                cuenta <= cuenta - 1; 
            end if;
        end if;
    end process;

    q <= cuenta;

end Behavioral;
