module d_to_t_flipflop(
    input  logic clock,
    input  logic reset,
    input  logic t,
    output logic q
);

logic d;

assign d = t ^ q;

always_ff @(posedge clock or posedge reset) begin
    if (reset)
        q <= 1'b0;
    else
        q <= d;
end

endmodule

