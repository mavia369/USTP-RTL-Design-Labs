module half_adder_tb;

logic A, B;
logic SUM, CARRY;

half_adder dut(
    .a(A),
    .b(B),
    .sum(SUM),
    .carry(CARRY)
);

initial begin
    $dumpfile("half_adder.vcd");
    $dumpvars(0, half_adder_tb);

    A=0; B=0; #10;
    A=0; B=1; #10;
    A=1; B=0; #10;
    A=1; B=1; #10;

    $finish;
end

endmodule