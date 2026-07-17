module encoder_4to2(
    input logic D3, D2, D1, D0,
    output logic Y1, Y0
);

always_comb begin
    Y1 = D2 | D3;
    Y0 = D1 | D3;
end

endmodule
