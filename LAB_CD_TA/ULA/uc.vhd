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
        ctrl <= "00000001" WHEN "000",  -- Operação A (passagem de A)
                 "00000010" WHEN "001",  -- Subtração A-B
                 "00000100" WHEN "010",  -- Subtração B-A
                 "00001000" WHEN "011",  -- Soma A+B
                 "00010000" WHEN "100",  -- Operação OR
                 "00100000" WHEN "101",  -- Operação AND
                 "01000000" WHEN "110",  -- Operação XOR
                 "10000000" WHEN "111",  -- Complemento de A
                 "00000000" WHEN OTHERS;

    -- Sinais de controle para operações aritméticas
    EnA  <= ctrl(0) OR ctrl(1) OR ctrl(2) OR ctrl(3) OR ctrl(7);  -- Habilita A para: passa A, A-B, B-A, A+B, ~A
    EnB  <= ctrl(1) OR ctrl(2) OR ctrl(3);                        -- Habilita B para: A-B, B-A, A+B
    InvA <= ctrl(2) OR ctrl(7);                                   -- Inverte A para: B-A, ~A
    InvB <= ctrl(1);                                              -- Inverte B para: A-B
    C0   <= ctrl(1) OR ctrl(2);                                   -- Carry-in para subtração

    -- Sinais de seleção do MUX (O1 O0: 00=arith, 01=OR, 10=AND, 11=XOR)
    O0   <= ctrl(4);                                              -- OR
    O1   <= ctrl(5) OR ctrl(6);                                   -- AND ou XOR
END decod;

