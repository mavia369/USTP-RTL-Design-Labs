module mod_n_counter #(
    parameter N = 10
)(
    input  logic clock,
    input  logic reset,
    output logic [$clog2(N)-1:0] count
);

always_ff @(posedge clock or posedge reset) begin
    if (reset)
        count <= 0;
    else if (count == N-1)
        count <= 0;
    else
        count <= count + 1'b1;
end

endmodule