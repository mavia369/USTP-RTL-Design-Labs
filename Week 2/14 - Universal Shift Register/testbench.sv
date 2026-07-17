`timescale 1ns/1ps

module tb_universal_shift_register;

logic clock;
logic reset;

logic [1:0] mode;

logic serial_left_in;
logic serial_right_in;

logic [3:0] parallel_in;

logic [3:0] q;

logic serial_left_out;
logic serial_right_out;

universal_shift_register dut(

    .clock(clock),
    .reset(reset),

    .mode(mode),

    .serial_left_in(serial_left_in),
    .serial_right_in(serial_right_in),

    .parallel_in(parallel_in),

    .q(q),

    .serial_left_out(serial_left_out),
    .serial_right_out(serial_right_out)

);

always #5 clock = ~clock;

initial begin

    clock = 0;

    reset = 1;
    mode = 2'b00;

    serial_left_in = 0;
    serial_right_in = 0;

    parallel_in = 4'b0000;

    #10;
    reset = 0;

    mode = 2'b11;
    parallel_in = 4'b1010;
    #10;

    mode = 2'b01;

    serial_left_in = 1; #10;
    serial_left_in = 0; #10;
    serial_left_in = 1; #10;

    mode = 2'b10;

    serial_right_in = 1; #10;
    serial_right_in = 0; #10;
    serial_right_in = 1; #10;

    mode = 2'b00;
    #20;

    $finish;

end

initial begin
    $dumpfile("universal_shift_register.vcd");
    $dumpvars(0, tb_universal_shift_register);
end

endmodule