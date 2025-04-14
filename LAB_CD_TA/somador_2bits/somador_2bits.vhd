-- Biblioteca padrão do VHDL
LIBRARY IEEE;
-- Uso do pacote para lógica digital padrão
USE IEEE.STD_LOGIC_1164.ALL;

-- Definição da entidade, que é o bloco de entrada/saída
ENTITY somador_2bits IS -- Renomeado para clareza (opcional)
    PORT(
        X1, X0 : IN STD_LOGIC;  -- Número X (X1 = MSB, X0 = LSB)
        Y1, Y0 : IN STD_LOGIC;  -- Número Y (Y1 = MSB, Y0 = LSB)
        S2, S1, S0 : OUT STD_LOGIC -- Soma S (S2 = MSB, S0 = LSB)
    );
END somador_2bits;

-- Definição da arquitetura (comportamento do circuito)
ARCHITECTURE dataflow OF somador_2bits IS
BEGIN

     S0 <= X0 XOR Y0;
     S1 <= X1 XOR Y1 XOR (X0 AND Y0);
     S2 <= (X1 AND Y1) OR (X1 AND X0 AND Y0) OR (Y1 AND X0 AND Y0);

END dataflow;