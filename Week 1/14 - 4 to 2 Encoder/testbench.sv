module encoder_4to2_tb;

logic D3, D2, D1, D0;
logic Y1, Y0;

encoder_4to2 dut(
    .D3(D3),
    .D2(D2),
    .D1(D1),
    .D0(D0),
    .Y1(Y1),
    .Y0(Y0)
);

initial begin
    $dumpfile("encoder_4to2.vcd");
    $dumpvars(0, encoder_4to2_tb);

    D3=0; D2=0; D1=0; D0=1; #10; // 00
    D3=0; D2=0; D1=1; D0=0; #10; // 01
    D3=0; D2=1; D1=0; D0=0; #10; // 10
    D3=1; D2=0; D1=0; D0=0; #10; // 11

    $finish;
end

endmodule