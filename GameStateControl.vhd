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
    idleEnable,runEnable,wonEnable,lostEnable : buffer std_logic
);
END GameStateControl;

ARCHITECTURE StateControl OF GameStateControl IS
BEGIN
    PROCESS (clk,resetn)
    BEGIN
        If (resetn = '0') then
            idleEnable <= '1';
            runEnable <= '0';
            wonEnable <= '0';
            lostEnable <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            if(idleEnable <= '1') then
                if (jump = '1' or duck = '1') then
                    runEnable <= '1';
                    idleEnable <= '0';
                end if;
            elsif(runEnable <= '1') then
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
