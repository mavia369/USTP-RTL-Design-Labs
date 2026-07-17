module circuit_tb;

logic A, B, C;
logic F1, F2;

circuit dut(
    .A(A),
    .B(B),
    .C(C),
    .F1(F1),
    .F2(F2)
);

initial begin
    $dumpfile("circuit.vcd");
    $dumpvars(0, circuit_tb);

    A=0; B=0; C=0; #10;
    A=0; B=0; C=1; #10;
    A=0; B=1; C=0; #10;
    A=0; B=1; C=1; #10;
    A=1; B=0; C=0; #10;
    A=1; B=0; C=1; #10;
    A=1; B=1; C=0; #10;
    A=1; B=1; C=1; #10;

    $finish;
end

endmodule