module half_subtractor_tb;

logic A, B;
logic DIFF, BORROW;

half_subtractor dut(
    .a(A),
    .b(B),
    .diff(DIFF),
    .borrow(BORROW)
);

initial begin
    $dumpfile("half_subtractor.vcd");
    $dumpvars(0, half_subtractor_tb);

    A=0; B=0; #10;
    A=0; B=1; #10;
    A=1; B=0; #10;
    A=1; B=1; #10;

    $finish;
end

endmodule