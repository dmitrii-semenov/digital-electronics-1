library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity tb_mux_trig_8bit is
--  Port ( );
end tb_mux_trig_8bit;

architecture testbench of tb_mux_trig_8bit is
    signal s_rst         : std_logic;
    signal s_indat       : std_logic_vector(7 downto 0);
    signal s_control     : std_logic;
    signal s_data0       : std_logic_vector(7 downto 0);
    signal s_data1       : std_logic_vector(7 downto 0);
    signal s_data2       : std_logic_vector(7 downto 0);
    signal s_data3       : std_logic_vector(7 downto 0);
    signal s_data4       : std_logic_vector(7 downto 0);
    signal s_data5       : std_logic_vector(7 downto 0);
    signal s_data6       : std_logic_vector(7 downto 0);
    signal s_data7       : std_logic_vector(7 downto 0);

begin
    uut_mux_trig_8bit: entity work.mux_trig_8bit
        port map(
            rst       => s_rst,
            indat     => s_indat,
            control   => s_control,
            data0     => s_data0,
            data1     => s_data1,
            data2     => s_data2,
            data3     => s_data3,
            data4     => s_data4,
            data5     => s_data5,
            data6     => s_data6,
            data7     => s_data7
        );

    p_stimulus : process
    begin
        s_rst <= '1';
        wait for 5 ns;
        s_rst <= '0';
        s_indat <= "10101010";
        s_control <= '0';
        wait for 10 ns;
        s_control <= '1';
        wait for 5 ns;
        s_control <= '0';
        s_indat <= "00000001";
        wait for 5 ns;
        s_control <= '1';
        wait for 5 ns;
    end process p_stimulus;
end testbench;