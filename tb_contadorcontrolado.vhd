LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity tb_contadorc is
end tb_contadorc;

architecture sim of tb_contadorc is
    signal clk        : STD_LOGIC := '0';
    signal rst        : STD_LOGIC := '1';
    signal ena        : STD_LOGIC := '0';
    signal q          : STD_LOGIC_VECTOR(3 downto 0);
    signal endCounter : STD_LOGIC;

    constant clk_period : time := 20 ns;
begin

    
    uut: entity work.contadorcon
        port map (
            clk        => clk,
            rst        => rst,
            ena        => ena,
            q          => q,
            endCounter => endCounter
        );

   
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    
    stim_proc: process
    begin
        rst <= '1';
        ena <= '0';
        wait for 40 ns;
        
        rst <= '0';
        ena <= '1';
        
        
        wait for 350 ns;

       
        ena <= '0';
        wait for 60 ns;

        ena <= '1';
        wait for 200 ns;

        wait;
    end process;

end sim;
