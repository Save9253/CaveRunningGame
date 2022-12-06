-- Western Carolina University
-- EE221 - Logic Systems Design I
-- Saveliy Saunin & Charles Maddrey
-- Cave Runner Game
-- Running Text
--Man Ducking logic will connect to animation. 
--Will be enabled from Man Control
--will light lower left and middle segments for ducking
--will light upper left and middle segments for jumping

--run T- 0, B - 0. jump R - 0, B - 1, duck T - 1, B - 0
--man ducking send output to 7 segment

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY manDucking IS
  PORT(
    clk,resetn, manPositionT, manPositionB : IN STD_LOGIC;
    manHEX                                 : out std_logic_vector(6 downto 0)
    
);
END manDucking ;

ARCHITECTURE jump_duck OF manDucking IS
   SIGNAL run_step1 : std_logic_vector(6 downto 0):= "1001111";
   SIGNAL run_step2 : std_logic_vector(6 downto 0):= "0011111";
   SIGNAL jump      : std_logic_vector(6 downto 0):= "1011110";
   SIGNAL duck      : std_logic_vector(6 downto 0):= "0101111";
   
BEGIN
    PROCESS (clk,resetn)
    BEGIN
        IF (resetn = '0') THEN
		  manHEX <= run_step1;
		ELSIF (clk'EVENT AND clk = '1') THEN
            IF (manPositionT = '0' AND manPositionB = '1') THEN
			  manHEX <= jump;
			
			IF (manPositionB = '0' AND manPositionT = '1' ) THEN
			  manHEX <= duck;
			
			IF (manPositionT = '0' AND manPositionB = '0') THEN
			  manHEX <= run_step1;
			  
			END IF;
			END IF;
		END IF;
		END IF;
	END PROCESS;
END jump_duck;
	