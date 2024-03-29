----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2022 11:50:19 AM
-- Design Name: 
-- Module Name: hex_7segg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hex_7segg is
    port(
        hex_i   : in  std_logic_vector(4 - 1 downto 0);
        seg_o   : out std_logic_vector(7 - 1 downto 0);
        dioda1_o : out std_logic_vector(1 - 1 downto 0);
        dioda2_o : out std_logic_vector(1 - 1 downto 0);
        dioda3_o : out std_logic_vector(1 - 1 downto 0);
        dioda4_o : out std_logic_vector(1 - 1 downto 0)
    );
end hex_7segg;

architecture Behavioral of hex_7segg is
begin
    --------------------------------------------------------
    -- p_7seg_decoder:
    -- A combinational process for 7-segment display (Common
    -- Anode) decoder. Any time "hex_i" is changed, the process
    -- is "executed". Output pin seg_o(6) controls segment A,
    -- seg_o(5) segment B, etc.
    --       segment A
    --        | segment B
    --        |  | segment C
    --        +-+|  |   ...   segment G
    --          ||+-+          |
    --          |||            |
    -- seg_o = "0000001"-------+
    --------------------------------------------------------
    dioda1_o <= "0" when (hex_i = "0000") else "1"; 
    
    dioda2_o <= "0" when (hex_i > "1001") else "1";   
    
    dioda3_o <= "0" when (hex_i(0) = '1') else "1"; 
    
    dioda4_o <= "0" when (hex_i = "0001") or (hex_i = "0010") or (hex_i = "0100") or (hex_i = "1000")  else "1";
    
    p_7segg_decoder : process(hex_i)
    begin
        case hex_i is
            when "0000" =>
                seg_o <= "0000001"; -- 0
                
            when "0001" =>
                seg_o <= "1001111"; -- 1

            when "0010" =>
                seg_o <= "0010010";-- 2

            when "0011" =>
                seg_o <= "0000110"; -- 3

            when "0100" =>
                seg_o <= "1001100"; -- 4

            when "0101" =>
                seg_o <= "0100100"; -- 5

            when "0110" =>
                seg_o <= "0100000"; -- 6

            when "0111" =>
                seg_o <= "0001111"; -- 7

            when "1000" =>
                seg_o <= "0000000"; -- 8

            when "1001" =>
                seg_o <= "0000100"; -- 9

            when "1010" =>
                seg_o <= "0001000"; -- A

            when "1011" =>
                seg_o <= "1100000"; -- b

            when "1100" =>
                seg_o <= "0110001"; -- C

            when "1101" =>
                seg_o <= "1000010"; -- d

            when "1110" =>
                seg_o <= "0110000"; -- E
                
            when others =>
                seg_o <= "0111000"; -- F
        end case;
    end process p_7segg_decoder;

end architecture Behavioral;

