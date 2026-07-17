module bidirectional_shift_register(
    input  logic clock,
    input  logic reset,
    input  logic direction,          
    input  logic serial_left_in,
    input  logic serial_right_in,
    output logic [3:0] q,
    output logic serial_left_out,
    output logic serial_right_out
);

always_ff @(posedge clock or posedge reset) begin
    if (reset)
        q <= 4'b0000;
    else begin
        if (direction == 1'b0)
            q <= {serial_left_in, q[3:1]};     
        else
            q <= {q[2:0], serial_right_in};   
    end
end

assign serial_left_out  = q[3];
assign serial_right_out = q[0];

endmodule