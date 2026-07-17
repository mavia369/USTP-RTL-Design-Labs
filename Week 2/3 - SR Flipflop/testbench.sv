`timescale 1ns/1ps

module tb_sr_flipflop;

logic clock;
logic reset;
logic s;
logic r;
logic q;

sr_flipflop dut (
    .clock(clock),
    .reset(reset),
    .s(s),
    .r(r),
    .q(q)
);

always #5 clock = ~clock;

initial begin
    clock = 0;
    reset = 1;
    s = 0;
    r = 0;

    #10;
    reset = 0;

    #10;
    s = 0;
    r = 0;

    #10;
    s = 1;
    r = 0;

    #10;
    s = 0;
    r = 1;

    #10;
    s = 1;
    r = 1;

    #10;

    s = 0;
    r = 0;

    #20;

    $finish;
end

initial begin
    $dumpfile("sr_flipflop.vcd");
    $dumpvars(0, tb_sr_flipflop);
end

endmodule