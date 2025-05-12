library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY FA IS
    port (
        A, B, Cin : in  STD_LOGIC;
        S, Cout   : out STD_LOGIC
    );
END ENTITY;

ARCHITECTURE dataflow OF FA IS
begin
    S    <= A xor B xor Cin;
    Cout <= (A and B) or (A and Cin) or (B and Cin);
end dataflow;
