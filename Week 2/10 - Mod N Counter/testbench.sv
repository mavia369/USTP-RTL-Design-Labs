`timescale 1ns/1ps

module tb_mod_n_counter;

parameter N = 8;

logic clock;
logic reset;
logic [$clog2(N)-1:0] count;

mod_n_counter #(.N(N)) dut (
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

    #100;

    reset = 1;
    #10;
    reset = 0;

    #50;

    $finish;
end

initial begin
    $dumpfile("mod_n_counter.vcd");
    $dumpvars(0, tb_mod_n_counter);
end

endmodule