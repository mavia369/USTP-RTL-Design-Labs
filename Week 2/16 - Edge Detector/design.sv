module edge_detector(
    input  logic clock,
    input  logic reset,
    input  logic signal_in,
    output logic pos_edge,
    output logic neg_edge
);

logic previous_signal;

always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
        previous_signal <= 1'b0;
        pos_edge        <= 1'b0;
        neg_edge        <= 1'b0;
    end
    else begin
        pos_edge <= signal_in & ~previous_signal;
        neg_edge <= ~signal_in & previous_signal;
        previous_signal <= signal_in;
    end
end

endmodule