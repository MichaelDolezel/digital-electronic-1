# Lab 5: Michael Doležel

### Flip-flops

1. Listing of VHDL architecture for T-type flip-flop. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture Behavioral of t_ff_rst is
    signal s_q : std_logic;
begin
    p_t_ff_rst : process(clk)
    begin
        if rising_edge(clk) then  -- Synchronous process
   
            if(rst = '1') then
                s_q     <= '0';
            elsif (t = '0') then        
                s_q       <= s_q;
            else
                s_q   <= not s_q;
            end if;
       end if;
    end process p_t_ff_rst;
    
    q       <= s_q;
    q_bar   <= not s_q;
end architecture Behavioral;
```

2. Screenshot with simulated time waveforms. Try to simulate both flip-flops in a single testbench with a maximum duration of 200 ns, including reset. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![Signals](https://github.com/MichaelDolezel/digital-electronic-1/blob/2a6fd506763571efda6f5b3410e0dbf2138285b0/labs/05-Latches%20and%20flip-flops/images/Simulation_flip-flops.png)

### Shift register

1. Image of the shift register block schematic. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

   ![your figure](https://github.com/MichaelDolezel/digital-electronic-1/blob/b345f44df0c727ebe9975b71e828f81dcb0c9279/labs/05-Latches%20and%20flip-flops/images/Shif_reg.png)
