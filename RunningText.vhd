-- Western Carolina University
-- EE221 - Logic Systems Design I
-- Saveliy Saunin & Charles Maddrey
-- Cave Runner Game
-- Running Text

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY RunningText IS

PORT(
    clk,resetn,idleEnable,lostEnable,wonEnable : IN STD_LOGIC;
    score0,score1,score2,score3:in integer range 0 to 9;
    newHex : out std_logic_vector(6 downto 0);
    hexMoveEnable : out std_logic
);
END RunningText;

ARCHITECTURE textGenerator OF RunningText IS
    signal count: integer range 0 to 5;
    signal idleTextindex: integer range 0 to 23;
    signal wonTextIndex: integer range 0 to 8;
    signal lostTextIndex: integer range 0 to 27;
    signal p : std_logic_vector(6 downto 0):= "0001100";
    signal r : std_logic_vector(6 downto 0):= "0101111";
    signal e : std_logic_vector(6 downto 0):= "0000110";
    signal s : std_logic_vector(6 downto 0):= "0010010";
    signal b : std_logic_vector(6 downto 0):= "0000011";
    signal u : std_logic_vector(6 downto 0):= "1100011";
    signal t : std_logic_vector(6 downto 0):= "0000111";
    signal o : std_logic_vector(6 downto 0):= "0100011";
    signal n : std_logic_vector(6 downto 0):= "0101011";
    signal a : std_logic_vector(6 downto 0):= "0001000";
    signal y : std_logic_vector(6 downto 0):= "0010001";
    signal c : std_logic_vector(6 downto 0):= "0100111";
    signal l : std_logic_vector(6 downto 0):= "1000111";
    signal i : std_logic_vector(6 downto 0):= "1001111";
    signal d0 : std_logic_vector(6 downto 0):= "1000000";
    signal d1 : std_logic_vector(6 downto 0):= "1111001";
    signal d2 : std_logic_vector(6 downto 0):= "0100100";
    signal d3 : std_logic_vector(6 downto 0):= "0110000";
    signal d4 : std_logic_vector(6 downto 0):= "0011001";
    signal d5 : std_logic_vector(6 downto 0):= "0010010";
    signal d6 : std_logic_vector(6 downto 0):= "0000010";
    signal d7 : std_logic_vector(6 downto 0):= "1111000";
    signal d8 : std_logic_vector(6 downto 0):= "0000000";
    signal d9 : std_logic_vector(6 downto 0):= "0011000";
    signal space : std_logic_vector(6 downto 0):= "1111111";
BEGIN
    PROCESS (clk,resetn)
    BEGIN
        If (resetn = '0') then
            count <= 0;
            idleTextindex <= 0;
            newHex <= space;
            hexMoveEnable <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            hexMoveEnable <= '0';
            if (idleEnable = '1') then
                if(count = 5)then
                    -- we are using increasing the 100ms intervals to 1 second to make the running text slow enough to read
                    count <= 0;
                    case idleTextindex is
                        when 0 => newHex <= p;
                        when 1 => newHex <= r;
                        when 2 => newHex <= e;
                        when 3 => newHex <= s;
                        when 4 => newHex <= s;
                        when 5 => newHex <= space;
                        when 6 => newHex <= a;
                        when 7 => newHex <= space;
                        when 8 => newHex <= b;
                        when 9 => newHex <= u;
                        when 10 => newHex <= t;
                        when 11 => newHex <= t;
                        when 12 => newHex <= o;
                        when 13 => newHex <= n;
                        when 14 => newHex <= space;
                        when 15 => newHex <= t;
                        when 16 => newHex <= o;
                        when 17 => newHex <= space;
                        when 18 => newHex <= s;
                        when 19 => newHex <= t;
                        when 20 => newHex <= a;
                        when 21 => newHex <= r;
                        when 22 => newHex <= t;
                        when 23 => newHex <= space;
                    end case;
                    hexMoveEnable <= '1';

                    if(idleTextindex = 23)then
                        idleTextindex <= 0;
                    else
                        idleTextindex <= idleTextindex + 1;
                    end if;
                else
                    count <= count + 1;
                end if;

            end if;

            if (wonEnable = '1') then
                if(count = 5)then
                    -- we are using increasing the 100ms intervals to 1 second to make the running text slow enough to read
                    count <= 0;
                    case wonTextIndex is
                        when 0 => newHex <= y;
                        when 1 => newHex <= o;
                        when 2 => newHex <= u;
                        when 3 => newHex <= space;
                        when 4 => newHex <= u;
                        when 5 => newHex <= u;
                        when 6 => newHex <= o;
                        when 7 => newHex <= n;
                        when 8 => newHex <= space;
                    end case;
                    hexMoveEnable <= '1';

                    if(wonTextIndex = 8)then
                        wonTextIndex <= 0;
                    else
                        wonTextIndex <= wonTextIndex + 1;
                    end if;
                else
                    count <= count + 1;
                end if;

            end if;
            if (lostEnable = '1') then
                if(count = 5)then
                    -- we are using increasing the 100ms intervals to 1 second to make the running text slow enough to read
                    count <= 0;
                    case lostTextIndex is
                        when 0 => newHex <= y;
                        when 1 => newHex <= o;
                        when 2 => newHex <= u;
                        when 3 => newHex <= space;
                        when 4 => newHex <= l;
                        when 5 => newHex <= o;
                        when 6 => newHex <= s;
                        when 7 => newHex <= t;
                        when 8 => newHex <= space;
                        when 9 => newHex <= y;
                        when 10 => newHex <= o;
                        when 11 => newHex <= u;
                        when 12 => newHex <= r;
                        when 13 => newHex <= space;
                        when 14 => newHex <= s;
                        when 15 => newHex <= c;
                        when 16 => newHex <= o;
                        when 17 => newHex <= r;
                        when 18 => newHex <= e;
                        when 19 => newHex <= space;
                        when 20 => newHex <= i;
                        when 21 => newHex <= s;
                        when 22 => newHex <= space;
                        when 23 =>
                            case score3 is
                                when 0 => newHex <= d0;
                                when 1 => newHex <= d1;
                                when 2 => newHex <= d2;
                                when 3 => newHex <= d3;
                                when 4 => newHex <= d4;
                                when 5 => newHex <= d5;
                                when 6 => newHex <= d6;
                                when 7 => newHex <= d7;
                                when 8 => newHex <= d8;
                                when 9 => newHex <= d9;
                            end case;
                        when 24 =>
                            case score2 is
                                when 0 => newHex <= d0;
                                when 1 => newHex <= d1;
                                when 2 => newHex <= d2;
                                when 3 => newHex <= d3;
                                when 4 => newHex <= d4;
                                when 5 => newHex <= d5;
                                when 6 => newHex <= d6;
                                when 7 => newHex <= d7;
                                when 8 => newHex <= d8;
                                when 9 => newHex <= d9;
                            end case;
                        when 25 =>
                            case score1 is
                                when 0 => newHex <= d0;
                                when 1 => newHex <= d1;
                                when 2 => newHex <= d2;
                                when 3 => newHex <= d3;
                                when 4 => newHex <= d4;
                                when 5 => newHex <= d5;
                                when 6 => newHex <= d6;
                                when 7 => newHex <= d7;
                                when 8 => newHex <= d8;
                                when 9 => newHex <= d9;
                            end case;
                        when 26 =>
                            case score0 is
                                when 0 => newHex <= d0;
                                when 1 => newHex <= d1;
                                when 2 => newHex <= d2;
                                when 3 => newHex <= d3;
                                when 4 => newHex <= d4;
                                when 5 => newHex <= d5;
                                when 6 => newHex <= d6;
                                when 7 => newHex <= d7;
                                when 8 => newHex <= d8;
                                when 9 => newHex <= d9;
                            end case;
                        when 27 => newHex <= space;
                    end case;
                    hexMoveEnable <= '1';

                    if(lostTextIndex = 27)then
                        lostTextIndex <= 0;
                    else
                        lostTextIndex <= lostTextIndex + 1;
                    end if;
                else
                    count <= count + 1;
                end if;

            end if;
        END IF;
    END PROCESS;

END textGenerator;
