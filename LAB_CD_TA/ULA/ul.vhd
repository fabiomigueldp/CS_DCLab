-- Módulo lógico AND/OR/XOR – versão cosmética
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ul IS
    PORT ( A, B           : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
           Re, Rxor, Rou  : OUT STD_LOGIC_VECTOR(4 DOWNTO 0) );
END ul;

ARCHITECTURE comb OF ul IS
BEGIN
    Re   <= A AND B;
    Rxor <= A XOR B;
    Rou  <= A OR B;
END comb;

