-- Western Carolina University
-- EE221 - Logic Systems Design I
-- Saveliy Saunin & Charles Maddrey
-- Cave Runner Game
-- Running Text

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY RunningText IS

PORT(
    clk,resetn,enable : IN STD_LOGIC;
    newHex : out std_logic_vector(6 downto 0);
    hexMoveEnable : out std_logic
);
END RunningText;

ARCHITECTURE textGenerator OF RunningText IS
    signal count: integer range 0 to 6;
    signal index: integer range 0 to 23;
    signal p : std_logic_vector(6 downto 0):= "0001100";
    signal r : std_logic_vector(6 downto 0):= "0101111";
    signal e : std_logic_vector(6 downto 0):= "0000110";
    signal s : std_logic_vector(6 downto 0):= "0010010";
    signal b : std_logic_vector(6 downto 0):= "0000011";
    signal u : std_logic_vector(6 downto 0):= "1100011";
    signal t : std_logic_vector(6 downto 0):= "0001111";
    signal o : std_logic_vector(6 downto 0):= "0100011";
    signal n : std_logic_vector(6 downto 0):= "0101011";
    signal a : std_logic_vector(6 downto 0):= "0001000";
    --signal y : std_logic_vector(6 downto 0):= "1000100";
    signal space : std_logic_vector(6 downto 0):= "1111111";
BEGIN
    PROCESS (clk,resetn,enable)
    BEGIN
        If (resetn = '0') then
            count <= 0;
            index <= 0;
            newHex <= space;
            hexMoveEnable <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            hexMoveEnable <= '0';
            if (enable = '1') then
                if(count = 6)then
                    -- we are using increasing the 100ms intervals to 1 second to make the running text slow enough to read
                    count <= 0;

                    case index is
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

                    if(index = 23)then
                        index <= 0;
                    else
                        index <= index + 1;
                    end if;
                else
                    count <= count + 1;
                end if;

            end if;
        END IF;
    END PROCESS;

END textGenerator;
