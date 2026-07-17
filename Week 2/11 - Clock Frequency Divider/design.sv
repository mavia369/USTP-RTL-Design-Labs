module clock_divider(
    input  logic clock,
    input  logic reset,
    output logic clk_out
);

logic [1:0] count;

always_ff @(posedge clock or posedge reset) begin
    if (reset)
        count <= 2'b00;
    else
        count <= count + 1'b1;
end

assign clk_out = count[1];

endmodule