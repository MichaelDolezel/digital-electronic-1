library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_driver_7seg_4digits is
    -- Entity of testbench is always empty
end entity tb_driver_7seg_4digits;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_driver_7seg_4digits is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    --Local signals
    
    signal s_reset: std_logic;
    
    signal s_clk_100MHz : std_logic;
    signal s_dp_o: std_logic;
    signal s_seg_o   : std_logic_vector(7 - 1 downto 0);
    signal s_dig_o   : std_logic_vector(4 - 1 downto 0);

    constant c_data0_i : std_logic_vector := "0011";
    constant c_data1_i : std_logic_vector := "0001";
    constant c_data2_i : std_logic_vector := "0100";
    constant c_data3_i : std_logic_vector := "0010";
    
    constant c_dp_i: std_logic_vector := "0111";
    

begin
    -- Connecting testbench signals with driver_7seg_4digits
    -- entity (Unit Under Test)
    uut_diver_7seg_4digits : entity work.driver_7seg_4digits
        port map(
        clk  => s_clk_100MHz,
        reset => s_reset,
        data0_i =>  c_data0_i,
        data1_i =>  c_data1_i,
        data2_i =>  c_data2_i,
        data3_i =>  c_data3_i,
        dp_i  => c_dp_i,
        dp_o  => s_dp_o,
        seg_o => s_seg_o,
        dig_o => s_dig_o
        );
    -- WRITE YOUR CODE HERE

    --------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 32 ms loop -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------
     p_reset_gen : process
    begin
        s_reset <= '1'; wait for 10 ns;
        -- Reset deactivated
        s_reset <= '0';
        wait;
    end process p_reset_gen;


    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    -- WRITE YOUR CODE HERE

end architecture testbench;