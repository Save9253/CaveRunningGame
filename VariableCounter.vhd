-- Western Carolina University
-- EE221 - Logic Systems Design I
-- Saveliy Saunin & Charles Maddrey
-- Cave Runner Game
-- Varable Counter

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY VariableCounter IS

PORT(
    clk,enable,resetn : IN STD_LOGIC;
    countTo : in integer range 0 to 7;
    done   : out std_logic
);
END VariableCounter;

ARCHITECTURE Counter OF VariableCounter IS
    signal count  : integer range 0 to 7;
BEGIN
    PROCESS (clk,resetn,enable)
    BEGIN
        If (resetn = '0') then
            count <= 0;
            done <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN

            if (enable = '1') then
						  done <= '0';
                if (count = countTo) then
                    done <= '1';
                    count <= 0;
                else 
                    count <= count + 1;
                end if;
            end if;

        END IF;
    END PROCESS;

END Counter;
