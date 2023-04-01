## Pre-Lab preparation

1. See [schematic](https://github.com/tomas-fryza/digital-electronics-1/blob/master/docs/nexys-a7-sch.pdf) or [reference manual](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/reference-manual) of the Nexys A7 board and find out the connection of two RGB LEDs, ie to which FPGA pins are connected and how. How you can control them to get red, yellow, or green colors? Draw the schematic with RGB LEDs.

   | **RGB LED** | **Artix-7 pin names** | **Red** | **Yellow** | **Green** |
   | :-: | :-: | :-: | :-: | :-: |
   | LD16 | N15, M16, R12 | `1,0,0` | `1,1,0` | `0,1,0` |
   | LD17 | N16, R11, G14 | `1,0,0` | `1,1,0` | `0,1,0` |

2. See [schematic](https://github.com/tomas-fryza/digital-electronics-1/blob/master/docs/nexys-a7-sch.pdf) or [reference manual](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/reference-manual) of the Nexys A7 board and find out to which FPGA pins Pmod ports JA, JB, JC, and JD are connected.

# Lab 8: Dmitrii Semenov

### Traffic light controller

1. Listing of VHDL code of the completed process `p_traffic_fsm`. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
    --------------------------------------------------------
    -- p_traffic_fsm:
    -- A sequential process with synchronous reset and
    -- clock_enable entirely controls the s_state signal by
    -- CASE statement.
    --------------------------------------------------------
    p_traffic_fsm : process (clk) is
    begin

    if (rising_edge(clk)) then
      if (rst = '1') then               
        sig_state <= WEST_STOP;          
        sig_cnt   <= c_ZERO;    
      elsif (sig_en = '1') then

        case sig_state is

          when WEST_STOP =>
            if (sig_cnt < c_DELAY_2SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              sig_state <= WEST_GO;
              sig_cnt <= c_ZERO;
            end if;

          when WEST_GO =>
            if (sig_cnt < c_DELAY_4SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              sig_state <= WEST_WAIT;
              sig_cnt <= c_ZERO;
            end if;
            
          when WEST_WAIT =>
            if (sig_cnt < c_DELAY_1SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              sig_state <= SOUTH_STOP;
              sig_cnt <= c_ZERO;
            end if;
            
          when SOUTH_STOP =>
            if (sig_cnt < c_DELAY_2SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              sig_state <= SOUTH_GO;
              sig_cnt <= c_ZERO;
            end if;

          when SOUTH_GO =>
            if (sig_cnt < c_DELAY_4SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              sig_state <= SOUTH_WAIT;
              sig_cnt <= c_ZERO;
            end if;
            
          when SOUTH_WAIT =>
            if (sig_cnt < c_DELAY_1SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              sig_state <= WEST_STOP;
              sig_cnt <= c_ZERO;
            end if;


          when others =>
            sig_state <= WEST_STOP;
            sig_cnt   <= c_ZERO;

        end case;
      end if; -- Synchronous reset
    end if; -- Rising edge
  end process p_traffic_fsm;
```

2. Screenshot with simulated time waveforms. The full functionality of the entity must be verified. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![https://github.com/dmitrii-semenov/digital-electronics-1/blob/main/08-traffic_lights/wave.png](https://github.com/dmitrii-semenov/digital-electronics-1/blob/main/08-traffic_lights/wave.png)

`P.S. I did the waveform simulation in VS Code and I couldn't add state signal to the output in waveform file. Instead of this WEST and SOUTH LEDs were added in order to control the color of traffic lights.`

3. Figure of Moor-based state diagram of the traffic light controller with *speed button* to ensure a synchronous transition to the `WEST_GO` state. The image can be drawn on a computer or by hand. Always name all states, transitions, and input signals!

   ![https://github.com/dmitrii-semenov/digital-electronics-1/blob/main/08-traffic_lights/scheme.png](https://github.com/dmitrii-semenov/digital-electronics-1/blob/main/08-traffic_lights/scheme.png)