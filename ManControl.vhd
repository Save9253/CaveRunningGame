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
	SIGNAL run_step1 : std_logic_vector(6 downto 0):= "1001111";
    SIGNAL run_step2 : std_logic_vector(6 downto 0):= "0011111";
    SIGNAL jumpHex      : std_logic_vector(6 downto 0):= "1011110";
    SIGNAL duckHex    : std_logic_vector(6 downto 0):= "0101111";
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
					 manHEX <= jumpHex;
            elsif (duck = '1') then
                manPositionT <= '1';
                manPositionB <= '0';
					 manHEX <= duckHEx;
            end if;

            if (enable = '1') then
                manPositionB <= '0';
                manPositionT <= '0';
					manHEX <= run_step1;
				END IF;
			END IF;
    END PROCESS;

END StateControl;
