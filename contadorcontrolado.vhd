LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contadorcon is
    Port (
        clk        : in  STD_LOGIC;
        rst        : in  STD_LOGIC;
        ena        : in  STD_LOGIC;
        q          : out STD_LOGIC_VECTOR(3 downto 0);
        endCounter : out STD_LOGIC
    );
end contadorcon;

architecture Behavioral of contadorcon is
    signal cuenta : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    constant MAX_VAL : STD_LOGIC_VECTOR(3 downto 0) := "1001"; 
begin

    process(clk, rst)
    begin
        if rst = '1' then
            cuenta <= "0000";
            endCounter <= '0';
        elsif rising_edge(clk) then
            if ena = '1' then
                if cuenta = MAX_VAL then
                    cuenta <= "0000";
                    endCounter <= '1'; 
                else
                    cuenta <= cuenta + 1;
                    endCounter <= '0';
                end if;
            else
                endCounter <= '0';
            end if;
        end if;
    end process;

    q <= cuenta;

end Behavioral;
