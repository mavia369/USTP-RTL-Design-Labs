module full_adder_tb;

logic A, B, CIN;
logic SUM, COUT;

full_adder dut(
    .a(A),
    .b(B),
    .cin(CIN),
    .sum(SUM),
    .cout(COUT)
);

initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(0, full_adder_tb);

    A=0; B=0; CIN=0; #10;
    A=0; B=0; CIN=1; #10;
    A=0; B=1; CIN=0; #10;
    A=0; B=1; CIN=1; #10;
    A=1; B=0; CIN=0; #10;
    A=1; B=0; CIN=1; #10;
    A=1; B=1; CIN=0; #10;
    A=1; B=1; CIN=1; #10;

    $finish;
end

endmodule