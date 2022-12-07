-- Western Carolina University
-- EE221 - Logic Systems Design I
-- Saveliy Saunin & Charles Maddrey
-- Cave Runner Game
-- Obstacle Generator

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY GameStateControl IS

PORT(
    clk,resetn,jump,duck,won,crash : IN STD_LOGIC;
    idleEnable,runEnable,wonEnable,lostEnable : out std_logic
);
END GameStateControl;

ARCHITECTURE StateControl OF GameStateControl IS
	type state_type is (idleS,runS,wonS,lostS);
    signal gameState: state_type;
BEGIN
    PROCESS (clk,resetn, crash)
    BEGIN
        If (resetn = '0') then
            idleEnable <= '1';
            runEnable <= '0';
            wonEnable <= '0';
            lostEnable <= '0';
				gameState <= idleS;
        ELSIF (clk'EVENT AND clk = '1') THEN
                if (gameState = idleS) then
                    if (jump = '1' or duck = '1') then
                        gameState <= runS;
                        runEnable <= '1';
                        idleEnable <= '0';
                    end if;
                elsif (gameState = runS) then
                    if (crash = '1') then
                        runEnable <= '0';
                        lostEnable <= '1';
                    elsif (won = '1') then
                        runEnable <= '0';
                        wonEnable <= '1';
                    end if;
                end if;
        END IF;
    END PROCESS;

END StateControl;
