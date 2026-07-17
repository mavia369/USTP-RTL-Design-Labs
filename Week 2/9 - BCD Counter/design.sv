module bcd_counter(
    input  logic clock,
    input  logic reset,
    output logic [3:0] count
);

always_ff @(posedge clock or posedge reset) begin
    if (reset)
        count <= 4'd0;
    else if (count == 4'd9)
        count <= 4'd0;
    else
        count <= count + 1'b1;
end

endmodule