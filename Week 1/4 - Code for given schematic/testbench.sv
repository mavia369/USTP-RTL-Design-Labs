module given_schematic_tb;

logic A, B, C;
logic Q;

given_schematic dut (
    .a(A),
    .b(B),
    .c(C),
    .q(Q)
);

initial begin
    $dumpfile("given_schematic.vcd");
    $dumpvars(0, given_schematic_tb);

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