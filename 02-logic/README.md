## Pre-Lab preparation

*Digital* or *Binary comparator* compares the digital signals A, B presented at input terminal and produce outputs depending upon the condition of those inputs.

1. Complete the truth table for 2-bit *Identity comparator* (B equals A), and two *Magnitude comparators* (B is greater than A, B is less than A). Note that, such a digital device has four inputs and three outputs/functions.

   | **Dec. equivalent** | **B[1:0]** | **A[1:0]** | **B is greater than A** | **B equals A** | **B is less than A** |
   | :-: | :-: | :-: | :-: | :-: | :-: |
   |  0 | 0 0 | 0 0 | 0 | 1 | 0 |
   |  1 | 0 0 | 0 1 | 0 | 0 | 1 |
   |  2 | 0 0 | 1 0 | 0 | 0 | 1 |
   |  3 | 0 0 | 1 1 | 0 | 0 | 1 |
   |  4 | 0 1 | 0 0 | 1 | 0 | 0 |
   |  5 | 0 1 | 0 1 | 0 | 1 | 0 |
   |  6 | 0 1 | 1 0 | 0 | 0 | 1 |
   |  7 | 0 1 | 1 1 | 0 | 0 | 1 |
   |  8 | 1 0 | 0 0 | 1 | 0 | 0 |
   |  9 | 1 0 | 0 1 | 1 | 0 | 0 |
   | 10 | 1 0 | 1 0 | 0 | 1 | 0 |
   | 11 | 1 0 | 1 1 | 0 | 0 | 1 |
   | 12 | 1 1 | 0 0 | 1 | 0 | 0 |
   | 13 | 1 1 | 0 1 | 1 | 0 | 0 |
   | 14 | 1 1 | 1 0 | 1 | 0 | 0 |
   | 15 | 1 1 | 1 1 | 0 | 1 | 0 |

<a name="part1"></a>

# Lab 2: Dmitrii Semenov

### 2-bit comparator

1. Karnaugh maps for other two functions of 2-bit comparator:

   B is greater than A:

   ![K-maps](https://github.com/evvejiji/digital-electronics-1/blob/main/02-logic/bigger.png)

   B is less than A:

   ![K-maps](https://github.com/evvejiji/digital-electronics-1/blob/main/02-logic/less.png)

2. Mark the largest possible implicants in the K-map and according to them, write the equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![Logic functions](images/comparator_min.png)

### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **xx89??**

```vhdl
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
        s_a <= "0101"; 
        wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '1') and
            (s_B_equals_A = '0') and
            (s_B_less_A = '0'))
        -- If false, then report an error
        report "Input combination A=1010 B=0101 FAILED" severity error;

        -- 5 test case with intentional mistake
        s_b <= "0011"; 
        s_a <= "1010"; 
        wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and
            (s_B_equals_A = '0') and
            (s_B_less_A = '1'))
        -- If false, then report an error
        report "Input combination A=0011 B=1010 FAILED" severity error;

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

2. Link to your public EDA Playground example:

   [https://edaplayground.com/x/JTHa](https://edaplayground.com/x/JTHa)