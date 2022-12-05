-- Western Carolina University
-- EE221 - Logic Systems Design I
-- Saveliy Saunin & Charles Maddrey
-- Cave Runner Game
-- Integer to digits converter

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Integer2digits IS

PORT(
    clk,resetn,enable : IN STD_LOGIC;
    integerIn : in integer range 0 to 1023;
    dig0,dig1,dig2,dig3 : out integer range 0 to 9
);
END Integer2digits;

ARCHITECTURE Converter OF Integer2digits IS
BEGIN
    PROCESS (clk,resetn,enable)
    BEGIN
        If (resetn = '0') then
            dig0 <= 0;
            dig1 <= 0;
            dig2 <= 0;
            dig3 <= 0;
        ELSIF (clk'EVENT AND clk = '1') THEN
            if (enable = '1') then
                if(integerIn > 999) then
                    dig3 <= 1;
                    dig2 <= 0;
                    dig1 <= (integerIn/10) mod 10;
                    dig0 <= integerIn mod 10;
                elsif (integerIn > 99) then
                    dig3 <= 0;
                    dig2 <= integerIn/100;
                    dig1 <= (integerIn/10) mod 10;
                    dig0 <= integerIn mod 10;
                elsif (integerIn > 9) then
                    dig3 <= 0;
                    dig2 <= 0;
                    dig1 <= integerIn/10;
                    dig0 <= integerIn mod 10;
                else
                    dig3 <= 0;
                    dig2 <= 0;
                    dig1 <= 0;
                    dig0 <= integerIn;
                end if;
            end if;
        END IF;
    END PROCESS;

END Converter;
