library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA is
    port (
        A, B, Cin : in  STD_LOGIC;
        S, Cout   : out STD_LOGIC
    );
end entity;

architecture dataflow of FA is
begin
    S    <= A xor B xor Cin;
    Cout <= (A and B) or (A and Cin) or (B and Cin);
end architecture;
