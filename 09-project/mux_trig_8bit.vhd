library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity mux_trig_8bit is
    port(
        rst         : in  std_logic;
        indat       : in  std_logic_vector(7 downto 0);
        control     : in  std_logic;
        data0       : inout  std_logic_vector(7 downto 0);
        data1       : inout  std_logic_vector(7 downto 0);
        data2       : inout  std_logic_vector(7 downto 0);
        data3       : inout  std_logic_vector(7 downto 0);
        data4       : inout  std_logic_vector(7 downto 0);
        data5       : inout  std_logic_vector(7 downto 0);
        data6       : inout  std_logic_vector(7 downto 0);
        data7       : inout  std_logic_vector(7 downto 0)
    );
end mux_trig_8bit;

architecture Behavioral of mux_trig_8bit is
begin
    
--    data0 <= "10100100"; -- Set - on 1 segment of display
--    data1 <= "10100100"; -- Set - on 2 segment of display
--    data2 <= "10100100"; -- Set - on 3 segment of display
--    data3 <= "10100100"; -- Set - on 4 segment of display
--    data4 <= "10100100"; -- Set - on 5 segment of display
--    data5 <= "10100100"; -- Set - on 6 segment of display
--   data6 <= "10100100"; -- Set - on 7 segment of display
--    data7 <= "10100100"; -- Set - on 8 segment of display

    p_mux_trig_8bit : process is
    begin
        if (rst = '1') then
            data0 <= "10100100"; -- Set - on 1 segment of display
            data1 <= "10100100"; -- Set - on 2 segment of display
            data2 <= "10100100"; -- Set - on 3 segment of display
            data3 <= "10100100"; -- Set - on 4 segment of display
            data4 <= "10100100"; -- Set - on 5 segment of display
            data5 <= "10100100"; -- Set - on 6 segment of display
            data6 <= "10100100"; -- Set - on 7 segment of display
            data7 <= "10100100"; -- Set - on 8 segment of display
        else
            if rising_edge(control) then
                data0 <= indat;
                data1 <= data0; 
                data2 <= data1; 
                data3 <= data2; 
                data4 <= data3; 
                data5 <= data4; 
                data6 <= data5; 
                data7 <= data6; 
            end if;
        end if;
    end process p_mux_trig_8bit;
end Behavioral;
