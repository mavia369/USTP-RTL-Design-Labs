`timescale 1ns/1ps

module tb_bidirectional_shift_register;

logic clock;
logic reset;
logic direction;
logic serial_left_in;
logic serial_right_in;

logic [3:0] q;
logic serial_left_out;
logic serial_right_out;

bidirectional_shift_register dut(
    .clock(clock),
    .reset(reset),
    .direction(direction),
    .serial_left_in(serial_left_in),
    .serial_right_in(serial_right_in),
    .q(q),
    .serial_left_out(serial_left_out),
    .serial_right_out(serial_right_out)
);

always #5 clock = ~clock;

initial begin
    clock = 0;
    reset = 1;
    direction = 0;
    serial_left_in = 0;
    serial_right_in = 0;

    #10;
    reset = 0;

    direction = 0;
    serial_left_in = 1; #10;
    serial_left_in = 0; #10;
    serial_left_in = 1; #10;
    serial_left_in = 1; #10;

    direction = 1;
    serial_right_in = 1; #10;
    serial_right_in = 0; #10;
    serial_right_in = 1; #10;
    serial_right_in = 0; #10;

    #20;

    $finish;
end

initial begin
    $dumpfile("bidirectional_shift_register.vcd");
    $dumpvars(0, tb_bidirectional_shift_register);
end

endmodule