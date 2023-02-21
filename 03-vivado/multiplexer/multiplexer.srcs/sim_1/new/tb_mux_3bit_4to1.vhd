----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2023 02:16:33 PM
-- Design Name: 
-- Module Name: tb_mux_3bit_4to1 - Behavioral
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

entity tb_mux_3bit_4to1 is
--  Port ( );
end tb_mux_3bit_4to1;

architecture testbench of tb_mux_3bit_4to1 is
    signal s_a     : std_logic_vector(2 downto 0);
    signal s_b     : std_logic_vector(2 downto 0);
    signal s_c     : std_logic_vector(2 downto 0);
    signal s_d     : std_logic_vector(2 downto 0);
    signal s_slc     : std_logic_vector(1 downto 0);
    signal s_f     : std_logic_vector(2 downto 0);

begin
    uut_mux_3bit_4to1: entity work.mux_3bit_4to1
        port map(
            a   => s_a,
            b   => s_b,
            c   => s_c,
            d   => s_d,
            slc   => s_slc,
            f   => s_f
        );

    p_stimulus : process
    begin
        s_a <= "100";
        s_b <= "101";
        s_c <= "110";
        s_d <= "111";
        s_slc <= "10";
        wait for 100 ns;
        assert (s_f = "110")
        report "Failed" severity error;
        wait;
    end process p_stimulus;
end testbench;
