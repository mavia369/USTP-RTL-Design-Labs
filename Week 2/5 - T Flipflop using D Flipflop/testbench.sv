`timescale 1ns/1ps

module tb_d_to_t_flipflop;

logic clock;
logic reset;
logic t;
logic q;

d_to_t_flipflop dut(
    .clock(clock),
    .reset(reset),
    .t(t),
    .q(q)
);

always #5 clock = ~clock;

initial begin
    clock = 0;
    reset = 1;
    t = 0;

    #10;
    reset = 0;

    #10 t = 0;

    #10 t = 1;

    #20;

    t = 0;
    #20;

    t = 1;
    #20;

    $finish;
end

initial begin
    $dumpfile("d_to_t.vcd");
    $dumpvars(0, tb_d_to_t_flipflop);
end

endmodule