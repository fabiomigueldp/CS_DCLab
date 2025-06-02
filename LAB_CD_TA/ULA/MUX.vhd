-- Multiplexador 4-para-1 – versão cosmética
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX IS
    PORT ( Re, Rxor, Rou, Rs : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
           O1, O0            : IN  STD_LOGIC;
           S                 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0) );
END MUX;

ARCHITECTURE sel OF MUX IS
    SIGNAL sel_vec : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
    sel_vec <= O1 & O0;

    WITH sel_vec SELECT
        S <= Rs   WHEN "00",
             Rou  WHEN "01",
             Re   WHEN "10",
             Rxor WHEN "11";
END sel;

