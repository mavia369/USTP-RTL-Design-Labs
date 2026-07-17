`timescale 1ns/1ps

module tb_edge_detector;

logic clock;
logic reset;
logic signal_in;
logic pos_edge;
logic neg_edge;

edge_detector dut(
    .clock(clock),
    .reset(reset),
    .signal_in(signal_in),
    .pos_edge(pos_edge),
    .neg_edge(neg_edge)
);

always #5 clock = ~clock;

initial begin
    clock = 0;
    reset = 1;
    signal_in = 0;

    #10;
    reset = 0;

    #10 signal_in = 0;
    #10 signal_in = 1;
    #20 signal_in = 1;
    #10 signal_in = 0;
    #20 signal_in = 0;
    #10 signal_in = 1;
    #20 signal_in = 0;

    #20;

    $finish;
end

initial begin
    $dumpfile("edge_detector.vcd");
    $dumpvars(0, tb_edge_detector);
end

endmodule