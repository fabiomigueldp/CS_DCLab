-- Unidade de Controle – versão cosmética
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY uc IS
    PORT ( F                      : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
           EnA, EnB               : OUT STD_LOGIC;
           InvA, InvB, C0         : OUT STD_LOGIC;
           O1, O0                 : OUT STD_LOGIC );
END uc;

ARCHITECTURE decod OF uc IS
    SIGNAL ctrl : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
    WITH F SELECT
        ctrl <= "00000001" WHEN "000",
                 "00000010" WHEN "001",
                 "00000100" WHEN "010",
                 "00001000" WHEN "011",
                 "00010000" WHEN "100",
                 "00100000" WHEN "101",
                 "01000000" WHEN "110",
                 "10000000" WHEN "111",
                 "00000000" WHEN OTHERS;

    EnA  <= ctrl(1) OR ctrl(2) OR ctrl(3);
    EnB  <= ctrl(1) OR ctrl(2) OR ctrl(3);
    InvB <= ctrl(1) OR ctrl(7);
    InvA <= ctrl(2);
    C0   <= ctrl(1) OR ctrl(2);

    O0   <= ctrl(4) OR ctrl(5);
    O1   <= ctrl(4) OR ctrl(6);
END decod;

