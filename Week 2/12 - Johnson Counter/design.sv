module johnson_counter (
    input  logic clock,
    input  logic reset,
    output logic [3:0] q
);

  always_ff @(posedge clock or posedge reset) begin
    if (reset)
        q <= 4'b0000;               
    else
        q <= {q[2:0], ~q[3]};       
end

endmodule