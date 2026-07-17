module full_subtractor(
    input logic a, b, bin,
    output logic diff, bout
);

always_comb begin
    diff = a ^ b ^ bin;
    bout = (~a & b) | (~a & bin) | (b & bin);
end

endmodule