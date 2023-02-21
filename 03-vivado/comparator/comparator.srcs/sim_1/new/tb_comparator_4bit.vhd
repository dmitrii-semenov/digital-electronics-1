------------------------------------------------------------
--
-- Testbench for 4-bit binary comparator.
-- EDA Playground
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_comparator_4bit is
    -- Entity of testbench is always empty
end entity tb_comparator_4bit;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_comparator_4bit is

    -- Local signals
    signal s_a           : std_logic_vector(3 downto 0);
    signal s_b           : std_logic_vector(3 downto 0);
    signal s_B_greater_A : std_logic;
    signal s_B_equals_A  : std_logic;
    signal s_B_less_A    : std_logic;

begin
    -- Connecting testbench signals with comparator_4bit
    -- entity (Unit Under Test)
    uut_comparator_4bit : entity work.comparator_4bit
        port map(
            a_i           => s_a,
            b_i           => s_b,
            B_greater_A_o => s_B_greater_A,
            B_equals_A_o  => s_B_equals_A,
            B_less_A_o    => s_B_less_A
        );

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
	begin
		-- Report a note at the beginning of stimulus process
		report "Stimulus process started" severity note;

		-- 1 test case
        s_b <= "1000"; 
        s_a <= "1001"; 
        wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A = '0') and
                (s_B_less_A = '1'))
        -- If false, then report an error
        report "Input combination A=1001 B=1000 FAILED" severity error;

        -- 2 test case
        s_b <= "1100"; 
        s_a <= "1100"; 
        wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and
            	(s_B_equals_A = '1') and
          	    (s_B_less_A = '0'))
        -- If false, then report an error
        report "Input combination A=1100 B=1100 FAILED" severity error;

        -- 3 test case
        s_b <= "1100"; 
        s_a <= "1011"; 
        wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '1') and
                (s_B_equals_A = '0') and
                (s_B_less_A = '0'))
        -- If false, then report an error
        report "Input combination A=1100 B=1011 FAILED" severity error;

        -- 4 test case
        s_b <= "1010"; 
        s_a <= "0000"; 
        wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '1') and
                (s_B_equals_A = '0') and
                (s_B_less_A = '0'))
        -- If false, then report an error
        report "Input combination A=1010 B=0000 FAILED" severity error;

        -- 5 test case with intentional mistake
        s_b <= "0011"; 
        s_a <= "1010"; 
        wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A = '1') and
                (s_B_less_A = '0'))
        -- If false, then report an error
        report "Input combination A=0011 B=1010 FAILED" severity error;

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;
