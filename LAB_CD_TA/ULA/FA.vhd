-- Full-Adder – versão cosmética
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FA IS
    PORT ( Ai, Bi, Cin : IN  STD_LOGIC;
           Cout, Si    : OUT STD_LOGIC );
END FA;

ARCHITECTURE logic OF FA IS
    SIGNAL x_ab : STD_LOGIC;
BEGIN
    x_ab <= Ai XOR Bi;
    Si   <= x_ab XOR Cin;
    Cout <= (Ai AND Bi) OR (x_ab AND Cin);
END logic;

