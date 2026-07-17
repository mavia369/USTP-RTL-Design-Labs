module circuit(
    input logic A, B, C,
    output logic F1, F2
);

logic T1, T2, F2_bar, T3;

always_comb begin
    T1     = A | B | C;
    T2     = A & B & C;

    F2     = (A & B) | (A & C) | (B & C);

    F2_bar = (~A | ~B) &
             (~A | ~C) &
             (~B | ~C);

    T3     = (A & ~B & ~C) |
             (~A & B & ~C) |
             (~A & ~B & C);

    F1     = (A & ~B & ~C) |
             (~A & B & ~C) |
             (~A & ~B & C) |
             (A & B & C);
end

endmodule