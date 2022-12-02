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
    idleEnable,runEnable,wonEnable,lostEnable : out std_logic;
    resetScoren: out std_logic := '1'
);
END GameStateControl;

ARCHITECTURE StateControl OF GameStateControl IS
    type state_type is (idleS,runS,wonS,lostS);
    signal gameState: state_type;
BEGIN
    PROCESS (clk,resetn)
    BEGIN
        If (resetn = '0') then
            gameState <= idleS;
            idleEnable <= '1';
            runEnable <= '0';
            wonEnable <= '0';
            lostEnable <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            resetScoren <= '1';
			case gameState is
                when idleS =>
                    if (jump = '0' or duck = '0') then
                        gameState <= runS;
                        runEnable <= '1';
                        idleEnable <= '0';
                    end if;
                when runS =>
                    if (crash = '1') then
                        gameState <= lostS;
                        runEnable <= '0';
                        lostEnable <= '1';
                        resetScoren <= '0';
                    elsif (won = '1') then
                        gameState <= wonS;
                        runEnable <= '0';
                        wonEnable <= '1';
                        resetScoren <= '0';
                    end if;
                when wonS =>
                    if (jump = '0' or duck = '0') then
                        gameState <= runS;
                        wonEnable <= '0';
                        runEnable <= '1';
                    end if;
                when lostS =>
                    if (jump = '0' or duck = '0') then
                        gameState <= runS;
                        lostEnable <= '0';
                        runEnable <= '1';
                    end if;
            end case;
        END IF;
    END PROCESS;

END StateControl;
