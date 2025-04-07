-- Biblioteca padrão do VHDL
LIBRARY IEEE;
-- Uso do pacote para lógica digital padrão
USE IEEE.STD_LOGIC_1164.ALL;

-- Definição da entidade, que é o bloco de entrada/saída
ENTITY projeto1 IS
    PORT(
        A, B : IN STD_LOGIC;  -- Entradas A e B do tipo lógica padrão
        X     : OUT STD_LOGIC  -- Saída X do tipo lógica padrão
    );
END projeto1;

-- Definição da arquitetura (comportamento do circuito)
ARCHITECTURE paralelo OF projeto1 IS
BEGIN
    -- Atribuição da saída X com base nas entradas A e B
    -- Expressão lógica: X = (A AND B) OR (NOT A AND NOT B)
    -- Essa é a lógica de uma equivalência (XNOR)
    X <= (A AND B) OR (NOT A AND NOT B);

END paralelo;
