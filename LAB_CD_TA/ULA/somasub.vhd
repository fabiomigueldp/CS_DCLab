-- Somador/Subtrator ripple-carry 5 bits – versão cosmética
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY somasub IS
    PORT ( A, B                       : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
           EnA, EnB, InvA, InvB, C0   : IN  STD_LOGIC;
           E                          : OUT STD_LOGIC;
           Rs                         : OUT STD_LOGIC_VECTOR(4 DOWNTO 0) );
END somasub;

ARCHITECTURE datapath OF somasub IS
    SIGNAL a_mask, b_mask             : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL a_eff, b_eff               : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL c_chain                    : STD_LOGIC_VECTOR(5 DOWNTO 0);

    COMPONENT FA
        PORT ( Ai, Bi, Cin : IN  STD_LOGIC;
               Cout, Si    : OUT STD_LOGIC );
    END COMPONENT;
BEGIN
    c_chain(0) <= C0;
    a_mask     <= (4 DOWNTO 0 => EnA);
    b_mask     <= (4 DOWNTO 0 => EnB);

    a_eff <= (A AND a_mask) XOR (4 DOWNTO 0 => InvA);
    b_eff <= (B AND b_mask) XOR (4 DOWNTO 0 => InvB);

    FA_0 : FA PORT MAP ( a_eff(0), b_eff(0), c_chain(0), c_chain(1), Rs(0) );
    FA_1 : FA PORT MAP ( a_eff(1), b_eff(1), c_chain(1), c_chain(2), Rs(1) );
    FA_2 : FA PORT MAP ( a_eff(2), b_eff(2), c_chain(2), c_chain(3), Rs(2) );
    FA_3 : FA PORT MAP ( a_eff(3), b_eff(3), c_chain(3), c_chain(4), Rs(3) );
    FA_4 : FA PORT MAP ( a_eff(4), b_eff(4), c_chain(4), c_chain(5), Rs(4) );

    E <= c_chain(5) XOR c_chain(4);
END datapath;

