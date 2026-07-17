`timescale 1ns/1ps

module tb_t_to_d_flipflop;

logic clock;
logic reset;
logic d;
logic q;

t_to_d_flipflop dut(
    .clock(clock),
    .reset(reset),
    .d(d),
    .q(q)
);

always #5 clock = ~clock;

initial begin
    clock = 0;
    reset = 1;
    d = 0;

    #10;
    reset = 0;

    #10 d = 0;
    #10 d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 d = 1;
    #10 d = 0;

    $finish;
end

initial begin
    $dumpfile("t_to_d.vcd");
    $dumpvars(0, tb_t_to_d_flipflop);
end

endmodule