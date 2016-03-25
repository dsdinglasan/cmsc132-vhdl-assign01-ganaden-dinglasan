-- Dinglasan, Danika Mae
-- Ganaden, Ma. Patricia
-- CMSC 132 T-6L

-- Library Statements
library IEEE; use IEEE.std_logic_1164.all;

-- Entity Definition
entity t6l_dinglasan_ganaden is
	port (z: out std_logic; -- data output
	 A: in std_logic;--data input
	 B: in std_logic;
	 C: in std_logic;
	 D: in std_logic;
	 E: in std_logic;
	 F: in std_logic);  			
end entity t6l_dinglasan_ganaden;

architecture buzzer of t6l_dinglasan_ganaden is --declaration of the architecture

begin
	z <= (E AND F) OR (D AND E) OR (C AND F) OR (C AND D) OR (B AND E) OR (B AND C) OR (A AND F) OR (A AND D) OR (A AND B); -- boolean expression for the output
end architecture buzzer;

