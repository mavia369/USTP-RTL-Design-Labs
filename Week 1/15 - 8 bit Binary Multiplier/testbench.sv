module multiplier_8bit_tb;

logic [7:0] A, B;
logic [15:0] P;

multiplier_8bit dut(
    .A(A),
    .B(B),
    .P(P)
);

initial begin
    $dumpfile("multiplier_8bit.vcd");
    $dumpvars(0, multiplier_8bit_tb);

    A = 8'd0;   B = 8'd0;   #10;   // P = 0
    A = 8'd5;   B = 8'd3;   #10;   // P = 15
    A = 8'd10;  B = 8'd10;  #10;   // P = 100
    A = 8'd15;  B = 8'd4;   #10;   // P = 60
    A = 8'd25;  B = 8'd12;  #10;   // P = 300
    A = 8'd255; B = 8'd2;   #10;   // P = 510

    $finish;
end

endmodule