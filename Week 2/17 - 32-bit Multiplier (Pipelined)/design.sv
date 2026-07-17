module pipelined_multiplier(
    input  logic        clock,
    input  logic        reset,
    input  logic [31:0] a,
    input  logic [31:0] b,
    output logic [63:0] product
);

logic [31:0] a_reg;
logic [31:0] b_reg;

always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
        a_reg <= 32'd0;
        b_reg <= 32'd0;
    end
    else begin
        a_reg <= a;
        b_reg <= b;
    end
end

always_ff @(posedge clock or posedge reset) begin
    if (reset)
        product <= 64'd0;
    else
        product <= a_reg * b_reg;
end

endmodule