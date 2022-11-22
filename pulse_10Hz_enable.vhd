--------------------------------------------------------------
-- EE221 - Logic Systems Design I
-- Fall 2021
-- Author: Yanik
-- Entity: pulse_10Hz_enable
--
-- Description:  This design creates a 20 ns pulse at 10 Hz 
-- given a 50 MHz system clock.  The pulse may be used as an
-- enabling input to design entities for the semester project
-- stopwatch option.
--------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY pulse_10Hz_enable IS
  PORT 
    (
    clk, rstn, ena : IN STD_LOGIC;
    pulse_1Hz : OUT STD_LOGIC
    );
END pulse_10Hz_enable;

ARCHITECTURE behavioral OF pulse_10Hz_enable IS
  signal cnt : STD_LOGIC_VECTOR(23 downto 0);
BEGIN

PROCESS (clk, rstn, ena)
BEGIN   
  IF (rstn = '0') THEN
    cnt <= (OTHERS => '0');
  ELSIF (clk'EVENT AND clk = '1') THEN
    IF (ena = '1') THEN 
      IF (cnt = x"4B4C3F") THEN -- 4b4c3f(hex) = 4,999,999 (decimal)
        cnt <= x"000000";  
      ELSE 
        cnt <= cnt + 1;
      END IF;
    ELSE 
      cnt <= cnt;
    END IF; -- clk
  END IF;
END PROCESS;

WITH cnt SELECT
  pulse_1Hz <= '1' WHEN x"4B4C3F",
        '0' WHEN OTHERS;
END behavioral;
