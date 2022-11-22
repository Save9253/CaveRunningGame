-- Western Carolina University
-- EE221 - Logic Systems Design I
-- Saveliy Saunin & Charles Maddrey
-- Cave Runner Game
-- Obstacle Generator

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ObstacleGenerator IS

PORT(
    clk,enable,resetn,jump,duck : IN STD_LOGIC;
    obstacle   : out INTEGER RANGE 0 to 3
);
END ObstacleGenerator;

ARCHITECTURE Randomizer OF ObstacleGenerator IS
    signal state  : integer range 0 to 3;
    signal coinToss: std_logic;
BEGIN
    PROCESS (clk,resetn,enable)
    BEGIN
        If (resetn = '0') then
            state <= 0;
            obstacle <= 0;
				coinToss <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
			--Tossing a coin on every clock cycle
            if (coinToss = '1') then
                coinToss <='0';
            else
                coinToss <='1';
            end if;

            if (enable = '1') then
                --when enabled the a new obsticle is generated
                if(jump = '1' or duck = '1') then
                    --if the jump or duck buttons are pressed it will shift the normal sequence
                    if(coinToss = '0') then
                        --if currently the coin is 0 then we will subtract one
                        state <= state - 1;
                    elsif(coinToss ='1') then
                        --if currently the coin is 1 then we will add 2
                        state <= state + 2;
                    end if;

                else
                    --if no inputs are pressed then we will add 1
                    state <= state + 1;

                end if;
            end if;

            obstacle <= state;

        END IF;
    END PROCESS;

END Randomizer;
