`timescale 1ns/1ps

module tb_bcd_counter;

logic clock;
logic reset;
logic [3:0] count;

bcd_counter dut (
    .clock(clock),
    .reset(reset),
    .count(count)
);

always #5 clock = ~clock;

initial begin
    clock = 0;
    reset = 1;

    #10;
    reset = 0;

    #120;

    reset = 1;
    #10;
    reset = 0;

    #50;

    $finish;
end

initial begin
    $dumpfile("bcd_counter.vcd");
    $dumpvars(0, tb_bcd_counter);
end

endmodule