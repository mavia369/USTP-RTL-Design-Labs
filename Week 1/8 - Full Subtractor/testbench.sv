module full_subtractor_tb;

logic A, B, BIN;
logic DIFF, BOUT;

full_subtractor dut(
    .a(A),
    .b(B),
    .bin(BIN),
    .diff(DIFF),
    .bout(BOUT)
);

initial begin
    $dumpfile("full_subtractor.vcd");
    $dumpvars(0, full_subtractor_tb);

    A=0; B=0; BIN=0; #10;
    A=0; B=0; BIN=1; #10;
    A=0; B=1; BIN=0; #10;
    A=0; B=1; BIN=1; #10;
    A=1; B=0; BIN=0; #10;
    A=1; B=0; BIN=1; #10;
    A=1; B=1; BIN=0; #10;
    A=1; B=1; BIN=1; #10;

    $finish;
end

endmodule