-- Western Carolina University
-- EE221 - Logic Systems Design I
-- Saveliy Saunin & Charles Maddrey
-- Cave Runner Game
-- Man Control

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.ALL;

ENTITY ManControl IS

PORT(
    clk,resetn,enable,jump,duck : IN STD_LOGIC;
    manPositionT,manPositionB : buffer std_logic:='0';
    manHex : out std_logic_vector (6 downto 0) := "1001111"
);
END ManControl;

ARCHITECTURE StateControl OF ManControl IS
BEGIN
    PROCESS (clk,resetn,enable)
    BEGIN
        If (resetn = '0') then
            manPositionT <= '0';
            manPositionB <= '0';
            manHex <= "1001111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            if (jump = '1') then
                manPositionT <= '0';
                manPositionB <= '1';
            elsif (duck = '1') then
                manPositionT <= '1';
                manPositionB <= '0';
            end if;
            if (enable = '1') then
                manPositionB <= '0';
                manPositionT <= '0';
            end if;
            manHex <= "1" & manPositionT & manPositionB & "1111";
        END IF;
    END PROCESS;

END StateControl;
