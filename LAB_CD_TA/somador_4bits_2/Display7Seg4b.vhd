LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY Display7Seg4b IS
    PORT (
        B4      : in STD_LOGIC_VECTOR (3 DOWNTO 0);
        SegU    : out STD_LOGIC_VECTOR (0 TO 6);
        SegD    : out STD_LOGIC_VECTOR (0 TO 6) 
    );
END ENTITY;

ARCHITECTURE dataflow OF Display7Seg4b IS

    -- Sinais internos

    SIGNAL Un   :   unsigned(3 downto 0);
    SIGNAL De   :   unsigned(3 downto 0);

BEGIN 

    -- Conversão 0-15 -> dezena/unidade

    WITH B4 SELECT
        SegU <= "0000001" when "0000", -- 0
                "1001111" when "0001", -- 1
                "0010010" when "0010", -- 2
                "0000110" when "0011", -- 3
                "1001100" when "0100", -- 4
                "0100100" when "0101", -- 5
                "0100000" when "0110", -- 6
                "0001111" when "0111", -- 7
                "0000000" when "1000", -- 8
                "0000100" when "1001", -- 9
                "0000001" when "1010", -- 0 (10)
                "1001111" when "1011", -- 1 (11)
                "0010010" when "1100", -- 2 (12)
                "0000110" when "1101", -- 3 (13)
                "1001100" when "1110", -- 4 (14)
                "0100100" when "1111", -- 5 (15)
                "1111110" when others; -- apagado

    WITH B4 SELECT
        SegD <= "0000001" when "0000" to "1001", -- 0 a 9 (dezena 0)
                "1001111" when "1010" to "1111", -- 10 a 15 (dezena 1)
                "1111110" when others; -- apagado
END ARCHITECTURE;
