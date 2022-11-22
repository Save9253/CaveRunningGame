-- Western Carolina University
-- EE221 - Logic Systems Design I
-- Saveliy Saunin & Charles Maddrey
-- Cave Runner Game
-- Score

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Score IS

PORT(
    clk,enable,resetn : IN STD_LOGIC;
    score : out INTEGER RANGE 0 to 1023;
    difficulty,won : out std_logic
);
END Score;

ARCHITECTURE Counter OF Score IS
    signal currentScore  : integer range 0 to 1023;
    signal wonState : std_logic;
    signal difficultyState : std_logic;
BEGIN
    PROCESS (clk,resetn,enable)
    BEGIN
        If (resetn = '0') then
            score <= 0;
            currentScore <= 0;
            difficulty <= '0';
            difficultyState <= '0';
            won <='0';
            wonState <='0';
        ELSIF (clk'EVENT AND clk = '1') THEN

            if (enable = '1' and wonState ='0') then
                if(currentScore = 1023) then
                    wonState <= '1';
                else
                    currentScore <= currentScore + 1;
                end if;

                if(currentScore = 511) then
                    difficultyState <= '1';
                end if;
            end if;

            score <= currentScore;
            difficulty <= difficultyState;
            won <= wonState;

        END IF;
    END PROCESS;

END Counter;
