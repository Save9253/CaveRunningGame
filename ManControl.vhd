-- Western Carolina University
-- EE221 - Logic Systems Design I
-- Saveliy Saunin & Charles Maddrey
-- Cave Runner Game
-- Man Control

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ManControl IS

PORT(
    clk,resetn,enable,jump,duck : IN STD_LOGIC;
    manPositionT,manPositionB : buffer std_logic:='0';
    manHex : out std_logic_vector (6 downto 0) := "1001111"
);
END ManControl;

ARCHITECTURE StateControl OF ManControl IS
    type state_type is (runS,jumpS,duckS);
    signal manState: state_type;
    signal count: integer range 0 to 1;
BEGIN
    PROCESS (clk,resetn,enable)
    BEGIN
        If (resetn = '0') then
            manPositionT <= '0';
            manPositionB <= '0';
            count <= 0;
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
                        if (count = 1) then
                            count <=0;
                            manState <= runS;
                            manPositionT <= '0';
                            manPositionB <= '0';
                        else
                            count <= count + 1;
                        end if;
                    when duckS =>
                        if (count = 1) then
                            count <=0;
                            manState <= runS;
                            manPositionT <= '0';
                            manPositionB <= '0';
                        else
                            count <= count + 1;
                        end if;
                end case;
                manHex <= "1" & manPositionT & manPositionB & "1111";
            end if;
        END IF;
    END PROCESS;

END StateControl;
