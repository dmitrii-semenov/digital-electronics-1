----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2023 01:10:47 PM
-- Design Name: 
-- Module Name: t_ff_rst - Behavioral
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

entity jk_ff_rst is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           j : in STD_LOGIC;
           k : in STD_LOGIC;
           q : out STD_LOGIC;
           q_bar : out STD_LOGIC);
end jk_ff_rst;

architecture behavioral of jk_ff_rst is
    signal sig_q : std_logic;
    begin
    p_jk_ff_rst : process (clk)
    begin
    if rising_edge(clk) then
            if (rst = '1') then
                sig_q <= '0';
            elsif (j = '0') then
                if (k = '0') then
                    sig_q <= sig_q;
                else
                    sig_q <= '0';
            else
                if (k = '0') then
                    sig_q <= '1';
                else
                    sig_q <= not sig_q;
            end if;
        end if;
        end process p_jk_ff_rst;
    q     <= sig_q;
    q_bar <= not sig_q;
end architecture behavioral;