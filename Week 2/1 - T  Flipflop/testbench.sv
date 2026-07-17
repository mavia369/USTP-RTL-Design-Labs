`timescale 1ns/1ps

module t_flipflop_tb;

logic clk;
logic rst;
logic t;
logic q;

t_flipflop uut (
    .clk(clk),
    .rst(rst),
    .t(t),
    .q(q)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    t   = 0;

    #10;
    rst = 0;

    #10;
    t = 0;

    #10;
    t = 1;

    #40;

    t = 0;
    #20;

    t = 1;
    #30;

    $finish;
end

initial begin
    $dumpfile("t_flipflop.vcd");
    $dumpvars(0, t_flipflop_tb);
end

endmodule