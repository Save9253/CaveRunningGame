-- Western Carolina University
-- EE221 - Logic Systems Design I
-- Saveliy Saunin & Charles Maddrey
-- Cave Runner Game
-- Obstacle Generator

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ObstacleGenerator IS

PORT(
    clk,input,resetn : IN STD_LOGIC;
    output   : out std_logic
);
END ObstacleGenerator;

ARCHITECTURE SequenceDetector OF ObstacleGenerator IS
    type state_type is (idle,s1,s10,s101);
    signal state  :state_type;
BEGIN
    PROCESS (clk,resetn)
    BEGIN
        If (resetn = '0') then
            state <= idle;
        ELSIF (clk'EVENT AND clk = '1') THEN
            output <= '0';
            case state is
                when idle =>
                    if (input = '1') then state <= s1; end if;
                when s1 =>
                    if (input = '1') then state <= idle;
                    else state <= s10; end if;
                when s10 =>
                    if (input = '1') then
                        state <= s101;
                        output <= '1';
                    else state <= idle; end if;
                when s101 =>
                    if (input = '1') then state <= s1;
                    else state <= s10; end if;
            end case;
        END IF;
    END PROCESS;

END SequenceDetector;
