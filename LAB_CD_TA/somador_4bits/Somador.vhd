LIBRARY IEEE;                   -- Biblioteca padrão do VHDL
USE IEEE.STD_LOGIC_1164.ALL;    -- Uso do pacote para lógica digital padrão

ENTITY Somador IS
    PORT (
        A, B    :   in  STD_LOGIC_VECTOR(3 DOWNTO 0);
        S       :   out STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cout    :   out STD_LOGIC
    )
END Somador

ARCHITECTURE dataflow OF Somador IS

    component FA
        port ( A, B, Cin : in  STD_LOGIC;
               S, Cout   : out STD_LOGIC );
    end component;

    -- Sinal interno

    SIGNAL c : STD_LOGIC_VECTOR(4 downto 0);

BEGIN

    c(0) <= '0';

    FA0 : FA port map (A(0), B(0), c(0), S(0), c(1));
    FA1 : FA port map (A(1), B(1), c(1), S(1), c(2));
    FA2 : FA port map (A(2), B(2), c(2), S(2), c(3));
    FA3 : FA port map (A(3), B(3), c(3), S(3), c(4));

    Cout <= c(4);

END dataflow;