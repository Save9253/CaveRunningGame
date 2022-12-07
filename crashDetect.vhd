-- Western Carolina University
-- EE221 - Logic Systems Design I
-- Saveliy Saunin & Charles Maddrey
-- Cave Runner Game
-- Running Text

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY crashDetecter IS

PORT(
    clk,resetn,enable : IN STD_LOGIC;
	 obstaclePossitionT, obstaclePossitionB, manPositionT, manPositionB: in STD_LOGIC;
	 crashDetect : out std_logic
);
END crashDetecter;

ARCHITECTURE detect OF crashDetecter IS

BEGIN
    PROCESS (clk,resetn)
    BEGIN
        If (resetn = '0') then
				crashDetect <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
				if(enable <= '1') then
					crashDetect <= '0';
				    IF (((obstaclePossitionT = '0') AND (manPositionT = '0')) OR
					 ((obstaclePossitionB = '0') AND (manPositionB = '0'))) THEN
					   crashDetect <= '1';
					 END IF;
				end if;
        END IF;
    END PROCESS;

END detect;
