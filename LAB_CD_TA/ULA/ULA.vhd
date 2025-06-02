-- Unidade Lógica-Aritmética – versão “cosmética”
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ULA IS
    PORT (
        A, B    : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
        F       : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        sS      : OUT STD_LOGIC_VECTOR(0 TO 6);
        dSd     : OUT STD_LOGIC_VECTOR(0 TO 6);
        dSu     : OUT STD_LOGIC_VECTOR(0 TO 6);
        E       : OUT STD_LOGIC
    );
END ULA;

ARCHITECTURE estruturada OF ULA IS
    -- sinais de controle
    SIGNAL en_a, en_b      : STD_LOGIC;
    SIGNAL inv_a, inv_b    : STD_LOGIC;
    SIGNAL c0_i            : STD_LOGIC;

    -- saídas parciais
    SIGNAL and_r, xor_r, or_r : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL arith_r           : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL sel1, sel0        : STD_LOGIC;
    SIGNAL s_bus             : STD_LOGIC_VECTOR(4 DOWNTO 0);

    -- declarações de componentes
    COMPONENT ul
        PORT ( A, B : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
               Re, Rxor, Rou : OUT STD_LOGIC_VECTOR(4 DOWNTO 0) );
    END COMPONENT;

    COMPONENT MUX
        PORT ( Re, Rxor, Rou, Rs : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
               O1, O0            : IN  STD_LOGIC;
               S                 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0) );
    END COMPONENT;

    COMPONENT somasub
        PORT ( A, B                       : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
               EnA, EnB, InvA, InvB, C0   : IN  STD_LOGIC;
               E                          : OUT STD_LOGIC;
               Rs                         : OUT STD_LOGIC_VECTOR(4 DOWNTO 0) );
    END COMPONENT;

    COMPONENT uc
        PORT ( F                 : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
               EnA, EnB          : OUT STD_LOGIC;
               InvA, InvB, C0    : OUT STD_LOGIC;
               O1,  O0           : OUT STD_LOGIC );
    END COMPONENT;

    COMPONENT DISPLAY
        PORT ( valor              : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
               sinal              : IN  STD_LOGIC;
               digS, dig1, dig0   : OUT STD_LOGIC_VECTOR(0 TO 6) );
    END COMPONENT;
BEGIN
    -- instâncias
    UC_i : uc
        PORT MAP ( F, en_a, en_b, inv_a, inv_b, c0_i, sel1, sel0 );

    ARITH_i : somasub
        PORT MAP ( A, B, en_a, en_b, inv_a, inv_b, c0_i, E, arith_r );

    LOGIC_i : ul
        PORT MAP ( A, B, and_r, xor_r, or_r );

    MUX_i : MUX
        PORT MAP ( and_r, xor_r, or_r, arith_r, sel1, sel0, s_bus );

    DISP_i : DISPLAY
        PORT MAP ( s_bus, '1', sS, dSd, dSu );
END estruturada;
-- Unidade Lógica-Aritmética – versão “cosmética”
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ULA IS
    PORT (
        A, B    : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
        F       : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        sS      : OUT STD_LOGIC_VECTOR(0 TO 6);
        dSd     : OUT STD_LOGIC_VECTOR(0 TO 6);
        dSu     : OUT STD_LOGIC_VECTOR(0 TO 6);
        E       : OUT STD_LOGIC
    );
END ULA;

ARCHITECTURE estruturada OF ULA IS
    -- sinais de controle
    SIGNAL en_a, en_b      : STD_LOGIC;
    SIGNAL inv_a, inv_b    : STD_LOGIC;
    SIGNAL c0_i            : STD_LOGIC;

    -- saídas parciais
    SIGNAL and_r, xor_r, or_r : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL arith_r           : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL sel1, sel0        : STD_LOGIC;
    SIGNAL s_bus             : STD_LOGIC_VECTOR(4 DOWNTO 0);

    -- declarações de componentes
    COMPONENT ul
        PORT ( A, B : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
               Re, Rxor, Rou : OUT STD_LOGIC_VECTOR(4 DOWNTO 0) );
    END COMPONENT;

    COMPONENT MUX
        PORT ( Re, Rxor, Rou, Rs : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
               O1, O0            : IN  STD_LOGIC;
               S                 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0) );
    END COMPONENT;

    COMPONENT somasub
        PORT ( A, B                       : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
               EnA, EnB, InvA, InvB, C0   : IN  STD_LOGIC;
               E                          : OUT STD_LOGIC;
               Rs                         : OUT STD_LOGIC_VECTOR(4 DOWNTO 0) );
    END COMPONENT;

    COMPONENT uc
        PORT ( F                 : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
               EnA, EnB          : OUT STD_LOGIC;
               InvA, InvB, C0    : OUT STD_LOGIC;
               O1,  O0           : OUT STD_LOGIC );
    END COMPONENT;

    COMPONENT DISPLAY
        PORT ( valor              : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
               sinal              : IN  STD_LOGIC;
               digS, dig1, dig0   : OUT STD_LOGIC_VECTOR(0 TO 6) );
    END COMPONENT;
BEGIN
    -- instâncias
    UC_i : uc
        PORT MAP ( F, en_a, en_b, inv_a, inv_b, c0_i, sel1, sel0 );

    ARITH_i : somasub
        PORT MAP ( A, B, en_a, en_b, inv_a, inv_b, c0_i, E, arith_r );

    LOGIC_i : ul
        PORT MAP ( A, B, and_r, xor_r, or_r );

    MUX_i : MUX
        PORT MAP ( and_r, xor_r, or_r, arith_r, sel1, sel0, s_bus );

    DISP_i : DISPLAY
        PORT MAP ( s_bus, '1', sS, dSd, dSu );
END estruturada;

