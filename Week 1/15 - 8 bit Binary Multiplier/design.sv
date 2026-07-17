module multiplier_8bit(
    input  logic [7:0] A,
    input  logic [7:0] B,
    output logic [15:0] P
);

integer i;

always_comb begin
    P = 16'd0;

    for (i = 0; i < 8; i = i + 1) begin
        if (B[i])
            P = P + (A << i);
    end
end

endmodule