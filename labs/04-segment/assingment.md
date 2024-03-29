# Lab 4: Michael Doležel 230241

### Seven-segment display decoder

1. Listing of VHDL stimulus process from testbench file (`tb_hex_7seg.vhd`) with asserts. Verify all input combinations. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
  p_stimulus : process
    begin
        report "Stimulus process started" severity note;

-- 0 test case
        s_hex <= "0000"; wait for 50 ns;
        assert (s_seg = "0000001")
        report "Input combination 0000 FAILED" severity error;
		
        -- 1 test case
        s_hex <= "0001"; wait for 50 ns;
        assert (s_seg = "1001111")
        report "Input combination 0001 FAILED" severity error;
        
        -- 2 test case
        s_hex <= "0010"; wait for 50 ns;
        assert (s_seg = "0010010")
        report "Input combination 0010 FAILED" severity error;
        
        -- 3 test case
        s_hex <= "0011"; wait for 50 ns;
        assert (s_seg = "0000110")
        report "Input combination 0011 FAILED" severity error;
        
        -- 4 test case
        s_hex <= "0100"; wait for 50 ns;
        assert (s_seg = "1001100")
        report "Input combination 0100 FAILED" severity error;
        
        -- 5 test case
        s_hex <= "0101"; wait for 50 ns;
        assert (s_seg = "0100100")
        report "Input combination 0101 FAILED" severity error;
        
        -- 6 test case
        s_hex <= "0110"; wait for 50 ns;
        assert (s_seg = "0000100")
        report "Input combination 0110 FAILED" severity error;
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

2. Screenshot with simulated time waveforms. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![https://github.com/MichaelDolezel/digital-electronic-1/blob/2cc39318961354fc23a9ef763ee3c5c3f4884a7f/labs/04-segment/images/prubeh.png](https://github.com/MichaelDolezel/digital-electronic-1/blob/2cc39318961354fc23a9ef763ee3c5c3f4884a7f/labs/04-segment/images/prubeh.png)

### LED(7:4) indicators

1. Listing of LEDs(7:4) part of VHDL architecture from source file `top.vhd`. Try to write logic functions as simple as possible. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
    --------------------------------------------------------------------
    -- Experiments on your own: LED(7:4) indicators
    -- Turn LED(4) on if input value is equal to 0, ie "0000"
    -- LED(4) <= `0` when (hex_i = "0000") else "1"; 
    
    -- Turn LED(5) on if input value is greater than "1001", ie 10, 11, 12, ...
    -- LED(5) <= "0" when (hex_i > "1001") else "1";
    
    -- Turn LED(6) on if input value is odd, ie 1, 3, 5, ...
    -- LED(6) <= "0" when (hex_i(0) = '1') else "1"; 
    
    -- Turn LED(7) on if input value is a power of two, ie 1, 2, 4, or 8
    -- LED(7) <= "0" when (hex_i = "0001") or (hex_i = "0010") or (hex_i = "0100") or (hex_i = "1000")  else "1";
```
