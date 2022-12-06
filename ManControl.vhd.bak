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
    gameSpeed: in integer range 0 to 7;
    manPositionT,manPositionB : buffer std_logic:='0';
    manHex : out std_logic_vector (6 downto 0) := "1001111"
);
END ManControl;

ARCHITECTURE StateControl OF ManControl IS
    type state_type is (runS,jumpS,duckS);
    signal manState: state_type;
    signal countClk: STD_LOGIC_VECTOR(23 downto 0);
    signal countSpeed: integer range 0 to 8;
BEGIN
    PROCESS (clk,resetn,enable)
    BEGIN
        If (resetn = '0') then
            manPositionT <= '0';
            manPositionB <= '0';
            countClk <= (OTHERS => '0');
            countSpeed <= 1;
            manHex <= "1001111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            if (enable = '1') then
                case manState is
                    when runS =>
                        if (jump = '0') then
                            manState <= jumpS;
                            manPositionT <= '0';
                            manPositionB <= '1';
                        elsif (duck = '0') then
                            manState <= duckS;
                            manPositionT <= '1';
                            manPositionB <= '0';
                        end if;
                    when jumpS =>
                        if (countClk = x"4B4C3F") then
                            countClk <=x"000000";
                            countSpeed <= countSpeed + 1;
                        else
                            countClk <= countClk + 1;
                        end if;

                        if (countSpeed = (gameSpeed + 1)) then
                            countSpeed <= 0;
                            manState <= runS;
                            manPositionT <= '0';
                            manPositionB <= '0';
                        else
                            countSpeed <= countSpeed + 1;
                        end if;
                    when duckS =>
                        if (countClk = x"4B4C3F") then
                            countClk <=x"000000";
                            countSpeed <= countSpeed + 1;
                        else
                            countClk <= countClk + 1;
                        end if;

                        if (countSpeed = (gameSpeed + 1)) then
                            countSpeed <= 0;
                            manState <= runS;
                            manPositionT <= '0';
                            manPositionB <= '0';
                        else
                            countSpeed <= countSpeed + 1;
                        end if;
                end case;
                manHex <= "1" & manPositionT & manPositionB & "1111";
            end if;
        END IF;
    END PROCESS;

END StateControl;
