-- Western Carolina University
-- EE221 - Logic Systems Design I
-- Saveliy Saunin & Charles Maddrey
-- Cave Runner Game
-- Varable Counter

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Hold IS

PORT(
    clk,enable,resetn : IN STD_LOGIC;
    holdFor : in integer range 0 to 7;
    output   : out std_logic
);
END Hold;

ARCHITECTURE Holder OF Hold IS
    signal count  : integer range 0 to 7;
BEGIN
    PROCESS (clk,resetn,enable)
    BEGIN
        If (resetn = '0') then
            count <= 0;
            output <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            if (holdFor = 0) then
                    output <= '0';
            end if;

            if (enable = '1') then
                if (holdFor = 0) then
                    output <= '1';
                else
                    if (count = holdFor) then
                        count <= 0;
                        output <= '0';
                    else 
                        count <= count + 1;
                        output <= '1';
                    end if;
                end if;
            end if;

        END IF;
    END PROCESS;

END Holder;
