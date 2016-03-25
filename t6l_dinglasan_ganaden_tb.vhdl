-- Dinglasan, Danika Mae
-- Ganaden, Ma. Patricia
-- CMSC 132 T-6L

																			-- Library Statements
library IEEE; use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

																			-- Entity Definition
entity t6l_dinglasan_ganaden_tb is
	
end entity t6l_dinglasan_ganaden_tb;

architecture t6l_dinglasan_ganaden_tb of t6l_dinglasan_ganaden_tb is
	signal z: std_logic;													-- data output
	signal A: std_logic;													-- data inputs
	signal B: std_logic;
	signal C: std_logic;
	signal D: std_logic;
	signal E: std_logic;
	signal F: std_logic;
																			-- Component declaration
	component t6l_dinglasan_ganaden is
		port (z: out std_logic;												-- data output
		 A: in std_logic;													-- data inputs
		 B: in std_logic;
		 C: in std_logic;
		 D: in std_logic;
		 E: in std_logic;
		 F: in std_logic);  			
	end component t6l_dinglasan_ganaden;

	begin																	-- start of the architecture
		buzzer: component t6l_dinglasan_ganaden port map(z,A,B,C,D,E,F);
		process																-- declaration of the process
			variable error_count: integer:=0;								-- declaration of the variables
			variable inputs: unsigned (5 downto 0);
			variable expected: std_logic;
			begin															-- start of the process
				inputs:= B"000000";											-- initialize the input
				for count in 0 to 63 loop
					A <= inputs(5);											-- assign each bit to the input variables (signals)
					B <= inputs(4);
					C <= inputs(3);
					D <= inputs(2);
					E <= inputs(1);
					F <= inputs(0);
					wait for 10 ns;											-- expected value is the boolean expression of output
					expected := (E AND F) OR (D AND E) OR (C AND F) OR (C AND D) OR (B AND E) OR (B AND C) OR (A AND F) OR (A AND D) OR (A AND B);
					assert(expected = z) report "OR gate design error!" severity error; -- check if the expected value is equal to output z
					if(z /= expected) then --if output is not equal to expected, increment error count
						error_count:= error_count + 1;
					end if;
					inputs := inputs + 1; --updates the input
				end loop;
				report "Done with test. Errors: " & integer'image(error_count); -- displays the number of errors
				wait;
	end process;
end architecture t6l_dinglasan_ganaden_tb; -- end of the architecture

