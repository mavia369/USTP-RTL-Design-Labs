module decoder_3to8_tb;

logic A, B, C;
logic Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;

decoder_3to8 dut(
    .A(A), .B(B), .C(C),
    .Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3),
    .Y4(Y4), .Y5(Y5), .Y6(Y6), .Y7(Y7)
);

initial begin
    $dumpfile("decoder_3to8.vcd");
    $dumpvars(0, decoder_3to8_tb);

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