`timescale 1ns/1ps

module tb_jk_flipflop;

logic clock;
logic reset;
logic j;
logic k;
logic q;

jk_flipflop dut (
    .clock(clock),
    .reset(reset),
    .j(j),
    .k(k),
    .q(q)
);

always #5 clock = ~clock;

initial begin
    clock = 0;
    reset = 1;
    j = 0;
    k = 0;

    #10;
    reset = 0;

    #10;
    j = 0;
    k = 0;

    #10;
    j = 1;
    k = 0;

    #10;
    j = 0;
    k = 1;


    #10;
    j = 1;
    k = 1;

    #20; 

    j = 0;
    k = 0;

    #20;

    $finish;
end

initial begin
    $dumpfile("jk_flipflop.vcd");
    $dumpvars(0, tb_jk_flipflop);
end

endmodule