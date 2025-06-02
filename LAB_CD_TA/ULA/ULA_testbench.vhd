-- Testbench para validação rápida da ULA
-- Este arquivo demonstra como testar as principais operações

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ULA_teste IS
END ULA_teste;

ARCHITECTURE teste OF ULA_teste IS
    COMPONENT ULA
        PORT (
            A, B    : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
            F       : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
            sS      : OUT STD_LOGIC_VECTOR(0 TO 6);
            dSd     : OUT STD_LOGIC_VECTOR(0 TO 6);
            dSu     : OUT STD_LOGIC_VECTOR(0 TO 6);
            E       : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL A_tb, B_tb : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL F_tb       : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL sS_tb      : STD_LOGIC_VECTOR(0 TO 6);
    SIGNAL dSd_tb     : STD_LOGIC_VECTOR(0 TO 6);
    SIGNAL dSu_tb     : STD_LOGIC_VECTOR(0 TO 6);
    SIGNAL E_tb       : STD_LOGIC;

BEGIN
    UUT: ULA PORT MAP (A_tb, B_tb, F_tb, sS_tb, dSd_tb, dSu_tb, E_tb);

    PROCESS
    BEGIN
        -- Teste 1: A = 5, B = 3, Operação = Soma (F=011)
        A_tb <= "00101"; B_tb <= "00011"; F_tb <= "011";
        WAIT FOR 10 ns;
        
        -- Teste 2: A = 10, B = 6, Operação = Subtração A-B (F=001)
        A_tb <= "01010"; B_tb <= "00110"; F_tb <= "001";
        WAIT FOR 10 ns;
        
        -- Teste 3: A = 3, B = 8, Operação = Subtração A-B (F=001) - Resultado negativo
        A_tb <= "00011"; B_tb <= "01000"; F_tb <= "001";
        WAIT FOR 10 ns;
        
        -- Teste 4: A = 12, B = 10, Operação = XOR (F=110)
        A_tb <= "01100"; B_tb <= "01010"; F_tb <= "110";
        WAIT FOR 10 ns;
        
        -- Teste 5: A = 15, B = 15, Operação = Soma (F=011) - Teste de overflow
        A_tb <= "01111"; B_tb <= "01111"; F_tb <= "011";
        WAIT FOR 10 ns;
        
        -- Teste 6: A = 12, Operação = Complemento (F=111)
        A_tb <= "01100"; B_tb <= "00000"; F_tb <= "111";
        WAIT FOR 10 ns;

        WAIT;
    END PROCESS;
END teste;
