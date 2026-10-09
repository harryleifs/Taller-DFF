library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_contador_free_run is -- freerun o descendente
end tb_contador_free_run;

architecture sim of tb_contador_free_run is
    
    signal clk : STD_LOGIC := '0';
    signal rst : STD_LOGIC := '1';
    signal ena : STD_LOGIC := '0';
    signal q   : STD_LOGIC_VECTOR(3 downto 0);

    
    constant clk_period : time := 20 ns;

begin

    
    uut: entity work.contador_free_run
        port map (
            clk => clk,
            rst => rst,
            ena => ena,
            q   => q
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
        wait for 20 ns;
            
        ena <= '1';
        wait for 400 ns; 
            
        ena <= '0';
        wait for 60 ns;
            
        ena <= '1';
        wait for 100 ns;

        rst <= '1';
        wait for 30 ns;
        rst <= '0';
        
        wait;
    end process;

end sim;
