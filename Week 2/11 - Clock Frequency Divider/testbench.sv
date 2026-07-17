`timescale 1ns/1ps

module tb_clock_divider;

logic clock;
logic reset;
logic clk_out;

clock_divider dut(
    .clock(clock),
    .reset(reset),
    .clk_out(clk_out)
);

always #5 clock = ~clock;

initial begin
    clock = 0;
    reset = 1;

    #10;
    reset = 0;

    #200;

    $finish;
end

initial begin
    $dumpfile("clock_divider.vcd");
    $dumpvars(0, tb_clock_divider);
end

endmodule