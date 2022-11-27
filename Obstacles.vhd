-- Western Carolina University
-- EE221 - Logic Systems Design I
-- Saveliy Saunin & Charles Maddrey
-- Cave Runner Game
-- Obstacles

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Obstacles IS

PORT(
    clk,enable,resetn,newObstacle : IN STD_LOGIC;
    spaces : in integer range 0 to 3;
    hex0, hex1, hex2, hex3, hex4, hex5  : out std_logic_vector (6 downto 0);
	obstacleEnable: out std_logic
);
END Obstacles;

ARCHITECTURE ObstaclesTo7Segment OF Obstacles IS
    signal column0t,column0b : std_logic;
    signal column1t,column1b  : std_logic;
    signal column2t,column2b : std_logic;
    signal column3t,column3b : std_logic;
    signal column4t,column4b : std_logic;
    signal column5t,column5b : std_logic;
    signal column6t,column6b : std_logic;
    signal column7t,column7b : std_logic;
    signal column8t,column8b : std_logic;
    signal column9t,column9b : std_logic;
    signal column10t,column10b : std_logic;
    signal column11t,column11b : std_logic;
    signal count : integer range 0 to 6;
BEGIN
    PROCESS (clk,resetn,enable)
    BEGIN
        If (resetn = '0') then
            hex0 <= "1111111";
            hex1 <= "1111111";
            hex2 <= "1111111";
            hex3 <= "1111111";
            hex4 <= "1111111";
            hex5 <= "1111111";
            count <= 0;
            obstacleEnable <='0';
        ELSIF (clk'EVENT AND clk = '1') THEN 
            obstacleEnable <= '0';
            if (enable = '1') then
                if ((spaces + 3) = count) then
                    obstacleEnable <= '1';
                    count <= 0;
                    if (newObstacle = '1') then
                        column0t <= '0';
                        column0b <= '1';
                    elsif (newObstacle = '0') then
                        column0t <= '1';
                        column0b <= '0';
                    end if;
                else
                    count <= count + 1;
                    column0t <= '1';
                    column0b <= '1';
                end if;
                column1t <= column0t;
                column1b <= column0b;
                hex0 <= "1" & column1t & column1b & "1" & column0b & column0t & "1";

                column2t <= column1t;
                column2b <= column1b;
                column3t <= column2t;
                column3b <= column2b;
                hex1 <= "1" & column3t & column3b & "1" & column2b & column2t & "1";

                column4t <= column3t;
                column4b <= column3b;
                column5t <= column4t;
                column5b <= column4b;
                hex2 <= "1" & column5t & column5b & "1" & column4b & column4t & "1";

                column6t <= column5t;
                column6b <= column5b;
                column7t <= column6t;
                column7b <= column6b;
                hex3 <= "1" & column7t & column7b & "1" & column6b & column6t & "1";

                column8t <= column7t;
                column8b <= column7b;
                column9t <= column8t;
                column9b <= column8b;
                hex4 <= "1" & column9t & column9b & "1" & column8b & column8t & "1";

                column10t <= column9t;
                column10b <= column9b;
                column11t <= column10t;
                column11b <= column10b;
                hex5 <= "1" & column11t & column11b & "1" & column10b & column10t & "1";
            end if;

        END IF;
    END PROCESS;

END ObstaclesTo7Segment;