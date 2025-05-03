-- Biblioteca padrão do VHDL
LIBRARY IEEE;
-- Uso do pacote para lógica digital padrão
USE IEEE.STD_LOGIC_1164.ALL;

-- Definição da entidade, que é o bloco de entrada/saída
ENTITY somador_2bits IS
    PORT(
        x, y : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
        d    : OUT STD_LOGIC_VECTOR(0 TO 6)
    );
END somador_2bits;

-- Definição da arquitetura (comportamento do circuito)
ARCHITECTURE dataflow OF somador_2bits IS

    -- Sinais internos
    SIGNAL w, z : STD_LOGIC;
    SIGNAL s    : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN

    -- Soma dos operandos
    w   <= NOT x(0) AND (x(1) XOR y(1));
    z   <= x(0)     AND (x(1) XOR (y(1) XOR y(0)));

    s(2) <= (x(1) AND y(1))
          OR (x(0) AND y(0) AND (x(1) OR y(1))); y
    s(1) <= w OR z;
    s(0) <= x(0) XOR y(0);

    -- Conversão binária -> 7 segmentos 
    WITH s SELECT
        d <= "0000001" WHEN "000",  -- 0
             "1001111" WHEN "001",  -- 1
             "0010010" WHEN "010",  -- 2
             "0000110" WHEN "011",  -- 3
             "1001100" WHEN "100",  -- 4
             "0100100" WHEN "101",  -- 5
             "0100000" WHEN "110",  -- 6
             "1111111" WHEN OTHERS; -- nenhum segmento aceso

END dataflow;
