module universal_shift_register(
    input  logic clock,
    input  logic reset,

    input  logic [1:0] mode,

    input  logic serial_left_in,
    input  logic serial_right_in,

    input  logic [3:0] parallel_in,

    output logic [3:0] q,

    output logic serial_left_out,
    output logic serial_right_out
);

always_ff @(posedge clock or posedge reset) begin

    if (reset)
        q <= 4'b0000;

    else begin
        case (mode)

            2'b00:
                q <= q;

            2'b01:
                q <= {serial_left_in, q[3:1]};

            2'b10:
                q <= {q[2:0], serial_right_in};

            2'b11:
                q <= parallel_in;

            default:
                q <= q;

        endcase
    end

end

assign serial_left_out  = q[3];
assign serial_right_out = q[0];

endmodule