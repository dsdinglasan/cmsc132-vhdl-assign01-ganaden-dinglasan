
-- Library Statements
library IEEE; use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entity Definition
entity t6l_dinglasan_ganaden_tb is
	constant PERIOD1: time := 100 ns; -- clock period
end entity t6l_dinglasan_ganaden_tb;

architecture t6l_dinglasan_ganaden_tb of t6l_dinglasan_ganaden_tb is
	signal z: std_logic;	-- data output from the state machine
	signal A: std_logic;
	signal B: std_logic;
	signal C: std_logic;
	signal D: std_logic;
	signal E: std_logic;
	signal F: std_logic;
	-- Component declaration
	component t6l_dinglasan_ganaden is
		port (z: out std_logic; -- data output
		 A: in std_logic;
		 B: in std_logic;
		 C: in std_logic;
		 D: in std_logic;
		 E: in std_logic;
		 F: in std_logic);  			
	end component t6l_dinglasan_ganaden;

	-- Error checking and reporting procedure
	procedure check_state_z
		expected_z: std_logic;
		actual_z: std_logic;
		error_count: inout integer) is
	begin
		-- check if expected_state is the same as actual_state
		assert(expected_state = actual_state)
			report "ERROR: Expected state (" &
				std_logic'image(expected_state(1)) &
				std_logic'image(expected_state(0)) & ") /= actual (" &
				std_logic'image(actual_state(1)) &
				std_logic'image(actual_state(0)) &
				") at time " & time'image(now);

			-- increment error_count (z)
			if(expected_z/=actual_z) then
				report "ERROR: Expected output z (" &
					std_logic'image(expected_z) & ") /= actual (" &
					std_logic'image(actual_z) &
					") at time " & time'image(now);
				error_count := error_count + 1;
			end if;	-- of if (expected_z /= acutal check z)
	end procedure check_state_z;

begin	-- begin main body of the simple architecture
	-- instantiate the unit under test
	buzzer: component t6l_dinglasan_ganaden port map(z,A,B,C,D,E,F);

	-- main process: generate test vectors and check results
	main: process is
		variable error_count: integer := 0; -- number of simulation errors
	begin
		report "Start simulation.";
		x <= '0';		-- initial data value
		wait for PERIOD1;
		check_state_z(S0,'0', state, z, error_count); -- start at S0
		wait for PERIOD1;
		check_state_z(S2,'1', state, z, error_count); -- go to S2
		x <= '1';
		wait for PERIOD1;
		check_state_z(S0,'0', state, z, error_count); -- go to S0
		wait for PERIOD1;
		check_state_z(S1,'0', state, z, error_count); -- go to S1
		wait for PERIOD1;
		check_state_z(S1,'0', state, z, error_count); -- stay in S1
		x <= '0';
		wait for PERIOD1;
		check_state_z(S2,'1', state, z, error_count); -- go to S2
		wait for PERIOD1;
		check_state_z(S0,'0', state, z, error_count); -- go to S0
		wait for PERIOD1;
		
		-- check if there are errors
		if(error_count=0) then
			report "Simulation completed with NO errors.";
		else
			report "ERROR: There were " &
					integer'image(error_count) & " errors.";
		end if;

		wait;		-- halt this process (note: simulation
	end process main; -- continues due to clk assignment statement)
end architecture t6l_dinglasan_ganaden_tb;

