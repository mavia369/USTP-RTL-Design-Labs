module t_to_d_flipflop(
    input  logic clock,
    input  logic reset,
    input  logic d,
    output logic q
);

logic t;

assign t = d ^ q;

always_ff @(posedge clock or posedge reset) begin
    if (reset)
        q <= 1'b0;
    else if (t)
        q <= ~q;
    else
        q <= q;
end

endmodule

