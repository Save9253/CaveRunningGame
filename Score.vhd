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
    won : out std_logic;
    gameSpeed : buffer integer range 0 to 7:=7;
    spaces : buffer integer range 0 to 3:=3
);
END Score;

ARCHITECTURE Counter OF Score IS
    signal currentScore  : integer range 0 to 1023;
    signal wonState : std_logic;
BEGIN
    PROCESS (clk,resetn,enable)

    BEGIN
        If (resetn = '0') then
            score <= 0;
            currentScore <= 0;
            gameSpeed <= 7;
            spaces <= 3;
            won <='0';
            wonState <='0';
        ELSIF (clk'EVENT AND clk = '1') THEN

            if (enable = '1' and wonState ='0') then
                if(currentScore = 1023) then
                    wonState <= '1';
                else
                    currentScore <= currentScore + 1;
                end if;

                if(currentScore = 8) then
                    gameSpeed <= 6;
                elsif(currentScore = 16) then
                    spaces <= 2;
                elsif(currentScore = 24) then
                    gameSpeed <= 5;
                elsif(currentScore = 40) then
                    gameSpeed <= 4;
                elsif(currentScore = 64) then
                    spaces <= 1;
                elsif(currentScore = 104) then
                    gameSpeed <= 3;
                elsif(currentScore = 168) then
                    gameSpeed <= 2;
                elsif(currentScore = 272) then
                    spaces <= 0;
                elsif(currentScore = 440) then
                    gameSpeed <= 1;
                elsif(currentScore = 712) then
                    gameSpeed <= 0;
                end if;
            end if;

            score <= currentScore;
            won <= wonState;

        END IF;
    END PROCESS;

END Counter;
