module priority_encoder_4to2(
    input  logic D3, D2, D1, D0,
    output logic Y1, Y0
);

always_comb begin
    if (D3) begin
        Y1 = 1;
        Y0 = 1;
    end
    else if (D2) begin
        Y1 = 1;
        Y0 = 0;
    end
    else if (D1) begin
        Y1 = 0;
        Y0 = 1;
    end
    else begin
        Y1 = 0;
        Y0 = 0;
    end
end

endmodule