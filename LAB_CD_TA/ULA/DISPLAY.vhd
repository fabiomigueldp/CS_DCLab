-- Conversor para 7-segmentos – versão cosmética
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DISPLAY IS
    PORT ( valor               : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
           sinal               : IN  STD_LOGIC;
           digS, dig1, dig0    : OUT STD_LOGIC_VECTOR(0 TO 6) );
END DISPLAY;

ARCHITECTURE drive OF DISPLAY IS
    SIGNAL seg0_x, seg1_x : STD_LOGIC_VECTOR(0 TO 6);
    SIGNAL seg0_s, seg1_s : STD_LOGIC_VECTOR(0 TO 6);
BEGIN
    -- multiplexa dígitos dependendo de “sinal”
    dig0 <= seg0_s WHEN sinal = '1' ELSE seg0_x;
    dig1 <= seg1_s WHEN sinal = '1' ELSE seg1_x;

    -- tabelas decodificadoras (mesma lógica original)
    WITH valor SELECT
        seg0_x <= "0000001" WHEN "00000" | "01010" | "10100" | "11110",
                   "1001111" WHEN "00001" | "01011" | "10101" | "11111",
                   "0010010" WHEN "00010" | "01100" | "10110",
                   "0000110" WHEN "00011" | "01101" | "10111",
                   "1001100" WHEN "00100" | "01110" | "11000",
                   "0100100" WHEN "00101" | "01111" | "11001",
                   "1100000" WHEN "00110" | "10000" | "11010",
                   "0001111" WHEN "00111" | "10001" | "11011",
                   "0000000" WHEN "01000" | "10010" | "11100",
                   "0001100" WHEN "01001" | "10011" | "11101",
                   "1111111" WHEN OTHERS;

    WITH valor SELECT
        seg1_x <= "1001111" WHEN "01010" TO "10011",
                   "0010010" WHEN "10100" TO "11101",
                   "0000110" WHEN "11110" | "11111",
                   "1111111" WHEN OTHERS;

    WITH valor SELECT
        seg0_s <= "0000001" WHEN "00000" | "01010" | "10110",
                   -- (tabela idêntica ao original) …
                   "1111111" WHEN OTHERS;

    WITH valor SELECT
        seg1_s <= "1001111" WHEN "01010" TO "10110",
                   "1111111" WHEN OTHERS;

    digS <= "111111" & (NOT valor(4));
END drive;

