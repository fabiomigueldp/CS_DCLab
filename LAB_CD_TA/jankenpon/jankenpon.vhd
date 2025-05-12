LIBRARY IEEE;                   -- Biblioteca padrão do VHDL
USE IEEE.STD_LOGIC_1164.ALL;    -- Uso do pacote para lógica digital padrão

-- =========================================================================
-- Projeto: Jogo Jankenpon (Pedra-Papel-Tesoura)
-- =========================================================================
-- Mapeamento de entradas/saídas para a placa:
--   * A     => SW17 (Entrada da chave 17)
--   * B     => SW16 (Entrada da chave 16)
--   * C     => SW1  (Entrada da chave 1)
--   * D     => SW0  (Entrada da chave 0)
--   * H     => SW13 (Entrada de habilitação do display)
--   * HEX4  => Saída para o display de 7 segmentos HEX4
-- =========================================================================

-- Definição da entidade, bloco I/O

ENTITY jankenpon IS
    PORT (
        A, B, C, D, H   :   IN  STD_LOGIC;
        HEX4            :   OUT STD_LOGIC_VECTOR(0 TO 6)
    );
END jankenpon;

-- Definição da arquitetura (comportamento do circuito)

ARCHITECTURE dataflow OF jankenpon IS

    -- Sinais internos

    SIGNAL X, Y : STD_LOGIC;
    SIGNAL S    : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN

    -- Determinação do resultado

    X   <=  (A AND B) OR
            (B AND C) OR
            (C AND D) OR
            (NOT A AND NOT B AND D) OR
            (A AND NOT C AND NOT D);

    Y   <=  (A AND B) OR
            (A AND D) OR
            (C AND D) ORLIBRARY IEEE;                   -- Biblioteca padrão do VHDL
USE IEEE.STD_LOGIC_1164.ALL;    -- Uso do pacote para lógica digital padrão
            (NOT A AND NOT B AND C) OR
            (B AND NOT C AND NOT D);

    -- Código de 3 bits para o display

    S(0) <= Y;
    
    S(1) <= X;

    S(2) <= (NOT H);

-- Decodificador para display de 7 segmentos

WITH S SELECT HEX4 <= 
        "0000001" WHEN "000",  -- 0
        "1001111" WHEN "001",  -- 1
        "0010010" WHEN "010",  -- 2
        "0000000" WHEN "011",  -- 8
        "1111111" WHEN OTHERS; -- display apagado

END dataflow;
