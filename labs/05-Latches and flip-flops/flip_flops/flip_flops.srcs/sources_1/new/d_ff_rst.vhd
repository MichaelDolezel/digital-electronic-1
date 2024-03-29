
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_ff_rst is
    Port ( clk : in     STD_LOGIC;
           rst : in     STD_LOGIC;
           d :   in     STD_LOGIC;
           q :   out    STD_LOGIC;
           q_bar : out  STD_LOGIC
           );
end d_ff_rst;

architecture Behavioral of d_ff_rst is
begin
    p_d_ff_rst : process(clk)
    begin
        if rising_edge(clk) then  -- Synchronous process

            -- USE HIGH-ACTIVE RESET HERE
            if(rst = '1') then
            q       <= '0';
            q_bar   <= '1';
            --reseting
            else
            --natural working state
                q     <= d;
                q_bar <= not d;
            end if;
        end if;
    end process p_d_ff_rst;
end architecture Behavioral;
