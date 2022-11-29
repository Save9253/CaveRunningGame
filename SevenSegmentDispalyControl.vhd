-- Western Carolina University
-- EE221 - Logic Systems Design I
-- Saveliy Saunin & Charles Maddrey
-- Cave Runner Game
-- Running Text

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY SevenSegmentDisplayControl IS

PORT(
    clk,resetn,runninTextEnable,gameEnable : IN STD_LOGIC;
    newRunninTextHex, newObstacleHex0,newObstacleHex1,newObstacleHex2,newObstacleHex3,newObstacleHex4,newObstacleHex5 : in std_logic_vector(6 downto 0);
    hex0,hex1,hex2,hex3,hex4,hex5 : buffer std_logic_vector(6 downto 0):="1111111"
);
END SevenSegmentDisplayControl;

ARCHITECTURE Multiplex OF SevenSegmentDisplayControl IS

BEGIN
    PROCESS (clk,resetn,runninTextEnable,gameEnable)
    BEGIN
        If (resetn = '0') then
            hex0 <= "1111111";
            hex1 <= "1111111";
            hex2 <= "1111111";
            hex3 <= "1111111";
            hex4 <= "1111111";
            hex5 <= "1111111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            if (runninTextEnable = '1') then
                hex0 <= newRunninTextHex;
                hex1 <= hex0;
                hex2 <= hex1;
                hex3 <= hex2;
                hex4 <= hex3;
                hex5 <= hex4;
            elsif (gameEnable = '1') then
                hex0 <= newObstacleHex0;
                hex1 <= newObstacleHex1;
                hex2 <= newObstacleHex2;
                hex3 <= newObstacleHex3;
                hex4 <= newObstacleHex4;
                hex5 <= newObstacleHex5;
            end if;
        END IF;
    END PROCESS;

END Multiplex;
